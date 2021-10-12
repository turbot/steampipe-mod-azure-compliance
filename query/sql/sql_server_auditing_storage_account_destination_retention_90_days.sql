with sql_server as(
  select
    id,
    name,
    subscription_id,
    resource_group,
    p -> 'properties' ->> 'retentionDays' as retentionDays
  from
    azure_sql_server,
    jsonb_array_elements(server_audit_policy) as p
  where
  p -> 'properties' ->> 'state' = 'Enabled'
  and p -> 'properties' ->> 'storageEndpoint' is not null
)
select
  -- Required Columns
  a.id as resource,
  case
    when s.id is null then 'skip'
    when s.retentionDays::Integer >= 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when s.id is null then a.name || ' auditing to storage account destination not enabled.'
    when s.retentionDays::Integer >= 90 then a.name || ' auditing to storage account destination configured with 90 days retention or higher.'
    else a.name || ' auditing to storage account destination not configured with 90 days retention or higher.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_sql_server as a
  left join sql_server as s on s.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;