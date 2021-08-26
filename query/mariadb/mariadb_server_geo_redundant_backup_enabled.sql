select
  -- Required Columns
  s.id as resource,
  case
    when s.geo_redundant_backup_enabled = 'Enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when s.geo_redundant_backup_enabled = 'Enabled' then s.title || ' geo-redundant backup enabled.'
    else s.title || ' geo-redundant backup disabled.'
  end as reason,
  -- Additional Dimensions
  s.resource_group,
  sub.display_name as subscription
from
  azure_mariadb_server as s
  join azure_subscription as sub on sub.subscription_id = s.subscription_id;