select
  -- Required Columns
  a.id as resource,
  case
    when disable_local_auth then 'ok'
    else 'alarm'
  end as status,
  case
    when disable_local_auth then a.name || ' account local authentication enabled.'
    else  a.name || ' account local authentication disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cognitive_account a,
  azure_subscription sub;
