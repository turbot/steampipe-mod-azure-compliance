select
  -- Required Columns
  sa.id as resource,
  case
    when network_rule_default_action = 'Deny' then 'ok'
    else 'alarm'
  end as status,
  case
    when network_rule_default_action = 'Deny' then sa.name || ' blocks network access.'
    else sa.name || ' allows network access.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;