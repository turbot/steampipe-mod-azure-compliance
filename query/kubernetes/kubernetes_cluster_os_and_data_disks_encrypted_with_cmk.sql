select
  -- Required Columns
  c.id as resource,
  case
    when disk_encryption_set_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when disk_encryption_set_id is not null then c.name || ' os and data diska encrypted with CMK.'
    else c.name || ' os and data diska not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_kubernetes_cluster c,
  azure_subscription sub
where
  sub.subscription_id = c.subscription_id;