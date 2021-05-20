with owner_custom_roles as (
  select
    role_name,
    role_type,
    title,
    action,
    subscription_id
  from
    azure_role_definition,
    jsonb_array_elements(permissions) as s,
    jsonb_array_elements_text(s -> 'actions') as action
  where
    role_type = 'CustomRole'
    and action in ('*', '*:*')
)
select
  -- Required columns
  cr.subscription_id as resource,
  case
    when count(*) > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(*) = 1 then 'There is one custom owner role.'
    when count(*) > 1 then 'There are ' || count(*) || ' custom owner roles.'
    else  'There are no custom owner roles.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  owner_custom_roles cr,
  azure_subscription sub
where
  sub.subscription_id = cr.subscription_id
group by
  cr.subscription_id,
  sub.display_name;