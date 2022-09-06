select
  -- Required Columns
  kv.id as resource,
  case
    when jsonb_array_length(private_endpoint_connections) !=0 and private_endpoint_connections @>  '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
    else 'alarm'
  end as status,
  case
    when jsonb_array_length(private_endpoint_connections) !=0 and private_endpoint_connections @>  '[{"PrivateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then name || ' using private endpoint connection.'
    else name || ' not using private endpoint connection.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;