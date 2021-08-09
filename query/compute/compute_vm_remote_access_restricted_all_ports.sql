with network_sg as (
  select
    distinct name as sg_name,
    network_interfaces,
    sg -> 'properties' ->> 'protocol' as p
  from
    azure_network_security_group as nsg,
    jsonb_array_elements(security_rules) as sg,
    jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) as sip
  where
    sg -> 'properties' ->> 'access' = 'Allow'
    and sg -> 'properties' ->> 'direction' = 'Inbound'
    and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
)
select
  -- Required Columns
  vm.vm_id as resource,
  case
    when sg.sg_name is null then 'ok'
    else 'alarm'
  end as status,
  case
    when sg.sg_name is null then vm.title || ' restricts remote access from internet for all network ports.'
    else vm.title || ' allows remote access from internet for port ' || sg.p || '.'
  end as reason,
  -- Additional Dimensions
  vm.resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as vm
  left join network_sg as sg on sg.network_interfaces @> vm.network_interfaces
  join azure_subscription as sub on sub.subscription_id = vm.subscription_id;