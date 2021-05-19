select
  -- Required Columns
  id as resource,
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
  split_part(subscription_id, '-', 5) as subscription_id
from
  azure_sql_server;