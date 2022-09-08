select
  -- Required Columns
  a.id as resource,
  case
    when a.default_user_role_permissions ->> 'allowedToCreateApps' = 'false' then 'ok'
    else 'alarm'
  end as status,
  case
    when a.default_user_role_permissions ->> 'allowedToCreateApps' = 'false' then a.display_name || ' does not allow user to register applications.'
    else a.display_name || ' allow user to register applications.'
  end as reason,
  -- Additional Dimensions
  t.tenant_id
from
  azure_tenant as t,
  azuread_authorization_policy as a;