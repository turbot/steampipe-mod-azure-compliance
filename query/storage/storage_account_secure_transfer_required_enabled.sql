select
  -- Required Columns
  id as resource,
  case
    when not enable_https_traffic_only then 'alarm'
    else 'ok'
  end as status,
  case
    when not enable_https_traffic_only then name || ' encryption in transit not enabled.'
    else name || ' encryption in transit enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;