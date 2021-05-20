select
  -- Required Columns
  s.id as resource,
  case
    when server_azure_ad_administrator is null then 'alarm'
    else 'ok'
  end as status,
  case
    when server_azure_ad_administrator is null then name || ' Azure AD authentication not configured.'
    else name || ' Azure AD authentication configured.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name
from
  azure_sql_server s
  join azure_subscription sub on sub.subscription_id = s.subscription_id;