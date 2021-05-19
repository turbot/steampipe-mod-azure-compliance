select
  -- Required Columns
  id as resource,
  case
    when network_rule_bypass not like '%AzureServices%' then 'alarm'
    else 'ok'
  end as status,
  case
    when network_rule_bypass not like '%AzureServices%' then name || ' trusted Microsoft services not enabled.'
    else name || ' trusted Microsoft services enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;