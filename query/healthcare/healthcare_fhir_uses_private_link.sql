select
  -- Required Columns
  a.id as resource,
  case
    when private_endpoint_connections is null then 'info'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionState": "Approved"}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when private_endpoint_connections is null then a.name || ' no private link exists.'
    when private_endpoint_connections @>  '[{"privateLinkServiceConnectionState": "Approved"}]'::jsonb then a.name || ' using private link.'
    else a.name || ' not using private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_healthcare_service a,
  azure_subscription sub;
