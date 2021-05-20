select
  -- Required Columns
  sg.id resource,
  case
    when fl.id is null or not fl.enabled or fl.retention_policy_days < 90 then 'alarm'
    else 'ok'
  end as status,
  case
    when fl.id is null or not fl.enabled
      then sg.name || ' flowlog not enabled.'
    when fl.retention_policy_days < 90
      then sg.name || ' flowlog ' || fl.title || ' retention period is less than 90 days.'
    else sg.name || ' flowlog ' || fl.title || ' retention period is ' || fl.retention_policy_days || ' days.'
  end as reason,
  -- Additional Dimensions
  sg.resource_group,
  coalesce(sub.display_name, split_part(sg.subscription_id, '-', 5)) as subscription
from
  azure_network_security_group sg
  left join azure_network_watcher_flow_log fl on sg.id = fl.target_resource_id
  join azure_subscription sub on sub.subscription_id = sg.subscription_id;