select
  -- Required Columns
  a.id as resource,
  case
    when is_encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when is_encrypted then a.title || ' encryption enabled.'
    else a.title || ' encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_automation_variable as a,
  azure_subscription as sub;