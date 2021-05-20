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
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_compute_disk disk
  join azure_subscription sub on sub.subscription_id = disk.subscription_id
where
  disk_state = 'Attached';