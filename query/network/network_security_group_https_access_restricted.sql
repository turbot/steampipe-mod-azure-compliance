with network_sg as 
(
  select distinct
    name sg_name 
  from
    azure_network_security_group nsg,
    jsonb_array_elements(security_rules) sg,
    jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
    jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip 
  where
    sg -> 'properties' ->> 'access' = 'Allow' 
    and sg -> 'properties' ->> 'direction' = 'Inbound' 
    and sg -> 'properties' ->> 'protocol' ilike 'TCP' 
    and sip in 
    (
      '*',
      '0.0.0.0',
      '0.0.0.0/0',
      'Internet',
      'any',
      '<nw>/0',
      '/0'
    )
    and 
    (
      dport in 
      (
        '80',
        '*'
      )
      or 
      (
        dport like '%-%' 
        and split_part(dport, '-', 1) :: integer <= 80 
        and split_part(dport, '-', 2) :: integer >= 80 
      )
    )
)
select
  -- Required Columns
  sg.id resource,
  case
    when
      nsg.sg_name is null 
    then
      'ok' 
    else
      'alarm' 
  end
  as status, 
  case
    when
      nsg.sg_name is null 
    then
      sg.title || 'evaluates and restricts HTTPS access from internet.' 
    else
      sg.title || 'evaluates and allows HTTPS access from internet.' 
  end
  as reason, 	-- Additional Dimensions
  sg.resource_group, sub.display_name as subscription 
from
  azure_network_security_group sg 
  left join
    network_sg nsg 
    on nsg.sg_name = sg.name 
  join
    azure_subscription sub 
    on sub.subscription_id = sg.subscription_id;