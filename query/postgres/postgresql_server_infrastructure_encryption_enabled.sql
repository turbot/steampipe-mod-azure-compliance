select
  -- Required Columns
  s.id as resource,
  case
    when infrastructure_encryption = 'Enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when infrastructure_encryption = 'Enabled' then name || ' infrastructure encryption enabled.'
    else name || ' infrastructure encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;