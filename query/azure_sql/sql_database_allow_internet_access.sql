select
  -- Required Columns
  sqls.id resource,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then 'alarm'
      else 'ok'
  end as status,
  case
    when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
    or firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"255.255.255.255"}}]'
      then sqls.title || ' allows ingress 0.0.0.0/0 or any ip over internet.'
      else sqls.title || ' not allows ingress 0.0.0.0/0 or any ip over internet.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  coalesce(sub.display_name, split_part(sqls.subscription_id, '-', 5)) as subscription
from
  azure_sql_server sqls
  join azure_subscription sub on sub.subscription_id = sqls.subscription_id;