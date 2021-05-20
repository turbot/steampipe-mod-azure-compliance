select
  -- Required Columns
  sa.id as resource,
  case
    when network_rule_bypass not like '%AzureServices%' then 'alarm'
    else 'ok'
  end as status,
  case
    when network_rule_bypass not like '%AzureServices%' then sa.name || ' trusted Microsoft services not enabled.'
    else sa.name || ' trusted Microsoft services enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;