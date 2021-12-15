select
  -- Required Columns
  avn.name as resource,
  case
    when enable_ddos_protection::bool then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_ddos_protection::bool then avn.name || ' DDoS protection enabled.'
    else avn.name || ' DDoS protection disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_virtual_network avn,
  azure_subscription sub
where
  sub.subscription_id = avn.subscription_id; 