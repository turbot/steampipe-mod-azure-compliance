select
  -- Required Columns
  subnet.id resource,
  case
    when nat_gateway_id is null then 'skip'
    when nat_gateway_id is not null and network_security_group_id is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when nat_gateway_id is null then subnet.id || ' gateway not configured.'
    when nat_gateway_id is not null and network_security_group_id is not null then subnet.id || ' not associated to network security group.'
    else subnet.id || ' associated to ' || network_security_group_id || '.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_subnet as subnet
  join azure_subscription as sub on sub.subscription_id = subnet.subscription_id;