select
  -- Required Columns
  s.id as resource,
  case
    when public_network_access = 'Enabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when public_network_access = 'Enabled' then name || ' public network access enabled.'
    else name || ' public network access disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_mariadb_server as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;