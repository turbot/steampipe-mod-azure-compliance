select
  -- Required Columns
  distinct a.name as resource,
  case
    when sku_tier <> 'Standard' then 'Skip'
    when sku_tier = 'Standard' and network_profile ->> 'ServiceRuntimeSubnetID' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when sku_tier <> 'Standard' then a.name || ' is of ' || sku_tier || ' tier.'
    when sku_tier = 'Standard' and network_profile ->> 'ServiceRuntimeSubnetID' is not null then a.name || ' network injection enabled.'
    else a.name || ' network injection disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_spring_cloud_service as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;