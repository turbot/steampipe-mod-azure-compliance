with logging_details as (
  select
    distinct account_id as account_id
  from
    azure_data_lake_analytics_account,
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
  a.account_id as resource,
  case
    when a.diagnostic_settings is null then 'alarm'
    when l.account_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.diagnostic_settings is null then a.name || ' logging disabled.'
    when l.account_id is not null then a.name || ' logging enabled.'
    else a.name || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_data_lake_analytics_account a
  left join logging_details as l on a.account_id = l.account_id,
  azure_subscription sub
where
  sub.subscription_id = a.subscription_id;