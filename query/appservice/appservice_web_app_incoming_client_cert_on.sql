select
  -- Required Column
  id as resource,
  case
    when not client_cert_enabled then 'alarm'
    else 'ok'
  end as status,
  case
    when not client_cert_enabled then name || ' incoming client certificates set to off.'
    else name || ' incoming client certificates set to on.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app app,
  azure_subscription sub
where
  sub.subscription_id = app.subscription_id;