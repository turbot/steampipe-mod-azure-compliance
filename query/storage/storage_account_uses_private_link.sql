with storage_account_connection as (
  select
    distinct a.name
  from
    azure_storage_account as a,
    jsonb_array_elements(private_endpoint_connections) as connection
  where
    connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved'
)
select
  -- Required Columns
  distinct a.name as resource,
  case
    when s.name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when s.name is null then a.name || ' not uses private link.'
    else a.name || ' uses private link.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_storage_account as a
  left join storage_account_connection as s on a.name = s.name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;