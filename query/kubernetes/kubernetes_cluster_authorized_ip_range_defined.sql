select
  -- Required Columns
  c.id as resource,
  case
    when api_server_access_profile -> 'AuthorizedIPRanges' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when api_server_access_profile -> 'AuthorizedIPRanges' is not null then c.title || ' authorized IP ranges defined.'
    else c.title || ' authorized IP ranges not defined.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_kubernetes_cluster as c,
  azure_subscription as sub
where
  sub.subscription_id = c.subscription_id;