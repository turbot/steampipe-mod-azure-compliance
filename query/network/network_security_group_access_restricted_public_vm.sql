with compute as
    (
  select
    title,
    interface ->> 'id' as interface_id
  from
    azure_compute_virtual_machine,
    jsonb_array_elements(network_interfaces) as interface
  where
    public_ips is not null
    ),
vm as (
select
  network_security_group_id
from
  azure_network_interface,
  compute
where
  id = compute.interface_id
),
network_sg as (
  select
    distinct name sg_name
  from
    azure_network_security_group nsg,
    jsonb_array_elements(security_rules) sg,
    jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) dport,
    jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) sip
  where
    sg -> 'properties' ->> 'access' = 'Allow'
    and sg -> 'properties' ->> 'direction' in ('Inbound', 'Outbound')
    and sg -> 'properties' ->> 'protocol' in ('TCP', 'UDP')
    and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', 'any', '<nw>/0', '/0')
    and (
      dport in ('22', '3389', '*')
      or (
        dport like '%-%'
        and (
          (
          53 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 123 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 161 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 389 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          or 1900 between split_part(dport, '-', 1) :: integer and split_part(dport, '-', 2) :: integer
          )
          or (
            split_part(dport, '-', 1) :: integer <= 3389
            and split_part(dport, '-', 2) :: integer >= 3389
          )
          or (
            split_part(dport, '-', 1) :: integer <= 22
            and split_part(dport, '-', 2) :: integer >= 22
          )
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
    when nsg.sg_name is null then sg.title || ' associated to ' || compute.title || ' protects protential threats.'
    else sg.title || ' associated to '  || compute.title || ' allows protential threats.'
  end as reason,
  -- Additional Dimensions
  sg.resource_group,
  sub.display_name as subscription
from
  vm,
  compute,
  azure_network_security_group as sg
  left join network_sg as nsg on nsg.sg_name = sg.name
  join azure_subscription as sub on sub.subscription_id = sg.subscription_id
where
  sg.id = vm.network_security_group_id;