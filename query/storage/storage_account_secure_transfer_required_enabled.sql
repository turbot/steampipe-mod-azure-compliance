select
  -- Required Columns
  sa.id as resource,
  case
    when not enable_https_traffic_only then 'alarm'
    else 'ok'
  end as status,
  case
    when not enable_https_traffic_only then sa.name || ' encryption in transit not enabled.'
    else sa.name || ' encryption in transit enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;