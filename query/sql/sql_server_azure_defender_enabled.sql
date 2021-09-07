with sql_server_policy as (
  select
    distinct a.name
  from
    azure_sql_server as a,
    jsonb_array_elements(server_security_alert_policy) as policy
  where
    policy ->> 'name' = 'Default'
    and policy -> 'properties' ->> 'state' = 'Enabled'
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when kind like '%analytics%' then 'skip'
    when s.name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when kind like '%analytics%' then a.name || ' azure defender not applicable.'
    when s.name is null then a.name || 'sql azure defender disabled.'
    else a.name || ' sql azure defender enabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_sql_server as a
  left join sql_server_policy as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;