select
  -- Required Columns
  s.id as resource,
  case
    when sku_name = any(ARRAY ['Standard_GRS', 'Standard_RAGRS', 'Standard_GZRS', 'Standard_RAGZRS']) then 'ok'
    else 'alarm'
  end as status,
  case
   when sku_name = any(ARRAY ['Standard_GRS', 'Standard_RAGRS', 'Standard_GZRS', 'Standard_RAGZRS']) then name || ' geo-redundant enabled.'
    else name || ' geo-redundant disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;