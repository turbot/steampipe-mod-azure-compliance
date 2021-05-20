select
  -- Required Columns
  id as resource,
  case
    when transparent_data_encryption ->> 'status' = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when transparent_data_encryption ->> 'status' = 'Disabled' then name || ' transparent data encryption off.'
    else name || ' transparent data encryption on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_database;
