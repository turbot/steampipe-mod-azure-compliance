select
  -- Required Columns
  s.id as resource,
  case
    when require_infrastructure_encryption then 'ok'
    else 'alarm'
  end as status,
  case
    when require_infrastructure_encryption then name || ' infrastructure encryption enabled.'
    else name || ' infrastructure encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;