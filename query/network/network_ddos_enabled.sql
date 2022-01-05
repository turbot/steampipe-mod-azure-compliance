with application_gateway_subnet as (
  select
		distinct ( split_part(c -> 'properties' -> 'subnet' ->> 'id', '/', 9) ) as vn_name
	from
		azure_application_gateway as ag,
		jsonb_array_elements(gateway_ip_configurations) as c
)
select
  -- Required Columns
  a.name as resource,
  case
    when b.vn_name is null then 'ok'
    when b.vn_name is not null and enable_ddos_protection::bool then 'ok'
    else 'alarm'
  end as status,
  case
    when b.vn_name is null then 'DDoS protection not required.'
    when b.vn_name is not null and enable_ddos_protection::bool then a.name || ' DDoS protection enabled.'
    else a.name || ' DDoS protection disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_virtual_network as a
  left join application_gateway_subnet as b on a.name = b.vn_name
  join azure_subscription sub on sub.subscription_id = a.subscription_id;