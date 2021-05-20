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
  id as resource,
  case
    when count(value = 'Disabled') > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when count(value = 'Disabled') > 0 then 'Settings disabled for ' || count(*) filter (where value = 'Disabled') || ' parameters.'
    else 'Settings enabled for all the parameters.'
  end as reason,
  -- Additional Dimensions
  split_part(subscription_id, '-', 5) as subscription_id
from
  policy_assignment_parametes
group by
  id,
  subscription_id;