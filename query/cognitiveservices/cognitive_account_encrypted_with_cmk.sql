with cognitive_account_cmk as (
  select
    distinct a.id
  from
    azure_cognitive_account as a,
    jsonb_array_elements(capabilities ) as c
  where
    c ->> 'name' =  'CustomerManagedKey'
)
select
  -- Required Columns
  s.id as resource,
  case
    when c.id is null then 'ok'
    when c.id is not null and encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
    else 'alarm'
  end as status,
  case
    when c.id is null then name || ' encryption not supported.'
    when c.id is not null and encryption ->> 'keySource' = 'Microsoft.KeyVault' then name || ' encrypted with CMK.'
    else name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cognitive_account as s
  left join cognitive_account_cmk as c on c.id = s.id,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;