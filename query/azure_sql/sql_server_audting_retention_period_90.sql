select
  -- Required Columns
  id as resource,
  case
    when (audit -> 'properties' ->> 'retentionDays')::integer <= 90 then 'alarm'
    else 'ok'
  end as status,
  case
    when (audit -> 'properties' ->> 'retentionDays')::integer <= 90 then name || ' audit retention less than 90 days.'
    else  name || ' audit retention greater than 90 days.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server,
  jsonb_array_elements(server_audit_policy) as audit;
