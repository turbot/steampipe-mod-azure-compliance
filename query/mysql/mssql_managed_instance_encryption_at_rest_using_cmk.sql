with encryption_protector as (
  select
    distinct i.id as id
  from
    azure_mssql_managed_instance as i,
    jsonb_array_elements(encryption_protectors) a
    where
      a -> 'encryptionProtectorProperties' ->> 'serverKeyType' = 'AzureKeyVault'
      and a -> 'encryptionProtectorProperties' ->> 'uri' is not null
)
select
  -- Required Columns
  s.id as resource,
  case
    when a.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.id is not null then s.title || ' encrypted with CMK.'
    else s.title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_mssql_managed_instance as s
  left join encryption_protector as a on s.id = a.id,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;