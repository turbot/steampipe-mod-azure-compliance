select
  -- Required Columns
  loc.name resource,
  case
    when watcher.id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when watcher.id is null then 'Network watcher not enabled in ' || loc.name || '.'
    else 'Network watcher enabled in ' || loc.name || '.'
  end as reason,
  -- Additional Dimensions
  split_part(loc.subscription_id, '-', 5) as subscription_id
from
  azure_location loc
  left join azure_network_watcher watcher on watcher.region = loc.name;