select
  -- Required Columns
  db.id as resource,
  case
    when transparent_data_encryption ->> 'status' = 'Disabled' then 'alarm'
    else 'ok'
  end as status,
  case
    when transparent_data_encryption ->> 'status' = 'Disabled' then db.name || ' transparent data encryption off.'
    else db.name || ' transparent data encryption on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_sql_database db,
  azure_subscription sub
where
  sub.subscription_id = db.subscription_id
order by
  status desc;