select
  -- Required Columns
  sa.id as resource,
  case
    when not blob_soft_delete_enabled then 'alarm'
    else 'ok'
  end as status,
  case
    when not blob_soft_delete_enabled then sa.name || ' blobs soft delete disabled.'
    else sa.name || ' blobs soft delete enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;