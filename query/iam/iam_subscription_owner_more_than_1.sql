with owner_roles as (
  select
    role_name,
    role_type, name,
    title,
    subscription_id
  from
    azure_role_definition
  where
    role_name = 'Owner'
)
select
  -- Required columns
  owner.subscription_id as resource,
  case
    when count(*) > 1 then 'ok'
    else 'alarm'
  end as status,
    case
    when count(*) = 1 then 'There is 1 owner.'
    when count(*) > 1 then 'There are ' || count(*) || ' owners.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  owner_roles as owner,
  azure_subscription as sub
where
  sub.subscription_id =owner.subscription_id
group by
  owner.subscription_id,
  sub.display_name;