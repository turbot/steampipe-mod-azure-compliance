with logging_details as (
  select
    name as key_vault_name
  from
    azure_key_vault,
    jsonb_array_elements(diagnostic_settings) setting,
    jsonb_array_elements(setting -> 'properties' -> 'logs') log
  where
    diagnostic_settings is not null
    and setting -> 'properties' ->> 'storageAccountId' <> ''
    and (log ->> 'enabled') :: boolean
    and log ->> 'category' = 'AuditEvent'
    and (log -> 'retentionPolicy') :: JSONB ? 'days'
)
select
  -- Required Columns
  v.id as resource,
  case
    when v.diagnostic_settings is null then 'alarm'
    when l.key_vault_name not like concat('%', v.name, '%') then 'alarm'
    else 'ok'
  end as status,
  case
    when v.diagnostic_settings is null then v.name || ' logging not enabled.'
    when l.key_vault_name not like concat('%', v.name, '%')
      then v.name || ' logging not enabled.'
    else v.name || ' logging enabled.'
  end as reason,
  -- Additional Dimensions
  v.resource_group,
  coalesce(sub.display_name, split_part(v.subscription_id, '-', 5)) as subscription
from
  azure_key_vault as v
  cross join logging_details as l
  join azure_subscription sub on sub.subscription_id = v.subscription_id