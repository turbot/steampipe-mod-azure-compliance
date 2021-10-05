select
  -- Required Columns
  a.id as resource,
  case
    when sku_tier <> 'Premium' then 'skip'
    when encryption -> 'keySource' = '"Microsoft.KeyVault"' then 'ok'
    else 'alarm'
  end as status,
  case
    when sku_tier <> 'Premium' then a.name || ' is of ' || sku_tier || ' tier.'
    when encryption -> 'keySource' = '"Microsoft.KeyVault"' then a.name || ' encrypted using CMK.'
    else a.name || ' not encrypted using CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_servicebus_namespace a,
  azure_subscription sub;