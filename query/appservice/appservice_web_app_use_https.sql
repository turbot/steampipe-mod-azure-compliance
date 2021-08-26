select
  -- Required Columns
  app.id as resource,
  case
    when not https_only then 'alarm'
    else 'ok'
  end as status,
  case
    when not https_only then name || ' does not redirect all HTTP traffic to HTTPS.'
    else name || ' redirects all HTTP traffic to HTTPS.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;