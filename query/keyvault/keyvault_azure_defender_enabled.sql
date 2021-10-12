select
  -- Required Columns
  pricing.id as resource,
  case
    when name = 'KeyVaults' and pricing_tier = 'Standard' then 'ok'
    else 'alarm'
  end as status,
  case
    when name = 'KeyVaults' and pricing_tier = 'Standard' then 'KeyVaults azure defender enabled.'
    else name || 'KeyVaults azure defender disabled.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_security_center_subscription_pricing as pricing,
  azure_subscription as sub
where
  sub.subscription_id = pricing.subscription_id
  and name = 'KeyVaults';