with policy_assignment_parameters as (
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
  sub.id as resource,
  case
    when count(value = 'Disabled') > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(value = 'Disabled') > 0 then 'Settings disabled for ' || count(*) filter (where value = 'Disabled') || ' parameters.'
    else 'Settings enabled for all the parameters.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  policy_assignment_parameters pol_assignment
  right join azure_subscription sub on pol_assignment.subscription_id = sub.subscription_id
group by
  pol_assignment.id,
  pol_assignment.subscription_id,
  sub.display_name;