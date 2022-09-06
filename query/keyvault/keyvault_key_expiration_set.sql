select
  -- Required Columns
  kvk.id as resource,
  case
    when enabled and expires_at is null then 'alarm'
    else 'ok'
  end as status,
  vault_name || ' key ' || name ||
  case
    when enabled and expires_at is null then ' expiration date not set.'
    when not enabled then ' disabled.'
    else 'expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault_key kvk,
  azure_subscription sub
where
  sub.subscription_id = kvk.subscription_id;