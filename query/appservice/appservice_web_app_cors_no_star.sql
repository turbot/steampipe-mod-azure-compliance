select
  -- Required Columns
  a.id as resource,
  case
    when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]'
      then a.name || ' CORS allow all domains to access the application.'
    else a.name || ' CORS does not all domains to access the application.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app as a,
  azure_subscription as sub
where
  sub.subscription_id = a.subscription_id;