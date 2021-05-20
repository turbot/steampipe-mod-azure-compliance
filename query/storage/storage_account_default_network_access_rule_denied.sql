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
  coalesce(sub.display_name, split_part(sa.subscription_id, '-', 5)) as subscription
from
  azure_storage_account sa
  join azure_subscription sub on sub.subscription_id = sa.subscription_id;