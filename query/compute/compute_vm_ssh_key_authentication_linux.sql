with vm_ssh_key_auth as (
  select
    distinct a.vm_id
  from
    azure_compute_virtual_machine as a,
    jsonb_array_elements(guest_configuration_assignments) as b
   where
    b -> 'guestConfiguration' ->> 'name'= 'LinuxNoPasswordForSSH'
    and b ->> 'complianceStatus' = 'Compliant'
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when a.os_type <> 'Linux' then 'skip'
    when b.vm_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_type <> 'Linux' then a.title || ' is of ' || a.os_type || ' operating system.'
    when b.vm_id is not null then a.title || ' have SSH keys authentication.'
    else a.title || ' does not have SSH keys authentication.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join vm_ssh_key_auth as b on a.vm_id = b.vm_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;