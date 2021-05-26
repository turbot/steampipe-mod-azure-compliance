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
    and split_part(sc, '/', 3) = alert.subscription_id
    and alert.condition -> 'allOf' @> '[{"equals":"Administrative","field":"category"}]'
    and alert.condition -> 'allOf' @> '[{"field": "resourceType", "equals": "microsoft.authorization/policyassignments"}]'
    and alert.condition -> 'allOf' @> '[{"field": "operationName", "equals": "Microsoft.Authorization/policyAssignments/delete"}]'
)
select
  -- Required Columns
  a.subscription_id as resource,
  case
    when count(a.alert_id) < 1 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(a.alert_id) < 1 then 'Activity log alert does not exists for delete policy assignment event.'
    else 'Activity log alert exists for delete policy assignment event.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  alert_rule a,
  azure_subscription sub
where
  sub.subscription_id = a.subscription_id
group by
  a.subscription_id,
  sub.display_name;