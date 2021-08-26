select
  -- Required Columns
  s.id as resource,
  case
    when ssl_enforcement = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when ssl_enforcement = 'Disabled' then s.name || ' SSL connection disabled.'
    else s.name || ' SSL connection enabled.'
  end as reason,
  -- Additional Dimensions
  s.resource_group,
  sub.display_name as subscription
from
  azure_mysql_server as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;