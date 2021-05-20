select
  -- Required Columns
  sub_pricing.id as resource,
  case
    when pricing_tier = 'Standard' then 'ok'
    else 'alarm'
  end as status,
  case
    when pricing_tier = 'Standard' then 'Azure Defender on for Storage.'
    else 'Azure Defender off for Storage.'
  end as reason,
  -- Additional Dimension
  coalesce(display_name, split_part(sub_pricing.subscription_id, '-', 5)) as subscription
from
  azure_security_center_subscription_pricing sub_pricing
  right join azure_subscription sub on sub_pricing.subscription_id = sub.subscription_id
where
  name = 'StorageAccounts';