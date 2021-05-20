select
  -- Required Columns
  id as resource,
  case
    when security -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when security -> 'properties' ->> 'state' = 'Disabled' then name || ' VA setting disabled.'
    else name || ' VA setting enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server,
  jsonb_array_elements(server_security_alert_policy) as security,
  jsonb_array_elements(server_vulnerability_assessment) as assessment;
