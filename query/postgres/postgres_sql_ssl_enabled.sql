select
  -- Required Columns
  s.id as resource,
  case
    when ssl_enforcement = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when ssl_enforcement = 'Disabled' then name || ' SSL connection disabled.'
    else  name || ' SSL connection enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server s,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id;