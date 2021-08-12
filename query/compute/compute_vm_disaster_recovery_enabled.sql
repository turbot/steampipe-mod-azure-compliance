with vm_dr_enabled as (
  select
    substr(source_id, 0, length(source_id)) as source_id
  from
    azure_resource_link as l
    left join azure_compute_virtual_machine as vm on lower(substr(source_id, 0, length(source_id)))= lower(vm.id)
  where
    l.name like 'ASR-Protect-%'
)
select
  -- Required Columns
  vm.vm_id as resource,
  case
    when l.source_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when l.source_id is null then vm.title || ' disaster recovery disabled.'
    else vm.title || ' disaster recovery enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm
  left join vm_dr_enabled as l on lower(vm.id) = lower(l.source_id),
  azure_subscription sub
where
  sub.subscription_id = vm.subscription_id;