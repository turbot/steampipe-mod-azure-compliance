with storage_account_subnet as (
  select
    distinct a.name,
    rule ->> 'id' as id
  from
    azure_storage_account as a,
    jsonb_array_elements(virtual_network_rules) as rule,
    azure_subnet as subnet,
    jsonb_array_elements(service_endpoints) as endpoints
  where
    endpoints ->> 'service'  like '%Microsoft.Storage%'
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when s.name is not null and network_rule_default_action = 'Deny' then 'ok'
    else 'alarm'
  end as status,
  case
    when s.name is not null and network_rule_default_action = 'Deny' then a.name ||  ' configured with virtual service endpoint.'
    else a.name || ' not configured with virtual service endpoint.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_storage_account as a
  left join storage_account_subnet as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;