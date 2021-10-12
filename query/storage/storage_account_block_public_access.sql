select
  -- Required Columns
  sa.id as resource,
  case
    when sa.id not like '%/resourceGroups/aro-%'
      and (sa.name not like 'cluster%' or sa.name not like 'imageregistry%')
      and sa.allow_blob_public_access = 'false'
      then 'ok'
    else 'alarm'
  end as status,
  case
    when sa.id not like '%/resourceGroups/aro-%'
      and (sa.name not like 'cluster%' or sa.name not like 'imageregistry%')
      and sa.allow_blob_public_access = 'false'
      then sa.name || ' not publicy accessible.'
    else sa.name || ' publicy accessible.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;