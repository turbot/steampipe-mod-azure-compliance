select
  -- Required Columns
  id as resource,
  case
    when not blob_soft_delete_enabled then 'alarm'
    else 'ok'
  end as status,
  case
    when not blob_soft_delete_enabled then name || ' blobs soft delete disabled.'
    else name || ' blobs soft delete enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;