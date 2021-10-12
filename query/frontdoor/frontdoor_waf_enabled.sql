with frontdoor_with_waf as (
  select
    distinct a.front_door_id
  from
    azure_frontdoor as a,
    jsonb_array_elements(frontend_endpoints) as endpoint
  where
    endpoint -> 'properties' -> 'webApplicationFirewallPolicyLink' ->> 'id' is not null
)
select
  -- Required Columns
  a.front_door_id as resource,
  case
    when c.front_door_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.front_door_id is not null then a.name || ' WAF enabled.'
    else a.name || ' WAF disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_frontdoor as a
  left join frontdoor_with_waf as c on c.front_door_id = a.front_door_id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;