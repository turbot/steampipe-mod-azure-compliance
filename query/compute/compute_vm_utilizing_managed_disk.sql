select
  -- Required Columns
  vm.id as resource,
  case
    when managed_disk_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when managed_disk_id is null then vm.name || ' VM not utilizing managed disks.'
    else vm.name || ' VM utilizing managed disks.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm,
  azure_subscription as sub
where
  sub.subscription_id = vm.subscription_id;