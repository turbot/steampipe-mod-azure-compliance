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
  sub.display_name as subscription
from
  azure_storage_container c,
  azure_storage_account a,
  azure_subscription sub
where
  c.name = 'insights-operational-logs'
  and c.account_name = a.name
  and sub.subscription_id = a.subscription_id;