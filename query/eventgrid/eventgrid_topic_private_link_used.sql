select
  -- Required Columns
  a.id as resource,
  case
    when public_network_access = 'Enabled' then 'alarm'
    when private_endpoint_connections is null then 'info'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when public_network_access = 'Enabled' then a.name || ' using public networks.'
    when private_endpoint_connections is null then a.name || ' no private link exists.'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
    then a.name || ' using private link.'
    else a.name || ' not using private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_eventgrid_topic a,
  azure_subscription sub;