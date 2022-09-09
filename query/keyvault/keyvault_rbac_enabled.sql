select
  -- Required Columns
  kv.id as resource,
  case
    when enable_rbac_authorization then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_rbac_authorization then name || ' has RBAC enabled.'
    else name || ' have RBAC disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;