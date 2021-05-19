select
  -- Required Columns
  id as resource,
  case
    when network_rule_default_action = 'Allow' then 'alarm'
    else 'ok'
  end as status,
  case
    when network_rule_default_action = 'Allow' then name || ' allows traffic from all networks.'
    else name || ' allows traffic from specific networks.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;