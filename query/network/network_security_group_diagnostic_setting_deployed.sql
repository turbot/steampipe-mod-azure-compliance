with logging_details as (
  select
    distinct name as nsg_name
  from
    azure_network_security_group,
    jsonb_array_elements(diagnostic_settings) setting
  where
   diagnostic_settings is not null
   and setting ->> 'name' = 'setbypolicy'
)
select
  -- Required Columns
  a.resource_guid as resource,
  case
    when a.diagnostic_settings is null then 'alarm'
    when l.nsg_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when a.diagnostic_settings is null then a.name || ' logging not enabled.'
    when l.nsg_name is null then a.name || ' logging not enabled.'
    else a.name || ' logging enabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_network_security_group as a
  left join logging_details as l on a.name = l.nsg_name,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;