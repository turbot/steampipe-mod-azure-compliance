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
  coalesce(sub.display_name, split_part(vm.subscription_id, '-', 5)) as subscription
from
  azure_compute_virtual_machine vm
  join azure_subscription sub on sub.subscription_id = vm.subscription_id