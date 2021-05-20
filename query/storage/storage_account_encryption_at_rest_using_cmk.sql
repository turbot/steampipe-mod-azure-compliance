select
  -- Required Columns
  sa.id as resource,
  case
    when sa.encryption_key_source = 'Microsoft.Storage' then 'alarm'
    else 'ok'
  end as status,
  case
    when sa.encryption_key_source = 'Microsoft.Storage' then sa.name || ' not encrypted with CMK.'
    else sa.name || ' encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;