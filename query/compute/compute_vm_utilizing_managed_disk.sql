select
  -- Required Columns
  id as resource,
  case
    when managed_disk_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when managed_disk_id is null then name || ' VM not utilizing managed disks.'
    else name || ' VM utilizing managed disks.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_compute_virtual_machine;