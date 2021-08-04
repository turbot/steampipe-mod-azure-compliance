select
  -- Required Columns
  subnet.id resource,
  case
    when subnet.name = 'GatewaySubnet' and network_security_group_id is not null then 'alarm'
    when subnet.name = 'GatewaySubnet' and network_security_group_id is null then 'ok'
    else 'skip'
  end as status,
  case
    when subnet.name = 'GatewaySubnet' and network_security_group_id is not null then 'Gateway subnet configured with network security group.'
    when subnet.name = 'GatewaySubnet' and network_security_group_id is null then 'Gateway subnet not configured with network security group.'
    else 'Not Gateway subnet.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_subnet as subnet
  join azure_subscription as sub on sub.subscription_id = subnet.subscription_id;