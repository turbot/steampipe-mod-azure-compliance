select
  -- Required Columns
  kv.id as resource,
  case
    when
      key_vault_properties -> 'keyName' is not null
      and key_vault_properties -> 'keyVaultUri' is not null
      and key_vault_properties -> 'keyVersion' is not null
    then 'ok'
    else 'alarm'
  end as status,
  case
    when
      key_vault_properties -> 'keyName' is not null
      and key_vault_properties -> 'keyVaultUri' is not null
      and key_vault_properties -> 'keyVersion' is not null
    then name || ' encrypted at rest with CMK.'
    else name || ' not encrypted at rest with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_kusto_cluster as kv,
  azure_subscription as sub
where
  sub.subscription_id = kv.subscription_id;