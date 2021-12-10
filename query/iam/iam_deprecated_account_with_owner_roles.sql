select
  -- Required Columns
   distinct u.user_principal_name as resource,
  case
    when not u.account_enabled  then 'alarm'
    else 'ok'
  end as status,
  case
    when not u.account_enabled  then u.display_name || ' signing-in disabled state with ' || d.role_name || ' role.'
    else u.display_name || ' signing-in enabled.'
  end as reason,
  -- Additional Columns
  t.tenant_id
from
  azure_tenant as t,
  azuread_user as u
  left join azure_role_assignment as a on a.principal_id = u.id
  left join azure_role_definition as d on d.id = a.role_definition_id
  -- Query checks the users with only Owner role
  where d.role_name = 'Owner';