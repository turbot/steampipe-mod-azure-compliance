select
  -- Required Columns
  kv.id as resource,
  case
    when enable_double_encryption then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_double_encryption then name || ' double encryption enabled.'
    else name || ' double encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_kusto_cluster as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;