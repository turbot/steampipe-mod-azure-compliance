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
  coalesce(sub.display_name, split_part(sa.subscription_id, '-', 5)) as subscription
from
  azure_storage_account sa
  join azure_subscription sub on sub.subscription_id = sa.subscription_id;