select
  -- Required Columns
  a.id as resource,
  case
    when a.encryption_key_source = 'Microsoft.Keyvault' then 'ok'
    else 'alarm'
  end as status,
  case
    when a.encryption_key_source = 'Microsoft.Keyvault'
      then a.name || ' container insights-operational-logs encrypted with BYOK.'
    else a.name || ' container insights-operational-logs not encrypted with BYOK.'
  end as reason,
  -- Additional Dimensions
  c.resource_group,
  split_part(c.subscription_id, '-', 5) as subscription_id
from
  azure_storage_container c,
  azure_storage_account a
where
  c.name = 'insights-operational-logs'
  and c.account_name = a.name;