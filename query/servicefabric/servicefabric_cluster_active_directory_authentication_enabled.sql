select
  -- Required Columns
  a.id as resource,
  case
    when azure_active_directory is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when azure_active_directory is not null then a.name || ' using Azure Active Directory for client authentication.'
    else  a.name || ' not using Azure Active Directory for client authentication.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_service_fabric_cluster a,
  azure_subscription sub;