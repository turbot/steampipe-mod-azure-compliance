select
  -- Required Columns
  s.id as resource,
  case
    when encryption -> 'CmkKey' ->> 'name' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption -> 'CmkKey' ->> 'name' is not null then s.title || ' encrypted with CMK.'
    else s.title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_synapse_workspace as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;