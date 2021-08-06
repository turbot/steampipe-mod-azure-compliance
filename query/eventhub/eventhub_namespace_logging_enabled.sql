with logging_details as (
  select
    distinct name as namespace_name
  from
    azure_eventhub_namespace,
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
        and (
          log -> 'retentionPolicy' ->> 'enabled' <> 'true'
          or setting -> 'properties' ->> 'storageAccountId' = ''
        )
      )
    )
)
select
  -- Required Columns
  v.id as resource,
  case
    when v.diagnostic_settings is null then 'alarm'
    when l.namespace_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.diagnostic_settings is null then v.name || ' logging not enabled.'
    when l.namespace_name not like concat('%', v.name, '%') then v.name || ' logging not enabled.'
    else v.name || ' logging enabled.'
  end as reason,
  -- Additional Dimensions
  v.resource_group,
  sub.display_name as subscription
from
  azure_eventhub_namespace as v
  left join logging_details as l on v.name = l.namespace_name,
  azure_subscription as sub
where
  sub.subscription_id = v.subscription_id;