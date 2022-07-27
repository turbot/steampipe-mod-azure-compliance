with non_rbac_vault as (
  select
    name
  from
    azure_key_vault
  where not enable_rbac_authorization
)
select
  -- Required Columns
  kvk.id as resource,
  case
    when v.name is null then 'skip'
    when enabled and expires_at is null then 'alarm'
    else 'ok'
  end as status,
  vault_name || ' key ' || kvk.name ||
    case
      when v.name is null then ' RBAC enabled vault.'
      when enabled and expires_at is null then ' expiration date not set.'
      when not enabled then ' disabled.'
      else ' expiration date set to ' || to_char(expires_at, 'DD-Mon-YYYY') || '.'
  end as reason,
  -- Additional Dimensions
  resource_group,
  sub.display_name as subscription
from
  azure_key_vault_key kvk
  left join non_rbac_vault as v on v.name = kvk.vault_name,
  azure_subscription sub
where
  sub.subscription_id = kvk.subscription_id;