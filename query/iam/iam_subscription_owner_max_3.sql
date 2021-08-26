with owner_roles as (
  select
    d.role_name,
    d.role_type,
    d.name,
    d.title,
    d.subscription_id
  from
    azure_role_definition as d
    left join azure_role_assignment as a on d.id = a.role_definition_id
  where
    d.role_name = 'Owner'
)
select
  -- Required columns
  owner.subscription_id as resource,
  case
    when count(*) <= 3 then 'ok'
    else 'alarm'
  end as status,
  count(*) || ' owner(s) associated.' as reason,
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