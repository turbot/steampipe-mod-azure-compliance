select
  -- Required Columns
  s.id as resource,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
    else 'ok'
  end as status,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then name || ' server parameter "log_disconnections" off.'
    else name || ' server parameter "log_disconnections" on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server s,
  jsonb_array_elements(server_configurations) config,
  azure_subscription sub
where
  config ->> 'Name' = 'log_disconnections'
  and sub.subscription_id = s.subscription_id;