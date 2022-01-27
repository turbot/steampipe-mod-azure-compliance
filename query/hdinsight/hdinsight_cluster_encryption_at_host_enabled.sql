select
  -- Required Columns
  a.id as resource,
  case
    when disk_encryption_properties -> 'encryptionAtHost' = 'true' and provisioning_state <> 'Failed' then 'ok'
    else 'alarm'
  end as status,
  case
    when disk_encryption_properties -> 'encryptionAtHost' = 'true' and provisioning_state <> 'Failed' then a.name || ' uses encryption at host to encrypt data at rest.'
    else a.name || ' not uses encryption at host to encrypt data at rest.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_hdinsight_cluster as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;