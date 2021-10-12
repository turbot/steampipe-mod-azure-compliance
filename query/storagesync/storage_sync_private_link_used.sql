with storagesync_service_connection as (
  select
    distinct a.id
  from
    azure_storage_sync as a,
    jsonb_array_elements(private_endpoint_connections) as connection
  where
    connection -> 'PrivateLinkServiceConnectionState' ->> 'status' = 'Approved'
)
select
  -- Required Columns
  a.id as resource,
  case
    when incoming_traffic_policy = 'AllowAllTraffic' then 'alarm'
    when c.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when incoming_traffic_policy = 'AllowAllTraffic' then a.name || ' using public networks.'
    when c.id is null then a.name || ' not uses private link.'
    else a.name || ' uses private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_sync as a
  left join storagesync_service_connection as c on c.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;



