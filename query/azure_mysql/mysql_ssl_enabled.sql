select
  -- Required Columns
  mysql_server.id as resource,
  case
    when ssl_enforcement = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when ssl_enforcement = 'Disabled' then mysql_server.name || ' SSL connection disabled.'
    else mysql_server.name || ' SSL connection enabled.'
  end as reason,
  -- Additional Dimensions
  mysql_server.resource_group,
  coalesce(display_name, split_part(mysql_server.subscription_id, '-', 5)) as subscription
from
  azure_mysql_server mysql_server
  join azure_subscription sub on sub.subscription_id = mysql_server.subscription_id