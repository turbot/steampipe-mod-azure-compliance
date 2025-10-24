locals {
  regulatory_compliance_activedirectory_common_tags = {
    service = "Azure/ActiveDirectory"
  }
}

control "ad_guest_user_reviewed_monthly" {
  title       = "Ensure guest users are reviewed on a monthly basis"
  description = "Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data. Guest users should be review on a monthly basis to ensure that inactive and unneeded accounts are removed."
  query       = query.ad_guest_user_reviewed_monthly

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_security_defaults_policy_enabled" {
  title         = "Ensure that 'security defaults' is enabled in Microsoft Entra ID"
  description   = "Security defaults in Microsoft Entra ID make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks."
  query         = query.ad_security_defaults_policy_enabled

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_all_user_mfa_enabled" {
  title         = "Ensure that a multifactor authentication policy exists for all users"
  description   = "A Conditional Access policy can be enabled to ensure that users are required to use Multifactor Authentication (MFA) to login."
  query         = query.ad_all_user_mfa_enabled

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_authorization_policy_user_consent_verified_publishers_selected_permissions" {
  title         = "Ensure that 'User consent for applications' is set to 'Allow user consent for apps from verified publishers, for selected permissions'"
  description   = "Allow users to provide consent for selected permissions when a request is coming from a verified publisher."
  query         = query.ad_authorization_policy_user_consent_verified_publishers_selected_permissions

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_authorization_policy_guest_user_access_restricted" {
  title         = "Ensure that 'Guest users access restrictions' is set to 'Guest user access is restricted to properties and memberships of their own directory objects'"
  description   = "Limit guest user permissions."
  query         = query.ad_authorization_policy_guest_user_access_restricted

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_authorization_policy_guest_invite_restricted" {
  title         = "Ensure that 'Guest invite restrictions' is set to 'Only users assigned to specific admin roles [...]' or 'No one [..]'"
  description   = "Restrict invitations to either users with specific administrative roles or no one."
  query         = query.ad_authorization_policy_guest_invite_restricted

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_disabled_user_no_role_assignments" {
  title         = "Ensure disabled user accounts do not have read, write, or owner permissions"
  description   = "Ensure that any roles granting read, write, or owner permissions are removed from disabled Azure user accounts. While an automated assessment procedure exists for this recommendation, the assessment status remains manual. Removing role assignments from disabled user accounts depends on the context and requirements of each organization and environment."
  query         = query.ad_disabled_user_no_role_assignments

  tags = local.regulatory_compliance_activedirectory_common_tags

}

control "iam_subscription_owner_between_2_and_3" {
  title         = "Ensure there are between 2 and 3 subscription owners"
  description   = "The Owner role in Azure grants full control over all resources in a subscription, including the ability to assign roles to others."
  query         = query.iam_subscription_owner_between_2_and_3

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_authorization_policy_user_consent_disallowed" {
  title         = "Ensure that 'User consent for applications' is set to 'Do not allow user consent'"
  description   = "Require administrators to provide consent for applications before use."
  query         = query.ad_authorization_policy_user_consent_disallowed
  documentation = file("./cis_v500/docs/cis_v500_5_12.md")

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_require_mfa_for_device_join" {
  title         = "Ensure that 'Require Multifactor Authentication to register or join devices with Microsoft Entra' is set to 'Yes'"
  description   = "This recommendation is only relevant if your subscription is using Per-User MFA. If your organization is licensed to use Conditional Access, the preferred method of requiring MFA to join devices to Entra ID is to use a Conditional Access policy (see additional information below for link)."
  query         = query.ad_require_mfa_for_device_join

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_m365_group_creation_disabled" {
  title         = "Ensure that 'Users can create Microsoft 365 groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  query         = query.ad_m365_group_creation_disabled

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_custom_banned_password_enforced" {
  title         = "Ensure that a 'Custom banned password list' is set to 'Enforce'"
  description   = "Microsoft Azure applies a default global banned password list to all user and admin accounts that are created and managed directly in Microsoft Entra ID. The Microsoft Entra password policy does not apply to user accounts that are synchronized from an on-premises Active Directory environment, unless Microsoft Entra ID Connect is used and EnforceCloudPasswordPolicyForPasswordSyncedUsers is enabled."
  query         = query.ad_custom_banned_password_enforced

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_account_duration_min_60_seconds" {
  title         = "Ensure that account 'Lockout duration in seconds' is greater than or equal to '60'"
  description   = "The account lockout duration value determines how long an account retains the status of lockout, and therefore how long before a user can continue to attempt to login after passing the lockout threshold."
  query         = query.ad_account_duration_min_60_seconds

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_account_lockout_threshold_max_10" {
  title         = "Ensure that account 'Lockout threshold' is less than or equal to '10'"
  description   = "The account lockout threshold determines how many failed login attempts are permitted prior to placing the account in a locked-out state and initiating a variable lockout duration."
  query         = query.ad_account_lockout_threshold_max_10

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_admin_portals_require_mfa" {
  title         = "Ensure that multifactor authentication is required to access Microsoft Admin Portals"
  description   = "This recommendation ensures that users accessing Microsoft Admin Portals (i.e. Microsoft 365 Admin, Microsoft 365 Defender, Exchange Admin Center, Azure Portal, etc.) are required to use multi-factor authentication (MFA) credentials when logging into an Admin Portal."
  query         = query.ad_admin_portals_require_mfa

  tags = local.regulatory_compliance_activedirectory_common_tags
}

