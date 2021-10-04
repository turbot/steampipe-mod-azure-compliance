select
  -- Required Columns
  a.id as resource,
  case
    when virtual_network_type != 'None' then 'ok'
    else 'alarm'
  end as status,
  a.name || ' Virtual network is set to '  ||  virtual_network_type as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_api_management a,
  azure_subscription sub;
