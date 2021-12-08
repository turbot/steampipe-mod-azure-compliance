with all_owner_users as (
select
distinct
  u.display_name,
  d.role_name,
  u.account_enabled,
  u.user_principal_name,
  d.subscription_id
from
  azuread_user as u
  left join azure_role_assignment as a on a.principal_id = u.id
  left join azure_role_definition as d on d.id = a.role_definition_id
  where d.role_name = 'Owner'
)
select
  -- Required Columns
  a.user_principal_name as resource,
  case
    when a.user_principal_name like '%EXT%' then 'alarm'
    else 'ok'
  end as status,
  case
    when a.user_principal_name like '%EXT%' then a.display_name || ' is external user with ' || a.role_name || ' role.'
    else a.display_name || ' is domain user with ' || a.role_name || ' role.'
  end as reason,
  -- Additional Dimensions
  t.tenant_id
from
  azure_tenant as t,
  all_owner_users as a;
