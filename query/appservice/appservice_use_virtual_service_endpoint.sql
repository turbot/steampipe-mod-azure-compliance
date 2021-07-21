select
  -- Required Columns
  env.id as resource,
  case
    when internal_load_balancing_mode like '%Microsoft.Web%' then 'ok'
    else 'alarm'
  end as status,
  case
    when internal_load_balancing_mode like '%Microsoft.Web%'  then env.name || ' assoicated with "Microsoft.Web" service endpoint.'
    else env.name || ' not assoicated with "Microsoft.Web" service endpoint.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_environment as env,
  azure_subscription sub
where
  sub.subscription_id = env.subscription_id;