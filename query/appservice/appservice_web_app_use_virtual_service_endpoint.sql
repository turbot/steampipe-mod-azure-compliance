select
  -- Required Columns
  a.id as resource,
  case
    when vnet_connection -> 'properties' -> 'vnetResourceId' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when vnet_connection -> 'properties' -> 'vnetResourceId' is not null then a.name || ' configured with virtual network service endpoint.'
    else a.name || ' not configured with virtual network service endpoint.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;