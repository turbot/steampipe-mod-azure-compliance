with policy_assignment_parametes as (
  select
    id,
    name,
    key,
    parameters -> key ->> 'value' as value,
    subscription_id
  from
    azure_policy_assignment,
    jsonb_object_keys(parameters) as key
  where
    name = 'SecurityCenterBuiltIn'
)
select
  -- Required Columns
  pol_ass.id as resource,
  case
    when count(value = 'Disabled') > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(value = 'Disabled') > 0 then 'Settings disabled for ' || count(*) filter (where value = 'Disabled') || ' parameters.'
    else 'Settings enabled for all the parameters.'
  end as reason,
  -- Additional Dimensions
  coalesce(sub.display_name, split_part(pol_ass.subscription_id, '-', 5)) as subscription
from
  policy_assignment_parametes pol_ass
  right join azure_subscription sub on pol_ass.subscription_id = sub.subscription_id
group by
  pol_ass.id,
  pol_ass.subscription_id,
  sub.display_name;