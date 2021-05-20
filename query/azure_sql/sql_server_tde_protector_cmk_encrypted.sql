select
  -- Required Columns
  s.id as resource,
  case
    when encryption ->> 'kind' = 'servicemanaged' then 'alarm'
    else 'ok'
  end as status,
  case
    when encryption ->> 'kind' = 'servicemanaged' then s.name || ' TDE protector not encrypted with CMK.'
    else s.name || ' TDE protector encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name
from
  azure_sql_server s,
  jsonb_array_elements(encryption_protector) encryption,
  azure_subscription sub
where
  sub.subscription_id = s.subscription_id;