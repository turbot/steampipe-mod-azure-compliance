select
  -- Required Columns
  a.id as resource,
  case
    when encryption ->> 'vaultBaseUrl' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption ->> 'vaultBaseUrl' is not null then a.name || ' encrypted with CMK.'
    else a.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_data_factory as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;