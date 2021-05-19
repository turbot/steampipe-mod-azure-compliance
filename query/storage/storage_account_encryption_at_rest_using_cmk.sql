select
  -- Required Columns
  id as resource,
  case
    when encryption_key_source = 'Microsoft.Storage' then 'alarm'
    else 'ok'
  end as status,
  case
    when encryption_key_source = 'Microsoft.Storage' then name || ' not encrypted with CMK.'
    else name || ' encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_account;