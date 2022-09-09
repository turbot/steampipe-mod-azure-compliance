select
  -- Required Columns
  a.id as resource,
  case
    when public_network_access = 'Disabled' then 'ok'
    when public_network_access = 'Enabled' and is_virtual_network_filter_enabled = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when public_network_access = 'Disabled' then a.name || ' public network access disabled.'
    when public_network_access = 'Enabled' and is_virtual_network_filter_enabled = 'true' then a.name || ' virtual network filter enabled.'
    else a.name || ' virtual network filter disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cosmosdb_account as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;