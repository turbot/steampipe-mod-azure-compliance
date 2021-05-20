select
  -- Required Columns
  sc_prov.id as resource,
  case
    when auto_provision = 'On' then 'ok'
    else 'alarm'
  end as status,
  case
    when auto_provision = 'On' then 'Automatic provisioning of monitoring agent is on.'
    else 'Automatic provisioning of monitoring agent is off.'
  end as reason,
  -- Additional Dimensions
  coalesce(sub.display_name, split_part(sc_prov.subscription_id, '-', 5)) as subscription
from
  azure_security_center_auto_provisioning sc_prov
  right join azure_subscription sub on sc_prov.subscription_id = sub.subscription_id;