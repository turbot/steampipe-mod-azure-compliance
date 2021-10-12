select
  -- Required Columns
  s.id as resource,
  case
    when sku_name = 'free' then 'alarm'
    else 'ok'
  end as status,
  case
    when sku_name = 'free' then s.title || ' SKU does not supports private link.'
    else s.title || ' SKU supports private link.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_search_service as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;