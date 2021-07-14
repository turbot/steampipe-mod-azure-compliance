select
  -- Required Columns
  s.id as resource,
  case
    when geo_redundant_backup = 'Enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when geo_redundant_backup = 'Enabled' then name || ' Geo-redundant backup enabled.'
    else  name || ' Geo-redundant backup disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;