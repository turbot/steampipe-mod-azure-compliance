select
  -- Required Columns
  p.id as resource,
  case
    when p.built_in_controls @> '["mfa"]' then 'ok'
    else 'alarm'
  end as status,
  case
    when p.built_in_controls @> '["mfa"]' then p.display_name || ' MFA enabled.'
    else p.display_name || ' MFA disabled.'
  end as reason,
  -- Additional Dimensions
  t.tenant_id
from
  azure_tenant as t,
  azuread_conditional_access_policy as p;
