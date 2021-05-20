select
  -- Required Columns
  disk.id as resource,
  case
    when encryption_type = 'EncryptionAtRestWithCustomerKey' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_type = 'EncryptionAtRestWithCustomerKey' then disk.name || ' encrypted with CMK.'
    else disk.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_disk disk,
  azure_subscription sub
where
  disk_state = 'Attached'
  and sub.subscription_id = disk.subscription_id;