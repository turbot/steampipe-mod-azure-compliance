select
  -- Required Columns
  s.id as resource,
  case
    when security -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when security -> 'properties' ->> 'state' = 'Disabled' then s.name || ' VA setting disabled.'
    else s.name || ' VA setting enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_server s,
  jsonb_array_elements(server_security_alert_policy) security,
  jsonb_array_elements(server_vulnerability_assessment) assessment,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id
order by
  status desc;