select
  -- Required Columns
  kc.id as resource,
  case
    when enable_rbac then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_rbac then name || ' role based access control enabled.'
    else name || ' role based access control disabled.'
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
