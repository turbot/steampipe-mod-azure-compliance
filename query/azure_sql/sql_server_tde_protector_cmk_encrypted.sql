select
  -- Required Columns
  id as resource,
  case
    when encryption ->> 'kind' = 'servicemanaged' then 'alarm'
    else 'ok'
  end as status,
  case
    when encryption ->> 'kind' = 'servicemanaged' then name || ' TDE protector not encrypted with CMK.'
    else name || ' TDE protector encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server,
  jsonb_array_elements(encryption_protector) as encryption;