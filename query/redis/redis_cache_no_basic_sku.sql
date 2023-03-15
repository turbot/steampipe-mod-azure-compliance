select
  -- Required Columns
  c.id as resource,
  case
    when c.sku_name = 'Basic' then 'alarm'
    else 'ok'
  end as status,
  case
    when c.sku_name = 'Basic' then c.title || ' using basic SKU.'
    else c.title || ' using ' || sku_name  || ' SKU.'
  end as reason,
  -- Additional Dimensions
  c.resource_group,
  sub.display_name as subscription
from
  azure_redis_cache as c,
  azure_subscription as sub
where
  sub.subscription_id = c.subscription_id;