select
  -- Required Columns
  a.id as resource,
  case
    -- Only applicable to standard tier
    when sku_name = 'free' then 'skip'
    -- All networks, including the internet and private endpoints, can access this resource
    -- Checking if all network enabled and no private endpoint then it's public access
    when public_network_access = 'Enabled' and private_endpoint_connections is null then 'alarm'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when sku_name = 'free' then a.name || ' is of ' || sku_name || ' tier.'
    when public_network_access = 'Enabled' and private_endpoint_connections is null then ' using public networks.'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' using private link.'
    else a.name || ' not using private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_configuration a,
  azure_subscription sub;
