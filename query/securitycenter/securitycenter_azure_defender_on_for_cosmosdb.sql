select
  -- Required Columns
  sub_pricing.id as resource,
  case
    when pricing_tier = 'Standard' then 'ok'
    else 'alarm'
  end as status,
  case
    when pricing_tier = 'Standard' then 'Azure Defender on for Cosmos DB.'
    else 'Azure Defender off for Cosmos DB.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_security_center_subscription_pricing sub_pricing
  right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
where
  name = 'CosmosDbs';