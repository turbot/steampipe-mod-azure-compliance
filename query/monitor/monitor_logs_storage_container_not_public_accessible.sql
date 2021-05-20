select
  -- Required Columns
  sc.id as resource,
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
  coalesce(sub.display_name, split_part(sc.subscription_id, '-', 5)) as subscription
from
  azure_storage_container sc
  join azure_subscription sub on sub.subscription_id = sc.subscription_id
where
  name = 'insights-operational-logs';