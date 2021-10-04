with cognitive_account as (
  select
    distinct a.id
  from
    azure_cognitive_account as a,
    jsonb_array_elements(capabilities ) as c
  where
    c ->> 'name' =  'VirtualNetworks'
),
cognitive_account_connections as (
  select
    distinct a.id
  from
    cognitive_account as a
    left join azure_cognitive_account as b on a.id =  b.id,
    jsonb_array_elements(private_endpoint_connections ) as c
  where
    c -> 'PrivateLinkServiceConnectionState' ->> 'status' =  'Approved'
)
select
  -- Required Columns
  b.id as resource,
  case
    when jsonb_array_length(b.private_endpoint_connections) = 0 then 'info'
    when c.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when jsonb_array_length(b.private_endpoint_connections) = 0 then b.name || ' no private link exists.'
    when c.id is not null then b.name || ' uses private link.'
    else b.name || ' not uses private link.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cognitive_account as b
  left join cognitive_account_connections as c on b.id = c.id,
  azure_subscription as sub
where
  sub.subscription_id = b.subscription_id;