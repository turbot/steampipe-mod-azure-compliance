select
  -- Required Columns
  i.id as resource,
  case
    when i.sku_name = 'Basic' then 'alarm'
    else 'ok'
  end as status,
  case
    when i.sku_name = 'Basic' then i.title || ' using basic SKU.'
    else i.title || ' using ' || sku_name  || ' SKU.'
  end as reason,
  -- Additional Dimensions
  i.resource_group,
  sub.display_name as subscription
from
  azure_public_ip as i,
  azure_subscription as sub
where
  sub.subscription_id = i.subscription_id;