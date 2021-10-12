select
  -- Required Columns
  distinct a.name as resource,
  case
    when network_rule_set ->> 'defaultAction' = 'Deny' then 'ok'
    else 'alarm'
  end as status,
  case
    when network_rule_set ->> 'defaultAction' = 'Deny' then a.name || ' publicly not accessible.'
    else a.name || ' publicly accessible.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_container_registry as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;