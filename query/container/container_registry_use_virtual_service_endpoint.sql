with container_registry_subnet as (
  select
    distinct a.name,
    rule ->> 'id' as id
  from
    azure_container_registry as a,
    jsonb_array_elements(network_rule_set -> 'virtualNetworkRules') as rule,
    azure_subnet as subnet
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when network_rule_set ->> 'defaultAction' <> 'Deny' then 'alarm'
    when s.name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when network_rule_set ->> 'defaultAction' <> 'Deny' then a.name || ' not configured with virtual service endpoint.'
    when s.name is null then a.name || ' not configured with virtual service endpoint.'
    else a.name || ' configured with virtual service endpoint.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_container_registry as a
  left join container_registry_subnet as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;