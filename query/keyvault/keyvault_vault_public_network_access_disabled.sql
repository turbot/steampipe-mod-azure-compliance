select
  -- Required Columns
  a.id as resource,
  case
  -- In case'defaultAction' = 'Allow', All Network including internet is allowed
  -- Default All network will have not network_acls associated
    when network_acls is null or network_acls ->> 'defaultAction' != 'Deny' then 'alarm'
    else 'ok'
  end as status,
  case
    when network_acls is null or network_acls ->> 'defaultAction' != 'Deny' then a.name || ' public network access enabled.'
    else a.name || ' public network access disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault a,
  azure_subscription sub;