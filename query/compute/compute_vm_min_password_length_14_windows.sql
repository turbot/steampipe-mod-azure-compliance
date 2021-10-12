with vm_min_password_age as (
  select
    distinct a.vm_id
  from
    azure_compute_virtual_machine as a,
    jsonb_array_elements(guest_configuration_assignments) as b
  where
    b -> 'guestConfiguration' ->> 'name'= 'MinimumPasswordLength'
    and b ->> 'complianceStatus' = 'Compliant'
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when a.os_type <> 'Windows' then 'skip'
    when b.vm_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
    when b.vm_id is not null then a.title || ' minimum password length is 14 characters.'
    else a.title || ' minimum password length is not 14 characters.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join vm_min_password_age as b on a.vm_id = b.vm_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;