with enabled_settings as (
  select
    name,
    id,
    resource_group,
    subscription_id,
    count(*) filter (where l ->> 'enabled' = 'true'
      and l ->> 'category' in ('Administrative', 'Security', 'Alert', 'Policy')
    ) as valid_category_count,
    string_agg(l ->> 'category', ', ') filter (where l ->> 'enabled' = 'true'
      and l ->> 'category' in ('Administrative', 'Security', 'Alert', 'Policy')
    ) as valid_categories
  from
    azure_diagnostic_setting,
    jsonb_array_elements(logs) as l
  group by
    name,
    id,
    resource_group,
    subscription_id
)
select
  -- Required Columns
  sett.id as resource,
  case
    when valid_category_count = 4 then 'ok'
    else 'alarm'
  end as status,
  case
    when valid_category_count = 4
      then name || ' logs enabled for required categories administrative, security, alert and policy.'
    when valid_category_count > 0
      then sett.name || ' logs enabled for ' || valid_categories || ' categories.'
      else sett.name || ' logs not enabled for categories administrative, security, alert and policy.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  enabled_settings sett,
  azure_subscription sub
where
  sub.subscription_id = sett.subscription_id;