select
  -- Required Columns
  app.id as resource,
  case
    when kind <> 'api' then 'skip'
    when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then 'ok'
    else 'alarm'
  end as status,
  case
    when kind <> 'api' then name || ' is of ' || kind || ' type.'
    when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then name || ' remote debugging disabled.'
    else name || ' remote debugging enabled.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;