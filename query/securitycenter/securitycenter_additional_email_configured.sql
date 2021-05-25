with contact_info as (
  select
    jsonb_agg(email) filter (where name = 'default' and email != '') as default_email,
    count(*) filter (where name != 'default') as non_default_count,
    count(*) filter (where name = 'default') as default_count,
    subscription_id
  from
    azure_security_center_contact
  group by
    subscription_id
  limit 1
)
select
  sub.subscription_id as resource,
  jsonb_array_length(default_email),
  case
    when non_default_count > 1 then 'ok'
    when default_count = 1 and jsonb_array_length(default_email) != 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when non_default_count > 1 then 'Additional email addresses configured.'
    when default_count = 1 and default_email is not null then'Additional email addresses configured.'
    else 'Additional email addresses not configured.'
  end as reason,
  -- Additional Dimension
  sub.display_name as subscription
from
  contact_info ci,
  azure_subscription sub
where
  sub.subscription_id = ci.subscription_id;