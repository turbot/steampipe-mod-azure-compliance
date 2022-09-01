with disabled_user as (
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
   u.user_principal_name as resource,
  case
    when d.id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when d.id is null then u.display_name || ' sign-in enabled.'
    else u.display_name || ' sign-in disabled.'
  end as reason,
  -- Additional Columns
  t.tenant_id
from
  azure_tenant as t,
  azuread_user as u
  left join disabled_user as d on d.id = u.id;
