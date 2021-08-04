select
  -- Required Columns
  a.id resource,
  case
    when b.region is null then 'alarm'
    when lower(b.resource_group) = 'networkwatcherrg' then 'ok'
    else 'alarm'
  end as status,
  case
    when b.region is null then 'Network watcher does not exist in region' || a.region || '.'
    when lower(b.resource_group) = 'networkwatcherrg' then b.name || ' exist in networkWatcherRG resource group.'
    else b.name || ' does not exist in networkWatcherRG resource group.'
  end as reason,
  -- Additional Dimensions
  a.region,
  sub.display_name as subscription
from
  azure_virtual_network as a
  left join azure_network_watcher as b on a.region = b.region
  join azure_subscription sub on sub.subscription_id = a.subscription_id;
