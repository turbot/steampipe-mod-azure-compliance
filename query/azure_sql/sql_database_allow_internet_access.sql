select
  -- Required Columns
  id resource,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then 'alarm'
      else 'ok'
  end as status,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then title || ' allows ingress 0.0.0.0/0 or any ip over internet.'
      else title || ' not allows ingress 0.0.0.0/0 or any ip over internet.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server;