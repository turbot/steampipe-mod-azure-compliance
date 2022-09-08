select
  -- Required Columns
  a.id as resource,
  case
    when a.default_user_role_permissions ->> 'allowedToCreateSecurityGroups' = 'false' then 'ok'
    else 'alarm'
  end as status,
  case
    when a.default_user_role_permissions ->> 'allowedToCreateSecurityGroups' = 'false' then a.display_name || ' does not allow user to create security groups.'
    else a.display_name || ' allow user to create security groups.'
  end as reason,
  -- Additional Dimensions
  t.tenant_id
from
  azure_tenant as t,
  azuread_authorization_policy as a;