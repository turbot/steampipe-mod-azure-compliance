select
  -- Required Columns
  s.id resource,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then 'alarm'
      else 'ok'
  end as status,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then s.title || ' allows ingress 0.0.0.0/0 or any ip over internet.'
      else s.title || ' not allows ingress 0.0.0.0/0 or any ip over internet.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_server s,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id;