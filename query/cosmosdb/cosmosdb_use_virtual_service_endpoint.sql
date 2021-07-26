with cosmosdb_with_virtual_network as (
  select
    distinct a.id
  from
    azure_cosmosdb_account as a,
    jsonb_array_elements(virtual_network_rules) as rule
  where
    rule ->> 'id' is not null
)
select
  -- Required Columns
  a.id as resource,
  case
    when c.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.id is null then a.name || ' not configured with virtual network service endpoint.'
    else a.name || ' configured with virtual network service endpoint.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cosmosdb_account as a
  left join cosmosdb_with_virtual_network as c on c.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;