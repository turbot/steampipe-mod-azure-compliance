select
  -- Required Columns
  a.id as resource,
  case
    when
      public_network_access = 'Enabled'
      and is_virtual_network_filter_enabled = 'false'
      and jsonb_array_length(ip_rules) = 0
      then 'alarm'
    else 'ok'
  end as status,
  case
    when
      public_network_access = 'Enabled'
      and is_virtual_network_filter_enabled = 'false'
      and jsonb_array_length(ip_rules) = 0
      then a.name || ' not have firewall rules.'
    else a.name || ' have firewall rules.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_cosmosdb_account as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;