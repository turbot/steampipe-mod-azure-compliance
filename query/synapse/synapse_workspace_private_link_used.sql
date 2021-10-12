select
  -- Required Columns
  a.id as resource,
  case
    when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]' then 'ok'
    else 'alarm'
  end as status,
  case
    when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]' then a.name || ' uses private link.'
    else a.name || ' not uses private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_synapse_workspace as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;