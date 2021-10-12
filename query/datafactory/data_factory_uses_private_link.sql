with data_factory_connection as (
  select
    distinct a.id
  from
    azure_data_factory as a,
    jsonb_array_elements(private_endpoint_connections) as connection
  where
    connection ->> 'PrivateLinkServiceConnectionStateStatus' = 'Approved'
)
select
  -- Required Columns
  a.id as resource,
  case
    when c.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.id is null then a.name || ' not uses private link.'
    else a.name || ' uses private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_data_factory as a
  left join data_factory_connection as c on c.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;