with keyvault_vault_subnet as (
  select
    distinct a.name,
    rule ->> 'id' as id
  from
    azure_key_vault as a,
    jsonb_array_elements(network_acls -> 'virtualNetworkRules') as rule
  where
    rule ->> 'id' is not null
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when network_acls ->> 'defaultAction' <> 'Deny' then 'alarm'
    when s.name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when network_acls ->> 'defaultAction' <> 'Deny' then a.name || ' not configured with virtual service endpoint.'
    when s.name is null then a.name || ' not configured with virtual service endpoint.'
    else a.name || ' configured with virtual service endpoint.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_key_vault as a
  left join keyvault_vault_subnet as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;