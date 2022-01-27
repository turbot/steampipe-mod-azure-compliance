select
  -- Required Columns
  a.id as resource,
  case
    when provisioning_state <> 'Succeeded' then 'skip'
    when disk_encryption_properties -> 'keyName' is not null and provisioning_state <> 'Failed' then 'ok'
    else 'alarm'
  end as status,
  case
    when provisioning_state <> 'Succeeded' then a.name || ' is in ' || provisioning_state || ' state.'
    when disk_encryption_properties -> 'keyName' is not null and provisioning_state <> 'Failed' then a.name || ' encrypted with CMK.'
    else a.name || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_hdinsight_cluster as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;