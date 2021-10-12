select
  -- Required Columns
  app.id as resource,
  case
    when client_cert_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when client_cert_enabled then app.name || ' client certificate enabled.'
    else app.name || ' client certificate disabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_function_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;