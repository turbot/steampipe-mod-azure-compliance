select
  -- Required Columns
  sg.id resource,
  case
    when subnets is null then 'alarm'
    else 'ok'
  end as status,
  case
    when subnets is null then name || ' not associated with subnet.'
    else name || ' associated with ' || split_part(rtrim((subnet -> 'id') :: text, '"'), '/subnets/',2) || '.'
  end as reason,
  -- Additional Dimensions
  sg.resource_group,
  sub.display_name as subscription
from
  azure_network_security_group as sg
  join azure_subscription as sub on sub.subscription_id = sg.subscription_id
  left join jsonb_array_elements(subnets) as subnet on true;