select
  -- Required Columns
  app.id as resource,
  case
    when not (auth_settings -> 'properties' ->> 'enabled') :: boolean then 'alarm'
    else 'ok'
  end as status,
  case
    when not (auth_settings -> 'properties' ->> 'enabled') :: boolean then name || ' authentication not set.'
    else name || ' authentication set.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app app,
  azure_subscription sub
where
  sub.subscription_id = app.subscription_id;