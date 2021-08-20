select
  -- Required Columns
  vm.vm_id as resource,
  case
    when enable_automatic_updates then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_automatic_updates then vm.title || ' automatic system updates enabled.'
    else vm.title || ' automatic system updates disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm,
  azure_subscription sub
where
  sub.subscription_id = vm.subscription_id;