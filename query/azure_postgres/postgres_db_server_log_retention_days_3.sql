select
  -- Required Columns
  id as resource,
  case
    when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then 'alarm'
    else 'ok'
  end as status,
  case
    when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then name || ' log files are retained for 3 days or lesser.'
    else name || ' log files are retained for more than 3 days.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_postgresql_server,
  jsonb_array_elements(server_configurations) as config
where
  config ->> 'Name' = 'log_retention_days';