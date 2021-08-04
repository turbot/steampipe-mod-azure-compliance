with owner_member as (
select
distinct
  u.display_name,
  d.role_name,
  u.account_enabled,
  u.user_principal_name,
  u.object_id,
  d.subscription_id
from
  azure_ad_user as u
  left join azure_role_assignment as a on a.principal_id = u.object_id
  left join azure_role_definition as d on d.id = a.role_definition_id
  where d.role_name = 'Owner' and not u.account_enabled
)
select
  -- Required Columns
   a.user_principal_name as resource,
  case
    when b.object_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.object_id is null then a.display_name || ' signing in enabled.'
    else a.display_name || ' signing in disabled state with ' || b.role_name || ' role.'
  end as reason,
  -- Additional Columns
  t.tenant_id
from
  azure_tenant t,
  azure_ad_user a
  left join owner_member as b on b.object_id = a.object_id;