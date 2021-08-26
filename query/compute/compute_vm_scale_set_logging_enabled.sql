with logging_details as (
  select
    distinct a.id as vm_scale_set_id
  from
    azure_compute_virtual_machine_scale_set as a,
    jsonb_array_elements(extensions) as b
  where
    (b ->> 'Publisher' = 'Microsoft.Azure.Diagnostics'
    and b ->> 'ExtensionType' = 'IaaSDiagnostics'
    or
    (b ->> 'Publisher' = any(ARRAY ['Microsoft.OSTCExtensions', 'Microsoft.Azure.Diagnostics']))
    and b ->> 'ExtensionType' = 'LinuxDiagnostic')

)
select
  -- Required Columns
  a.id as resource,
  case
    when b.vm_scale_set_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.vm_scale_set_id is not null then a.title || ' logging enabled.'
    else a.title || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine_scale_set as a
  left join logging_details as b on a.id = b.vm_scale_set_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;