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
        and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups/securityrules"}]'
        and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Network/networksecuritygroups/securityrules/delete"}]'
      )
      or
      (
        alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
        and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.network/networksecuritygroups/securityrules"}]'
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
    when count(a.subscription_id) > 0 then 'Activity log alert exists for delete Network Security Group Rule event.'
    else 'Activity log alert does not exists for delete Network Security Group Rule event.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_subscription sub
  left join alert_rule a on sub.subscription_id = a.subscription_id
group by
  sub.subscription_id,
  sub.display_name;