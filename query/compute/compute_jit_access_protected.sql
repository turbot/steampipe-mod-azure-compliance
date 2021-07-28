with compute as (
select
  vm.id as resource,
  'alarm' as status,
  vm.name || ' not JIT protected.' as reason,
  vm.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm,
  azure_subscription sub
where
  vm.subscription_id = sub.subscription_id
)
select
  distinct vm.id as resource,
  case
    when lower(vm.id) = lower(vms ->> 'id') then 'ok'
    else 'alarm'
  end as status,
  case
    when lower(vms ->> 'id') = lower(vm.id) then vm.name || ' JIT protected.'
    else vm.name || ' not JIT protected.'
  end as reason,
  vm.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm,
  azure_security_center_jit_network_access_policy as jit,
  jsonb_array_elements(virtual_machines) as vms,
  azure_subscription as sub
  left join compute on true
where
  jit.subscription_id = sub.subscription_id;