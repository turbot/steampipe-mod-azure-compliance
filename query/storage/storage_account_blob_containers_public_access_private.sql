select
  -- Required Columns
  container.id as resource,
  case
    when account.allow_blob_public_access and container.public_access != 'None' then 'alarm'
    else 'ok'
  end as status,
  case
    when account.allow_blob_public_access and container.public_access != 'None'
      then account.name || ' container ' || container.name || ' allows anonymous access.'
    else account.name || ' container ' || container.name || ' doesn''t allow anonymous access.'
  end as reason,
  -- Additional Dimensions

  container.resource_group,
  split_part(container.subscription_id, '-', 5) as subscription_id
from
  azure_storage_container container
  join azure_storage_account account on container.account_name = account.name;