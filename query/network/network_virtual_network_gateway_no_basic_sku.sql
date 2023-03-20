select
  -- Required Columns
  g.id as resource,
  case
    when g.sku_name = 'Basic' then 'alarm'
    else 'ok'
  end as status,
  case
    when g.sku_name = 'Basic' then g.title || ' using basic SKU.'
    else g.title || ' using ' || sku_name  || ' SKU.'
  end as reason,
  -- Additional Dimensions
  g.resource_group,
  sub.display_name as subscription
from
  azure_virtual_network_gateway as g,
  azure_subscription as sub
where
  sub.subscription_id = g.subscription_id;