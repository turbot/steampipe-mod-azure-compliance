select
  -- Required Columns
  a.id as resource,
  case
  -- Having private_endpoint_connections will not permit vault to use the same.
  -- In case'defaultAction' = 'Allow', All Network including internet is allowed, which will not satisfy the private endpoint connection.
  -- Default All network will have not network_acls associated.
    when network_acls is null or network_acls ->> 'defaultAction' = 'Allow' then 'alarm'
    when private_endpoint_connections is null then 'info'
    when private_endpoint_connections @> '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]' then 'ok'
    else 'alarm'
  end as status,
  case
    when network_acls is null or network_acls ->> 'defaultAction' = 'Allow' then a.name || ' using public networks.'
    when private_endpoint_connections is null then a.name || ' no private link exists.'
    when private_endpoint_connections @>  '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]'
    then a.name || ' using private link.'
    else a.name || ' private link not enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault a,
  azure_subscription sub;