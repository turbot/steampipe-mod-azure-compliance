select
  -- Required Columns
  b.account_id as resource,
  case
    when encryption_state = 'Enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_state = 'Enabled' then b.name || ' encryption enabled.'
    else b.name || ' encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_data_lake_store as b,
  azure_subscription as sub
where
  sub.subscription_id = b.subscription_id;