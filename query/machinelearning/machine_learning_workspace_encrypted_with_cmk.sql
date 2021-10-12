select
  -- Required Columns
  c.id as resource,
  case
    when encryption ->> 'status' = 'Enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption ->> 'status' = 'Enabled' then c.name || ' encrypted with CMK.'
    else c.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_machine_learning_workspace c,
  azure_subscription sub
where
  sub.subscription_id = c.subscription_id;