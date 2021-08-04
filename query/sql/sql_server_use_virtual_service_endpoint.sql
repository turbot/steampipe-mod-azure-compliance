with sql_server_subnet as (
  select
    distinct a.name,
    rule -> 'properties' -> 'virtualNetworkSubnetId' as subnet_id
  from
    azure_sql_server as a,
    jsonb_array_elements(virtual_network_rules) as rule
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when s.name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when s.name is null then a.name || ' not configured with virtual service endpoint.'
    else a.name || ' configured with virtual service endpoint.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_sql_server as a
  left join sql_server_subnet as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;