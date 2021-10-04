select
  sub.subscription_id as resource,
  case
    when email is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when email is not null then ' email configured.'
    else ' email not configured.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  azure_subscription sub
  left join azure_security_center_contact sec on sub.subscription_id = sec.subscription_id;