select
  -- Required Columns
  a.id as resource,
  case
    when key_vault_key_uri is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when key_vault_key_uri is not null then a.name || ' encrypted at rest using CMK.'
    else a.name || ' not encrypted at rest using CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cosmosdb_account as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;