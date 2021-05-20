select
  -- Required Columns
  sa.id as resource,
  case
    when sa.network_rule_default_action = 'Allow' then 'alarm'
    else 'ok'
  end as status,
  case
    when sa.network_rule_default_action = 'Allow' then name || ' allows traffic from all networks.'
    else name || ' allows traffic from specific networks.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;