select
  -- Required Columns
  id as resource,
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
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server,
  jsonb_array_elements(server_audit_policy) as audit;