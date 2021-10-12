select
  -- Required Columns
  kc.id as resource,
  case
    when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when addon_profiles -> 'azurepolicy' ->> 'enabled' = 'true' then name || ' add on azure policy enabled.'
    else name || ' add on azure policy disabled.'
  end as reason,
  -- Additional Dimensions
  enable_rbac,
  resource_group,
  sub.display_name as subscription
from
  azure_kubernetes_cluster kc,
  azure_subscription sub
where
  sub.subscription_id = kc.subscription_id;
