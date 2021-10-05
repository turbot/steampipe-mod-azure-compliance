with compute_machine as(
  select
    id,
    name,
    subscription_id,
    resource_group
  from
    azure_hybrid_compute_machine,
    jsonb_array_elements(extensions) as e
  where
  e ->> 'name' = 'MicrosoftMonitoringAgent'
  and e ->> 'provisioningState' = 'Succeeded'
)
select
  -- Required Columns
  a.id as resource,
  case
    when a.os_name <> 'windows' then 'skip'
    when m.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.os_name <> 'windows' then a.name || ' is of ' || a.os_name || ' operating system.'
    when m.id is not null then a.name || ' log analytics extension installed.'
    else a.name || ' log analytics extension not installed.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
azure_hybrid_compute_machine as a
left join compute_machine as m on m.id = a.id,
azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;