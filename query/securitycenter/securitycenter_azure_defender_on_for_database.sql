with defender_list as (
  select
    json_object_agg(name, pricing_tier) as data,
    subscription_id
  from
    azure_security_center_subscription_pricing
  where
    name = any(ARRAY ['CosmosDbs', 'OpenSourceRelationalDatabases', 'SqlServerVirtualMachines', 'SqlServers'])
  group by
    subscription_id
)
select
  -- Required Columns
  sub.id as resource,
  case
    when
      data ->> 'CosmosDbs' = 'Standard'
      and data ->> 'OpenSourceRelationalDatabases' = 'Standard'
      and data ->> 'SqlServerVirtualMachines' = 'Standard'
      and data ->> 'SqlServers' = 'Standard'
      then 'ok'
    else 'alarm'
  end as status,
  case
    when
      data ->> 'CosmosDbs' = 'Standard'
      and data ->> 'OpenSourceRelationalDatabases' = 'Standard'
      and data ->> 'SqlServerVirtualMachines' = 'Standard'
      and data ->> 'SqlServers' = 'Standard'
      then 'Azure Defender on for Databases.'
    else 'Azure Defender off for Databases.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_subscription as sub
  left join defender_list as l on l.subscription_id = sub.subscription_id;