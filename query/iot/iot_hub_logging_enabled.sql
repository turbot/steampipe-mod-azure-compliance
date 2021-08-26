with logging_details as (
  select
    distinct id as id
  from
    azure_iothub,
    jsonb_array_elements(diagnostic_settings) setting,
    jsonb_array_elements(setting -> 'properties' -> 'logs') log
  where
    diagnostic_settings is not null
    and (
      (
        (log ->> 'enabled') :: boolean
        and (log -> 'retentionPolicy' ->> 'enabled') :: boolean
        and (log -> 'retentionPolicy') :: JSONB ? 'days'
      )
      or
      (
        (log ->> 'enabled') :: boolean
        and log -> 'retentionPolicy' ->> 'enabled' <> 'true'
      )
    )
)
select
  -- Required Columns
  a.id as resource,
  case
    when a.diagnostic_settings is null then 'alarm'
    when l.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.diagnostic_settings is null then a.name || ' logging disabled.'
    when l.id is not null then a.name || ' logging enabled.'
    else a.name || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_iothub as a
  left join logging_details as l on a.id = l.id,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;