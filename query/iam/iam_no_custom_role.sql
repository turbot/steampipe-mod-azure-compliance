with custom_roles as (
  select
    role_name,
    role_type,
    subscription_id
  from
    azure_role_definition
  where
    role_type = 'CustomRole'
)
select
  -- Required columns
  cr.subscription_id as resource,
  case
    when count(*) > 0 then 'alarm'
    else 'ok'
  end as status,
  'There are ' || count(*) || ' custom roles.' as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  custom_roles as cr,
  azure_subscription as sub
where
  sub.subscription_id = cr.subscription_id
group by
  cr.subscription_id,
  sub.display_name;