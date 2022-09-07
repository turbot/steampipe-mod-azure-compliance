with alert_rule as (
  select
    alert.id as alert_id,
    alert.name as alert_name,
    alert.enabled,
    alert.location,
    alert.subscription_id
  from
    azure_log_alert as alert,
    jsonb_array_elements_text(scopes) as sc
  where
    alert.location = 'Global'
    and alert.enabled
    and sc = '/subscriptions/' || alert.subscription_id
    and (
      (
        alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/publicipaddresses"}]'
        and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/publicIPAddresses/write"}]'
      )
      or
      (
        alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/publicipaddresses"}]'
        and jsonb_array_length(alert.condition -> 'allOf') = 2
      )
    )
  limit 1
)
select
  -- Required Columns
  sub.subscription_id as resource,
  case
    when count(a.subscription_id) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when count(a.subscription_id) > 0 then 'Activity Log Alert exists for Create or Update Public IP Address rule.'
    else 'Activity Log Alert does not exists for Create or Update Public IP Address rule.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_subscription sub
  left join alert_rule a on sub.subscription_id = a.subscription_id
group by
  sub.subscription_id,
  sub.display_name;