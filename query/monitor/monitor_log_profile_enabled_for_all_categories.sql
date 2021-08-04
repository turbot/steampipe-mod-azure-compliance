select
  -- Required Columns
  p.id as resource,
  case
    when p.categories @> '["Write", "Action", "Delete"]' then 'ok'
    else 'alarm'
  end as status,
  case
    when p.categories @> '["Write", "Action", "Delete"]' then p.name || ' collects logs for categories write, delete and action'
    else p.name || ' does not collects logs for all categories.'
  end as reason,
  -- Additional Dimensions
  sub.display_name as subscription
from
  azure_log_profile as p
  left join azure_subscription sub on sub.subscription_id = p.subscription_id;