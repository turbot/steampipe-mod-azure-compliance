with contact_info as (
  select
    count(*) filter (where alerts_to_admins = 'On') as admin_alert_count,
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
    when admin_alert_count > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when admin_alert_count > 0 then '"All users with the following roles" set to Owner'
    else '"All users with the following roles" not set to Owner.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_subscription sub
  left join contact_info ci on sub.subscription_id = ci.subscription_id;