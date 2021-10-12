with gc_installed_vm as (
  select
    distinct a.vm_id,
    title
  from
    azure_compute_virtual_machine as a,
    jsonb_array_elements(extensions) as b
  where
    b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when b.vm_id is null then 'skip'
    when b.vm_id is not null and string_to_array(identity ->> 'type' , ', ') @> array['SystemAssigned'] then 'ok'
    else 'alarm'
  end as status,
  case
    when b.vm_id is null then a.title || ' guest configuration extension not installed.'
    when b.vm_id is not null and string_to_array(identity ->> 'type' , ', ') @> array['SystemAssigned'] then a.title || ' guest configuration extension installed with system-assigned managed identity.'
    else a.title || ' guest configuration extension not installed with system-assigned managed identity.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join gc_installed_vm as b on a.vm_id = b.vm_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;

