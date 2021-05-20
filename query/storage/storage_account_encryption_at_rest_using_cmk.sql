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
  coalesce(sub.display_name, split_part(sa.subscription_id, '-', 5)) as subscription
from
  azure_storage_account sa
  join azure_subscription sub on sub.subscription_id = sa.subscription_id;