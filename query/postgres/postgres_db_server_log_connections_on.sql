select
  -- Required Columns
  s.id as resource,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
    else 'ok'
  end as status,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then s.name || ' server parameter log_connections off.'
    else s.name || ' server parameter log_connections on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server s,
  jsonb_array_elements(server_configurations) config,
  azure_subscription sub
where
  config ->> 'Name' = 'log_connections'
  and sub.subscription_id = s.subscription_id;