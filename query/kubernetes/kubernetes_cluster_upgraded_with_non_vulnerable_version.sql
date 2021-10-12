select
  -- Required Columns
  a.id as resource,
  case
    when
      a.kubernetes_version ~ '1\.13\.[0-4]'
      or a.kubernetes_version ~ '1\.12\.[0-6]'
      or a.kubernetes_version ~ '1\.11\.[0-8]'
      or a.kubernetes_version ~ '1\.\d|10\.*' then 'alarm'
    else 'ok'
  end as status,
  case
    when
      a.kubernetes_version ~ '1\.13\.[0-4]'
      or a.kubernetes_version ~ '1\.12\.[0-6]'
      or a.kubernetes_version ~ '1\.11\.[0-8]'
      or a.kubernetes_version ~ '1\.\d|10\.*' then a.name || ' not upgraded to a non-vulnerable Kubernetes version.'
    else a.name || ' upgraded to a non-vulnerable Kubernetes version.'
  end as reason,
  -- Additional Dimensions
  a.resource_group,
  sub.display_name as subscription
from
  azure_kubernetes_cluster as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;