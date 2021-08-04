with service_bus as (
select
  name,
  region,
  network_rule_set -> 'properties' -> 'virtualNetworkRules' as virtual_network_rules
from
  azure_servicebus_namespace
where
  sku_tier = 'Premium'
  and (
    jsonb_array_length(network_rule_set -> 'properties' -> 'virtualNetworkRules') = 0
    or exists (
      select
        * 
      from
        jsonb_array_elements(network_rule_set -> 'properties' -> 'virtualNetworkRules') as t
      where
        t -> 'subnet' ->> 'id' is null
    )
  )
)
select
  -- Required Columns
  bus.id as resource,
  case 
    when bus.name != service_bus.name then 'ok'
    else 'alarm'
  end as status,
  case 
    when bus.name != service_bus.name then bus.name || ' configured with virtual service endpoint.'
    else bus.name || ' not configured with virtual service endpoint.'
  end as reason,
  -- Additional Dimensions
  bus.resource_group,
  sub.display_name as subscription
from
  azure_servicebus_namespace as bus,
  azure_subscription as sub
  left join service_bus on true
where
  sub.subscription_id = bus.subscription_id;