select
  -- Required Columns
  distinct a.name as resource,
  case
    when encryption ->> 'status' = 'enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption ->> 'status' = 'enabled' then a.name || ' encrypted with CMK.'
    else a.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_container_registry as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;