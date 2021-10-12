 with compute_machine as(
  select
    id,
    name,
    subscription_id,
    resource_group,c
  from
    azure_compute_virtual_machine,
    jsonb_array_elements(guest_configuration_assignments) as e,
    jsonb_array_elements(e -> 'guestConfiguration' -> 'configurationParameter') as c
  where
    e ->> 'name' = 'AuditSecureProtocol'
    and e ->> 'complianceStatus' = 'Compliant'
    and c ->> 'name' = 'MinimumTLSVersion'
    and c ->> 'value' = '1.3'
)
select
  -- Required Columns
  a.id as resource,
  case
    when a.os_type <> 'Windows' then 'skip'
    when m.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_type <> 'Windows' then a.name || ' is of ' || a.os_type || ' operating system.'
    when m.id is not null then a.name || ' configured to use secure communication protocols.'
    else a.name || ' not configured to use secure communication protocols.'
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