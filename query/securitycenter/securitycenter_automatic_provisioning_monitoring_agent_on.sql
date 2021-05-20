select
  -- Required Columns
  id as resource,
  case
    when auto_provision = 'On' then 'ok'
    else 'alarm'
  end as status,
  case
    when auto_provision = 'On' then 'Automatic provisioning of monitoring agent is ''On''.'
    else 'Automatic provisioning of monitoring agent is ''Off''.'
  end as reason,
  -- Additional Dimensions
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_security_center_auto_provisioning;