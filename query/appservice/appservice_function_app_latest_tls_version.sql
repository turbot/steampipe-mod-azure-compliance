
select
  -- Required Columns
  app.id as resource,
  case
    when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then 'alarm'
    else 'ok'
  end as status,
  case
    when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then name || ' not using the latest version of TLS encryption.'
    else name || ' using the latest version of TLS encryption.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_function_app as app,
  azure_subscription as sub
where
  sub.subscription_id = app.subscription_id;