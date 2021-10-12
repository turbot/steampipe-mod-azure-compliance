with storage_account_encryption_scope as(
  select
    e ->> 'Id' as id,
    e ->> 'Name' as name,
    e ->> 'Source' as source,
    subscription_id,
    resource_group
  from
    azure_storage_account,
    jsonb_array_elements(encryption_scope) as e
)
select
  -- Required Columns
  s.id as resource,
  case
    when source = 'Microsoft.Keyvault' then 'ok'
    else 'alarm'
  end as status,
  case
    when source = 'Microsoft.Keyvault' then s.name || ' uses customer-managed keys to encrypt data at rest.'
    else s.name || ' not uses customer-managed keys to encrypt data at rest.'
  end as reason,
  -- Additional Dimensions
  s.resource_group,
  sub.display_name as subscription
from
  storage_account_encryption_scope as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;