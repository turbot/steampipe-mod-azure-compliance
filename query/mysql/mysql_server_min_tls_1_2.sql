select
  -- Required Columns
  s.id as resource,
  case
    when minimal_tls_version =  'TLSEnforcementDisabled' then 'alarm'
    when minimal_tls_version = 'TLS1_2' then 'ok'
    else 'alarm'
  end as status,
  case
    when minimal_tls_version =  'TLSEnforcementDisabled' then s.name || ' TLS enforcement is disabled ' || minimal_tls_version || '.'
    when minimal_tls_version = 'TLS1_2' then s.name || ' minimum TLS version set to ' || minimal_tls_version || '.'
    else s.name || ' minimum TLS version is not set.'
  end as reason,
  -- Additional Dimensions
  s.resource_group,
  sub.display_name as subscription
from
  azure_mysql_server as s,
  azure_subscription as sub
where
  sub.subscription_id = s.subscription_id;