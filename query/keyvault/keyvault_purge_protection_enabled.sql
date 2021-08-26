select
  -- Required Columns
  kv.id as resource,
  case
    when purge_protection_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when purge_protection_enabled then name || ' purge protection enabled.'
    else name || ' purge protection disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;