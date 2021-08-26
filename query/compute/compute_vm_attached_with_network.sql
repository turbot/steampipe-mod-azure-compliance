with vm_with_network_interfaces as (
  select
    vm.id as vm_id,
    n ->> 'id' as network_id
  from
    azure_compute_virtual_machine as vm,
    jsonb_array_elements(network_interfaces) as n
),
vm_with_appoved_networks as (
  select
    vn.vm_id as vm_id,
    vn.network_id as network_id,
    t.title as title
  from
    vm_with_network_interfaces as vn
    left join azure_network_interface as t on t.id = vn.network_id
     where exists
      (select
        ip -> 'properties' -> 'subnet' ->> 'id' as ip
      FROM
        azure_network_interface,
        jsonb_array_elements(ip_configurations) as ip
      where
        ip -> 'properties' -> 'subnet' ->> 'id' is not null)
)
select
  -- Required Columns
  a.vm_id as resource,
  case
    when b.vm_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when b.vm_id is null then a.title || ' not attached with virtual network.'
    else a.name || ' attached with virtual network ' || b.title || '.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_compute_virtual_machine as a
  left join vm_with_appoved_networks as b on a.id = b.vm_id,
  azure_subscription sub
where
  sub.subscription_id = a.subscription_id;