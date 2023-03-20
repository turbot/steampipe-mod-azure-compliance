select
  -- Required Columns
  l.id as resource,
  case
    when l.sku_name = 'Basic' then 'alarm'
    else 'ok'
  end as status,
  case
    when l.sku_name = 'Basic' then l.title || ' using basic SKU.'
    else l.title || ' using ' || sku_name  || ' SKU.'
  end as reason,
  -- Additional Dimensions
  l.resource_group,
  sub.display_name as subscription
from
  azure_lb as l,
  azure_subscription as sub
where
  sub.subscription_id = l.subscription_id;