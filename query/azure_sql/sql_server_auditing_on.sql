select
  -- Required Columns
  s.id as resource,
  case
    when audit -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when audit -> 'properties' ->> 'state' = 'Disabled' then name || ' auditing disabled.'
    else name || ' auditing enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_server s
  cross join jsonb_array_elements(server_audit_policy) audit
  join azure_subscription sub on sub.subscription_id = s.subscription_id