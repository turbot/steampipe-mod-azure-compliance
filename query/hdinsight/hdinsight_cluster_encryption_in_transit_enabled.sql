select
  -- Required Columns
  a.id as resource,
  case
    when provisioning_state <> 'Succeeded' then 'skip'
    when encryption_in_transit_properties -> 'isEncryptionInTransitEnabled' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
     when provisioning_state <> 'Succeeded' then a.name || ' is in ' || provisioning_state || ' state.'
    when encryption_in_transit_properties -> 'isEncryptionInTransitEnabled' = 'true' then a.name || ' encryption in transit enabled.'
    else a.name || ' encryption in transit disabled.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_hdinsight_cluster as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;