select
  -- Required Columns
  a.id as resource,
  case
    when encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption ->> 'keySource' = 'Microsoft.KeyVault' then a.name || ' CMK encryption enabled.'
    else a.name || ' CMK encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_eventhub_namespace as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;