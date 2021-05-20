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
  coalesce(sub.display_name, split_part(sa.subscription_id, '-', 5)) as subscription
from
  azure_storage_account sa
  join azure_subscription sub on sub.subscription_id = sa.subscription_id;