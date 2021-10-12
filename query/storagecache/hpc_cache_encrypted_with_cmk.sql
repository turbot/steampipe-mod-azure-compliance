select
  -- Required Columns
  a.id as resource,
  case
    when
      a.encryption_settings -> 'keyEncryptionKey' -> 'keyUrl' is not null
      and a.encryption_settings -> 'keyEncryptionKey' -> 'sourceVault' ->> 'id' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when
      a.encryption_settings -> 'keyEncryptionKey' -> 'keyUrl' is not null
      and a.encryption_settings -> 'keyEncryptionKey' -> 'sourceVault' ->> 'id' is not null then a.name || ' encrypted with CMK.'
    else a.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_hpc_cache as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;