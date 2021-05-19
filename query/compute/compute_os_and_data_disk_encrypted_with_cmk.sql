select
  -- Required Columns
  id as resource,
  case
    when encryption_type = 'EncryptionAtRestWithCustomerKey' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_type = 'EncryptionAtRestWithCustomerKey' then name || ' encrypted with CMK.'
      else name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_compute_disk
where
  disk_state = 'Attached';