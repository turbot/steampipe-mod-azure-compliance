select
  -- Required Columns
  kv.id as resource,
  case
    when soft_delete_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when soft_delete_enabled then name || ' soft delete enabled.'
    else name || ' soft delete disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;