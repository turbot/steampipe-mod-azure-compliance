select
  -- Required Columns
  id as resource,
  case
    when
      security -> 'properties' ->> 'state' = 'Disabled'
      or
      (
        security -> 'properties' ->> 'state' = 'Enabled'
        and assessment -> 'properties' ->> 'storageContainerPath' is not null
        and assessment -> 'properties' -> 'recurringScans' ->> 'emailSubscriptionAdmins' = 'false'
      )
      then 'alarm'
    else 'ok'
  end as status,
  case
    when
      security -> 'properties' ->> 'state' = 'Disabled'
      or
      (
        security -> 'properties' ->> 'state' = 'Enabled'
        and assessment -> 'properties' ->> 'storageContainerPath' is not null
        and assessment -> 'properties' -> 'recurringScans' ->> 'emailSubscriptionAdmins' = 'false'
      )
      then name || name || ' VA setting not configured to send email notifications to subscription admins and owners.'
    else name || ' VA setting configured to send email notifications to subscription admins and owners.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server,
  jsonb_array_elements(server_security_alert_policy) as security,
  jsonb_array_elements(server_vulnerability_assessment) as assessment;