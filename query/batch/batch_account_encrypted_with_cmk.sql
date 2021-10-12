select
  -- Required Columns
  batch.id as resource,
  case
    when encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
    else 'alarm'
  end as status,
  case
    when  encryption ->> 'keySource' = 'Microsoft.KeyVault' then batch.name || ' encrypted with CMK.'
    else batch.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_batch_account as batch,
  azure_subscription as sub
where
  sub.subscription_id = batch.subscription_id;