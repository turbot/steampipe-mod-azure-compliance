select
  -- Required Columns
  vm.vm_id as resource,
  case
    when resource_group is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when resource_group is not null then vm.title || ' uses azure resource manager.'
    else vm.title || ' not uses azure resource manager.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm,
  azure_subscription as sub
where
  sub.subscription_id = vm.subscription_id;