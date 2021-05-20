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
  sub.display_name as subscription
from
  azure_key_vault v,
  logging_details l,
  azure_subscription sub
where
  sub.subscription_id = v.subscription_id;