control "ad_mfa_service_mgmt_api" {
  title         = "Ensure that multifactor authentication is required for Windows Azure Service Management API"
  description   = "This recommendation ensures that users accessing the Windows Azure Service Management API (i.e. Azure Powershell, Azure CLI, Azure Resource Manager API, etc.) are required to use multi-factor authentication (MFA) credentials when accessing resources through the Windows Azure Service Management API."
  query         = query.ad_mfa_service_mgmt_api

  tags = local.regulatory_compliance_activedirectory_common_tags
}

query "ad_guest_user_reviewed_monthly" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      u.display_name as resource,
      case
        when not account_enabled then 'alarm'
        when u.created_date_time::timestamp <= (current_date - interval '30' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when not account_enabled then 'Guest user ''' || u.display_name || ''' inactive.'
        else 'Guest user ''' || u.display_name || ''' was created ' || extract(day from current_timestamp - u.created_date_time::timestamp) || ' days ago.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      azuread_user as u
      left join distinct_tenant as t on t.tenant_id = u.tenant_id
    where
      u.user_type = 'Guest';
  EOQ
}

query "ad_manual_control" {
  sql = <<-EOQ
    select
      'active_directory' as resource,
      'info' as status,
      'Manual verification required.' as reason;
  EOQ
}

query "ad_security_defaults_policy_enabled" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      p.id as resource,
      case
        when (p.is_enabled)::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (p.is_enabled)::bool then p.tenant_id || ' security defaults enabled.'
        else p.tenant_id || ' security defaults enabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_security_defaults_policy as p;
  EOQ
}

query "ad_all_user_mfa_enabled" {
  sql = <<-EOQ
    with role_template_ids as (
      select
        array_agg(role_template_id) as rid
      from
        azuread_directory_role
    ),
    policy_with_mfa as (
      select
        tenant_id,
        count(p.*)
      from
        azuread_conditional_access_policy as p,
        role_template_ids as a
      where
        p.built_in_controls ?& array['mfa']
        and (p.users -> 'includeRoles')::jsonb ?| (a.rid)
        and jsonb_array_length(p.users -> 'excludeUsers') < 1
      group by
        tenant_id
    ),
    tenant_list as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      t.tenant_id as resource,
      case
        when (select count from policy_with_mfa where tenant_id = t.tenant_id) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when (select count from policy_with_mfa where tenant_id = t.tenant_id) > 0 then t.tenant_id || ' has MFA enabled for all users.'
        else t.tenant_id || ' has MFA disabled for all users.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      tenant_list as t;
  EOQ
}

query "ad_disabled_user_no_role_assignments" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    ), disabled_accounts_with_roles as (
      select
        distinct
        u.display_name,
        u.tenant_id,
        u.id,
        u.account_enabled,
        u.user_principal_name
      from
        azuread_user as u
        left join azure_role_assignment as a on a.principal_id = u.id
      where
      not u.account_enabled  and
      a.principal_id is not null
    )
    select
      u.user_principal_name as resource,
      case
        when u.account_enabled then 'skip'
        when not u.account_enabled and d.display_name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when u.account_enabled then u.display_name || ' is enabled account.'
        when not u.account_enabled and d.display_name is not null then u.display_name || ' is disabled and has roles assigned.'
        else u.display_name || ' account is disabled woth no roles assigned.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      azuread_user as u
      left join disabled_accounts_with_roles as d on u.id =  d.id
      left join distinct_tenant as t on t.tenant_id = d.tenant_id
  EOQ
}

query "iam_subscription_owner_between_2_and_3" {
  sql = <<-EOQ
    with owner_roles as (
      select
        d.role_name,
        d.role_type,
        d.name,
        d.title,
        d._ctx,
        d.subscription_id
      from
        azure_role_definition as d
        join azure_role_assignment as a on d.id = a.role_definition_id
      where
        d.role_name = 'Owner'
    )
    select
      owner.subscription_id as resource,
      case
        when count(*) >= 2 and count(*) <= 3  then 'ok'
        else 'alarm'
      end as status,
      count(*) || ' owner(s) associated.' as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "owner.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      owner_roles as owner,
      azure_subscription as sub
    where
      sub.subscription_id =owner.subscription_id
    group by
      owner.subscription_id,
      owner._ctx,
      sub.display_name;
  EOQ
}

query "ad_authorization_policy_user_consent_verified_publishers_selected_permissions" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id, subscription_id, _ctx
      from
        azure_tenant
    )
    select
      p.id as resource,
      case
        when (p.default_user_role_permissions -> 'permissionGrantPoliciesAssigned')::jsonb @> '["ManagePermissionGrantsForSelf.microsoft-user-default-low"]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when (p.default_user_role_permissions -> 'permissionGrantPoliciesAssigned')::jsonb @> '["ManagePermissionGrantsForSelf.microsoft-user-default-low"]'::jsonb then p.display_name || ' user consent limited to verified publishers for selected permissions.'
        else p.display_name || ' user consent policy not set to verified publishers (LOW).'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant t
      join azuread_authorization_policy p on p.tenant_id = t.tenant_id;
  EOQ
}

query "ad_authorization_policy_user_consent_disallowed" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case when exists (
          select 1
          from jsonb_array_elements_text(
                (default_user_role_permissions -> 'permissionGrantPoliciesAssigned')::jsonb
              ) as pol(val)
          where val like 'ManagePermissionGrantsForSelf.%'
        ) then 'alarm'
        else 'ok'
      end as status,
      case when exists (
          select 1
          from jsonb_array_elements_text(
                (default_user_role_permissions -> 'permissionGrantPoliciesAssigned')::jsonb
              ) as pol(val)
          where val like 'ManagePermissionGrantsForSelf.%'
        ) then t.display_name || ' user consent for applications allowed.'
        else t.display_name || ' user consent for applications disallowed.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy
  EOQ
}

query "ad_authorization_policy_guest_user_access_restricted" {
  sql = <<-EOQ
     with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when guest_user_role_id = '2af84b1e-32c8-42b7-82bc-daa82404023b' then 'ok'
        else 'alarm'
      end as status,
      case
        when guest_user_role_id = '2af84b1e-32c8-42b7-82bc-daa82404023b' then  t.display_name || ' guest user access is restricted to properties and memberships of their own directory objects.'
        else t.display_name || ' guest user access is not at most restrictive; guest_user_role_id=' || coalesce(guest_user_role_id, '<null>') || '.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy;
  EOQ
}

query "ad_authorization_policy_guest_invite_restricted" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when allow_invites_from in ('adminsAndGuestInviters', 'none') then 'ok'
        else 'alarm'
      end as status,
      case
        when allow_invites_from = 'none'
          then t.display_name || ' guest invitations disabled (no one).'
        when allow_invites_from = 'adminsAndGuestInviters'
          then t.display_name || ' guest invitations restricted to specific admin roles.'
        else
          t.display_name || ' guest invitations are too permissive: allow_invites_from=' || coalesce(allow_invites_from, '<null>') || '.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy;
  EOQ
}

query "ad_require_mfa_for_device_join" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when multi_factor_auth_configuration = 'required' then 'ok'
        else 'alarm'
      end as status,
      case
        when multi_factor_auth_configuration = 'required' then t.display_name || ' MFA is required for device registration.'
        else
          t.display_name || ' MFA is not required for device registration.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_device_registration_policy;
  EOQ
}

query "ad_m365_group_creation_disabled" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when not (value)::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when not (value)::bool then t.display_name || ' Microsoft 365 group creation is disabled.'
        else t.display_name || ' Microsoft 365 group creation is enabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_directory_setting
    where
      name = 'EnableGroupCreation';
  EOQ
}

query "ad_custom_banned_password_enforced" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when (value)::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (value)::bool then t.display_name || ' custom banned password list is enforced.'
        else
          t.display_name || ' custom banned password list is not enforced'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_directory_setting
    where
      name = 'EnableBannedPasswordCheck';
  EOQ
}

query "ad_account_duration_min_60_seconds" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when (value)::int >= 60 then 'ok'
        else 'alarm'
      end as status,
      case
        when (value)::int >= 60 then t.display_name || ' custom banned password list is enforced.'
        else
          t.display_name || ' custom banned password list is not enforced'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_directory_setting
    where
      name = 'LockoutDurationInSeconds';
  EOQ
}

query "ad_account_lockout_threshold_max_10" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      id as resource,
      case
        when (value)::int <= 10 then 'ok'
        else 'alarm'
      end as status,
      case
        when value is null then t.display_name || ' lockout threshold not configured.'
        else t.display_name || 'lockout threshold set to ' ||  value || '.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_directory_setting
    where
      name = 'LockoutThreshold';
  EOQ
}

query "ad_admin_portals_require_mfa" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    ),
    conditional_access_policy as (
      select
        tenant_id,
        count(*) as conditional_access_policy_count
      from
        azuread_conditional_access_policy
      where
        users -> 'includeUsers' ? 'All'
        and applications -> 'includeApplications' ? 'MicrosoftAdminPortals'
        and built_in_controls @> '[1]'::jsonb
        and state = 'enabled'
      group
        by tenant_id
    )
    select
      t.tenant_id as resource,
      case
        when conditional_access_policy_count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when conditional_access_policy_count > 0 then t.display_name || ' has conditional cccess policy that requires MFA for All users (or admin roles) when accessing admin portals.'
        else t.display_name || ' does not have a conditional access policy that requires MFA for All users (or admin roles) when accessing admin portals.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t
      left join conditional_access_policy as p on p.tenant_id = t.tenant_id;
  EOQ
}

query "ad_mfa_service_mgmt_api" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        display_name,
        subscription_id,
        _ctx
      from
        azure_tenant
    ),
    conditional_access_policy as (
      select
        tenant_id,
        count(*) as conditional_access_policy_count
      from
        azuread_conditional_access_policy
      where
        users -> 'includeUsers' ? 'All'
        and applications -> 'includeApplications' ? '797f4846-ba00-4fd7-ba43-dac1f8f63013'
        and built_in_controls @> '[1]'::jsonb
        -- and state = 'enabled'
      group
        by tenant_id
    )
    select
      t.tenant_id as resource,
      case
        when conditional_access_policy_count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when conditional_access_policy_count > 0 then t.display_name || ' has conditional access policy which requires MFA for the Service Management API.'
        else t.display_name || ' does not have a conditional access policy which requires MFA for the Service Management API.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t
      left join conditional_access_policy as p on p.tenant_id = t.tenant_id;
  EOQ
}