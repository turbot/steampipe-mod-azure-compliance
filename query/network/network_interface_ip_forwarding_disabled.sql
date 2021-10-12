with vm_using_nic as (
  select
    id as vm_id,
    name as vm_name,
    resource_group as rg,
    subscription_id as sub,
    b ->> 'id' as nic_id
  from
    azure_compute_virtual_machine as c,
    jsonb_array_elements(network_interfaces) as b
)
select
  -- Required Columns
  v.vm_id as resource,
  case
    when i.enable_ip_forwarding then 'alarm'
    else 'ok'
  end as status,
  case
    when i.enable_ip_forwarding then v.vm_name || ' using ' || i.name || ' network interface enabled with IP forwarding.'
    else v.vm_name || ' using ' || i.name || ' network interface disabled with IP forwarding.'
  end as reason,
  -- Additional Dimensions
  v.rg,
  v.sub as subscription
from
  azure_subscription as sub,
  vm_using_nic as v
  left join azure_network_interface as i on i.id = v.nic_id;