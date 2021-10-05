select
  -- Required Columns
  a.id as resource,
  case
    when sku_name = any (ARRAY ['TEA_1Node', 'TEA_1Node_UPS', 'TEA_1Node_Heater', 'TEA_1Node_UPS_Heater', 'TEA_4Node_Heater', 'TEA_4Node_UPS_Heater', 'TMA', 'EdgePR_Base', 'EdgePR_Base_UPS', 'EdgeMR_Mini']) then 'ok'
    else 'alarm'
  end as status,
  case
    when sku_name = any (ARRAY ['TEA_1Node', 'TEA_1Node_UPS', 'TEA_1Node_Heater', 'TEA_1Node_UPS_Heater', 'TEA_4Node_Heater', 'TEA_4Node_UPS_Heater', 'TMA', 'EdgePR_Base', 'EdgePR_Base_UPS', 'EdgeMR_Mini']) then a.name || ' double encryption enabled.'
    else a.name || ' double encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_databox_edge_device as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;