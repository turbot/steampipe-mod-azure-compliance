select
  -- Required Columns
  s.id as resource,
  case
    when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then 'alarm'
    else 'ok'
  end as status,
  case
    when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then s.name || ' log files are retained for 3 days or lesser.'
    else s.name || ' log files are retained for more than 3 days.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server s,
  jsonb_array_elements(server_configurations) as config,
  azure_subscription sub
where
  config ->> 'Name' = 'log_retention_days'
  and sub.subscription_id = s.subscription_id;