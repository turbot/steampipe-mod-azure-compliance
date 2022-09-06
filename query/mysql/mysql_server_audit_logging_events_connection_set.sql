select
  -- Required Columns
  s.id as resource,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') = 'connection' then 'ok'
    else 'alarm'
  end as status,
  case
    when lower(config -> 'ConfigurationProperties' ->> 'value') = 'connection' then s.name || ' server parameter audit_log_events has connection set.'
    else s.name || ' server parameter audit_log_events connection not set.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_mysql_server as s,
  jsonb_array_elements(server_configurations) config,
  azure_subscription sub
where
  config ->> 'Name' = 'audit_log_events'
  and sub.subscription_id = s.subscription_id;