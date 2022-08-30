with owner_member as (
select
distinct
  u.display_name,
  u.account_enabled,
  u.user_principal_name,
  u.id,
  d.subscription_id
from
  azuread_user as u
  left join azure_role_assignment as a on a.principal_id = u.id
  left join azure_role_definition as d on d.id = a.role_definition_id
  where not u.account_enabled
)
select
  -- Required Columns
   a.user_principal_name as resource,
  case
    when b.id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is null then a.display_name || ' signing in enabled.'
    else a.display_name || ' signing in disabled.'
  end as reason,
  -- Additional Columns
  t.tenant_id
from
  azure_tenant as t,
  azuread_user as a
  left join owner_member as b on b.id = a.id;
