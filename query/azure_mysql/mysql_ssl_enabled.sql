select
  -- Required Columns
  id as resource,
  case
    when ssl_enforcement = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when ssl_enforcement = 'Disabled' then name || ' SSL connection disabled.'
    else name || ' SSL connection enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_mysql_server;