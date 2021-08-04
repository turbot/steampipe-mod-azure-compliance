select
  -- Required Columns
  b.id as resource,
  case
    when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]'
      then b.name || ' CORS allow all domains to access the application.'
    else b.name || ' CORS does not all domains to access the application.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_function_app b,
  azure_subscription sub
where
  sub.subscription_id = b.subscription_id;