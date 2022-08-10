select
  -- Required Columns
  container.id as resource,
  case
    when not account.allow_blob_public_access and container.public_access = 'None' then 'ok'
    else 'alarm'
  end as status,
  case
    when not account.allow_blob_public_access and container.public_access = 'None'
      then account.name || ' container ' || container.name || ' doesn''t allow anonymous access.'
    else account.name || ' container ' || container.name || ' allows anonymous access.'
  end as reason,
  -- Additional Dimensions
  container.resource_group,
  sub.display_name as subscription
from
  azure_storage_container container
  join azure_storage_account account on container.account_name = account.name
  join azure_subscription sub on sub.subscription_id = account.subscription_id;
