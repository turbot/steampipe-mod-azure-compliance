select
  -- Required Column
  app.id as resource,
  case
    when identity = '{}' then 'alarm'
    else 'ok'
  end as status,
  case
    when identity = '{}' then name || ' register with azure active directory disabled.'
    else name || ' register with azure active directory enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app app,
  azure_subscription sub
where
  sub.subscription_id = app.subscription_id;