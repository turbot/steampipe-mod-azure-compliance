select
  -- Required Columns
  id as resource,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
    else 'ok'
  end as status,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then name || ' server parameter "connection_throttling" off.'
    else name || ' server parameter "connection_throttling" on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_postgresql_server,
  jsonb_array_elements(server_configurations) as config
where
  config ->> 'Name' = 'connection_throttling';