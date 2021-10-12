select
  -- Required Columns
  s.database_id resource,
  case
    when transparent_data_encryption ->> 'status' = 'Enabled' or transparent_data_encryption ->> 'state' = 'Enabled' then 'ok'
     else 'alarm'
  end as status,
  case
    when transparent_data_encryption ->> 'status' = 'Enabled' or transparent_data_encryption ->> 'state' = 'Enabled'  then s.title || ' transparent data encryption enabled.'
      else s.title || ' transparent data encryption disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_database as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id
  and s.name <> 'master';