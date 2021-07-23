select
  -- Required Column
  app.id as resource,
  case
    when https_only then 'ok'
    else 'alarm'
  end as status,
  case
    when https_only then name || ' https-only accessible enabled.'
    else name || ' https-only accessible disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_function_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;