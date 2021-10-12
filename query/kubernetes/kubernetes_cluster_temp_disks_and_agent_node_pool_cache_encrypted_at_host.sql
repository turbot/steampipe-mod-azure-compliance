with kubernetes_cluster as(
    select
    id,
    name,
    subscription_id,
    resource_group
  from
    azure_kubernetes_cluster,
    jsonb_array_elements(agent_pool_profiles) as p
  where
  p -> 'enableEncryptionAtHost' = 'true'
)
select
  -- Required Columns
  a.id as resource,
  case
    when s.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when s.id is not null then a.name || ' encrypted at host.'
    else a.name || ' not encrypted at host.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_kubernetes_cluster as a
  left join kubernetes_cluster as s on s.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;