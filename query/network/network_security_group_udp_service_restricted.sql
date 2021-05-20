with network_sg as (
  select
		distinct name sg_name
	from
		azure_network_security_group nsg,
		jsonb_array_elements(security_rules) sg,
		jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
		jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip
  where
    sg -> 'properties' ->> 'access' = 'Allow'
    and sg -> 'properties' ->> 'direction' = 'Inbound'
    and sg -> 'properties' ->> 'protocol' = 'UDP'
    and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
    and (
      dport = '*'
      or (
        dport like '%-%'
        and (
          53 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 123 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 161 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 389 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 1900 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
        )
      )
    )
)
select
  -- Required Columns
  sg.id resource,
  case
    when nsg.sg_name is null then 'ok'
    else 'alarm'
  end as status,
  case
    when nsg.sg_name is null
      then sg.title || ' restricts UDP services from internet.'
    else sg.title || ' allows UDP services from internet.'
  end as reason,
  -- Additional Dimensions
  sg.resource_group,
  sub.display_name as subscription
from
  azure_network_security_group sg
  left join network_sg nsg on nsg.sg_name = sg.name
   join azure_subscription sub on sub.subscription_id = sg.subscription_id;
