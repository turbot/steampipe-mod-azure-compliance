select
  -- Required Columns
  s.id as resource,
  case
    when resource_group is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when resource_group is not null then s.title || ' uses azure resource manager.'
    else s.title || ' not uses azure resource manager.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;