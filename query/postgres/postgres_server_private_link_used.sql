select
  -- Required Columns
  a.id as resource,
  case
    -- Only applicable to standard tier
    when sku_tier = 'Basic' then 'skip'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when sku_tier = 'Basic' then a.name || ' is of ' || sku_tier || ' tier.'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' using private link.'
    else a.name || ' not using private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_postgresql_server a,
  azure_subscription sub;