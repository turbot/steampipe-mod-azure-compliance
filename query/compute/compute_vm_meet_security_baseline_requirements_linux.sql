with compute_machine as(
  select
    id,
    name,
    subscription_id,
    resource_group
  from
    azure_compute_virtual_machine,
    jsonb_array_elements(guest_configuration_assignments) as e
  where
    e ->> 'name' = 'AzureLinuxBaseline'
    and e ->> 'complianceStatus' = 'Compliant'
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when a.os_type <> 'Linux' then 'skip'
    when m.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_type <> 'Linux' then a.name || ' is of ' || a.os_type || ' operating system.'
    when m.id is not null then a.name || ' meet requirements for azure compute security baseline.'
    else a.name || ' does not meet requirements for azure compute security baseline.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join compute_machine as m on m.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;