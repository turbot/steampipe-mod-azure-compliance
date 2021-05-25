with contact_info as (
  select
    count(*) filter (where alert_notifications = 'On') as notification_alert_count,
    subscription_id
  from
    azure_security_center_contact
  group by
    subscription_id
  limit 1
)
select
  sub.subscription_id as resource,
  case
    when notification_alert_count > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when notification_alert_count > 0 then '"Notify about alerts with the following severity" set to High.'
    else '"Notify about alerts with the following severity" not set to High.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_subscription sub
  left join contact_info ci on sub.subscription_id = ci.subscription_id;