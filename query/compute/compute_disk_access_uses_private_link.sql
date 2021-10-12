with compute_disk_connection as (
  select
    distinct a.id
  from
    azure_compute_disk_access as a,
    jsonb_array_elements(private_endpoint_connections) as connection
  where
    connection ->> 'PrivateLinkServiceConnectionStateStatus' = 'Approved'
)
select
  -- Required Columns
  b.id as resource,
  case
    when c.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.id is null then b.name || ' not uses private link.'
    else b.name || ' uses private link.'
  end as reason,
  -- Additional Dimensions
  resource_group
  --sub.display_name as subscription
from
  azure_compute_disk_access as b
  left join compute_disk_connection as c on b.id = c.id,
  azure_subscription as sub
where
  sub.subscription_id = b.subscription_id;