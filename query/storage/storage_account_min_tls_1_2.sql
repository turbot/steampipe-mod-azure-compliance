select
  -- Required Columns
  sa.id as resource,
  case
    when minimum_tls_version = 'TLSEnforcementDisabled' then 'alarm'
    when minimum_tls_version = 'TLS1_2' then 'ok'
    else 'alarm'
  end as status,
  case
    when minimum_tls_version = 'TLSEnforcementDisabled' then sa.name || ' TLS enforcement is disabled.'
    when minimum_tls_version = 'TLS1_2' then sa.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
    else sa.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_storage_account sa,
  azure_subscription sub
where
  sub.subscription_id = sa.subscription_id;