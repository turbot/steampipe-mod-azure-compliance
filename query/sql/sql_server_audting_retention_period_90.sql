select
  -- Required Columns
  s.id as resource,
  case
    when (audit -> 'properties' ->> 'retentionDays')::integer = 0 then 'ok'
    when (audit -> 'properties' ->> 'retentionDays')::integer <= 90 then 'alarm'
    else 'ok'
  end as status,
  case
    when (audit -> 'properties' ->> 'retentionDays')::integer = 0 then name || ' audit retention set to unlimited days.'
    when (audit -> 'properties' ->> 'retentionDays')::integer <= 90 then name || ' audit retention less than 90 days.'
    else  name || ' audit retention greater than 90 days.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_server s,
  jsonb_array_elements(server_audit_policy) audit,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id;