query "user_access_administrator_role_restricted" {
  sql = <<-EOQ
    with user_access_admin_role as (
      select
        id,
        display_name
      from
        azuread_role_definition
      where
        display_name = 'User Access Administrator'
    ),
    user_access_admin_assignments as (
      select
        a.principal_id,
        a.role_definition_id,
        p.display_name as principal_name,
        p.user_type,
        r.display_name as role_name
      from
        azuread_role_assignment a
        left join azuread_user p on p.id = a.principal_id
        left join azuread_role_definition r on r.id = a.role_definition_id
      where
        a.role_definition_id in (select id from user_access_admin_role)
    )
    select
      -- Required Columns
      r.display_name as resource,
      case
        when count(a.*) <= 2 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(a.*) <= 2 then 'User Access Administrator role is assigned to ' || count(a.*) || ' users.'
        else 'User Access Administrator role is assigned to ' || count(a.*) || ' users. It should be assigned to no more than 2 users.'
      end as reason,
      -- Additional Dimensions
      r.id as role_id
    from
      azuread_role_definition r
      left join user_access_admin_assignments a on a.role_definition_id = r.id
    where
      r.id in (select id from user_access_admin_role)
    group by
      r.id,
      r.display_name;
  EOQ
} 