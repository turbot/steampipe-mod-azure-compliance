select
  -- Required Columns
  app.id as resource,
  case
    when not (configuration -> 'properties' ->> 'http20Enabled') :: boolean then 'alarm'
    else 'ok'
  end as status,
  case
    when not (configuration -> 'properties' ->> 'http20Enabled') :: boolean
      then name || ' HTTP version not latest.'
    else name || ' HTTP version is latest.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_app_service_web_app app,
  azure_subscription sub
where
  sub.subscription_id = app.subscription_id;