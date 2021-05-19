select
  -- Required Columns
  id as resource,
  case
    when public_access != 'None' then 'alarm'
    else 'ok'
  end as status,
  case
    when public_access != 'None'
      then account_name || ' container ''insights-operational-logs'' storing activity logs publicly accessible.'
    else account_name || ' container ''insights-operational-logs'' storing activity logs not publicly accessible.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_storage_container
where
  name = 'insights-operational-logs';