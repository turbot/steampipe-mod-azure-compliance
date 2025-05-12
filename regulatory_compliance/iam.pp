locals {
  regulatory_compliance_iam_common_tags = {
    service = "Azure/ActiveDirectory"
  }
}

control "iam_subscription_owner_more_than_1" {
  title       = "There should be more than one owner assigned to your subscription"
  description = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
  query       = query.iam_subscription_owner_more_than_1

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_subscription_owner_max_3" {
  title       = "A maximum of 3 owners should be designated for your subscription"
  description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
  query       = query.iam_subscription_owner_max_3

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_deprecated_account_with_owner_roles" {
  title       = "Blocked accounts with owner permissions on Azure resources should be removed"
  description = "Deprecated accounts with owner permissions should be removed from your subscription. Deprecated accounts are accounts that have been blocked from signing in."
  query       = query.iam_deprecated_account_with_owner_roles

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_no_custom_role" {
  title       = "Audit usage of custom RBAC roles"
  description = "Audit built-in roles such as 'Owner, Contributor, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception and requires a rigorous review and threat modeling."
  query       = query.iam_no_custom_role

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_external_user_with_owner_role" {
  title       = "Guest accounts with owner permissions on Azure resources should be removed"
  description = "External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access."
  query       = query.iam_external_user_with_owner_role

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_deprecated_account" {
  title       = "Blocked accounts with read and write permissions on Azure resources should be removed"
  description = "Deprecated accounts should be removed from your subscriptions. Deprecated accounts are accounts that have been blocked from signing in."
  query       = query.iam_deprecated_account

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_external_user_with_read_permission" {
  title       = "Guest accounts with read permissions on Azure resources should be removed"
  description = "External accounts with read privileges should be removed from your subscription in order to prevent unmonitored access."
  query       = query.iam_external_user_with_read_permission

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_external_user_with_write_permission" {
  title       = "Guest accounts with write permissions on Azure resources should be removed"
  description = "External accounts with write privileges should be removed from your subscription in order to prevent unmonitored access."
  query       = query.iam_external_user_with_write_permission

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "iam_user_with_write_permission_on_subscription_mfa_enabled" {
  title       = "Accounts with write permissions on Azure resources should be MFA enabled"
  description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with write privileges to prevent a breach of accounts or resources."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "iam_user_with_read_permission_on_subscription_mfa_enabled" {
  title       = "Accounts with read permissions on Azure resources should be MFA enabled"
  description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with read privileges to prevent a breach of accounts or resources."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "iam_user_with_owner_permission_on_subscription_mfa_enabled" {
  title       = "Accounts with owner permissions on Azure resources should be MFA enabled"
  description = "Multi-Factor Authentication (MFA) should be enabled for all subscription accounts with owner permissions to prevent a breach of accounts or resources."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_iam_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "iam_no_custom_subscription_owner_roles_created" {
  title       = "Ensure that no Custom Subscription Administrator roles exist"
  description = "The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  query       = query.iam_no_custom_subscription_owner_roles_created

  tags = local.regulatory_compliance_iam_common_tags
}

control "iam_conditional_access_mfa_enabled" {
  title       = "Ensure Multi-factor Authentication is required for Azure Management"
  description = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on logins."
  query       = query.iam_conditional_access_mfa_enabled

  tags = local.regulatory_compliance_iam_common_tags
}


control "iam_user_not_allowed_to_create_security_group" {
  title       = "Ensure that 'Users can create security groups in Azure portals, API or PowerShell' is set to 'No'"
  description = "Restrict security group creation to administrators only."
  query       = query.iam_user_not_allowed_to_create_security_group

  tags = local.regulatory_compliance_iam_common_tags
}

control "iam_user_not_allowed_to_create_tenants" {
  title       = "Ensure that 'Users Can Create Tenants' is set to 'No'"
  description = "Restrict tenant creation to administrators only."
  query       = query.iam_user_not_allowed_to_create_tenants

  tags = local.regulatory_compliance_iam_common_tags

}

control "iam_user_not_allowed_to_register_application" {
  title       = "Ensure that 'Users Can Register Applications' is set to 'No'"
  description = "Require administrators or appropriately delegated users to register third-party applications."
  query       = query.iam_user_not_allowed_to_register_application

  tags = local.regulatory_compliance_iam_common_tags
}

control "iam_subscriptions_with_custom_roles_no_overly_permissive" {
  title       = "Subscriptions with custom roles should not be overly permissive"
  description = "This policy identifies azure subscriptions with custom roles are overly permissive. Least privilege access rule should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  query       = query.iam_subscriptions_with_custom_roles_no_overly_permissive

  tags = local.regulatory_compliance_iam_common_tags
}

control "iam_user_no_built_in_contributor_role" {
  title       = "IAM users should not have built in contributor role"
  description = "Ensure that IAM user does not have built in contributor role. This rule is non-compliant if IAM user have built in contributor role."
  query       = query.iam_user_no_built_in_contributor_role

  tags = local.regulatory_compliance_iam_common_tags
}

control "iam_user_access_administrator_role_restricted" {
  title       = "Use of the 'User Access Administrator' role should be restricted"
  description = "The User Access Administrator role grants the ability to view all resources and manage access assignments at any subscription or management group level within the tenant. Due to its high privilege level, this role assignment should be removed immediately after completing the necessary changes at the root scope to minimize security risks."
  query       = query.iam_user_access_administrator_role_restricted

  tags = local.regulatory_compliance_iam_common_tags
}

query "iam_subscription_owner_more_than_1" {
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
        when count(*) > 1 then 'ok'
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

query "iam_subscription_owner_max_3" {
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
        when count(*) <= 3 then 'ok'
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

query "iam_no_custom_subscription_owner_roles_created" {
  sql = <<-EOQ
    with owner_custom_roles as (
      select
        role_name,
        role_type,
        title,
        action,
        _ctx,
        subscription_id
      from
        azure_role_definition,
        jsonb_array_elements(permissions) as s,
        jsonb_array_elements_text(s -> 'actions') as action
      where
        role_type = 'CustomRole'
        and action in ('*', '*:*')
    )
    select
      cr.subscription_id as resource,
      case
        when count(*) > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when count(*) = 1 then 'There is one custom owner role.'
        when count(*) > 1 then 'There are ' || count(*) || ' custom owner roles.'
        else 'There are no custom owner roles.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "cr.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      owner_custom_roles cr,
      azure_subscription sub
    where
      sub.subscription_id = cr.subscription_id
    group by
      cr.subscription_id,
      cr._ctx,
      sub.display_name;
  EOQ
}

query "iam_deprecated_account_with_owner_roles" {
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
      distinct u.user_principal_name as resource,
      case
        when not u.account_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not u.account_enabled then u.display_name || ' signing-in disabled state with ' || d.role_name || ' role.'
        else u.display_name || ' signing-in enabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_user as u
      left join azure_role_assignment as a on a.principal_id = u.id
      left join azure_role_definition as d on d.id = a.role_definition_id
      -- Query checks the users with only Owner role
      where d.role_name = 'Owner';
  EOQ
}

query "iam_no_custom_role" {
  sql = <<-EOQ
    with custom_roles as (
      select
        role_name,
        role_type,
        _ctx,
        subscription_id
      from
        azure_role_definition
      where
        role_type = 'CustomRole'
    )
    select
      cr.subscription_id as resource,
      case
        when count(*) > 0 then 'alarm'
        else 'ok'
      end as status,
      'There are ' || count(*) || ' custom roles.' as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "cr.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      custom_roles as cr,
      azure_subscription as sub
    where
      sub.subscription_id = cr.subscription_id
    group by
      cr.subscription_id,
      cr._ctx,
      sub.display_name;
  EOQ
}

query "iam_external_user_with_owner_role" {
  sql = <<-EOQ
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
    ), distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      a.user_principal_name as resource,
      case
        when a.user_principal_name like '%EXT%' then 'alarm'
        else 'ok'
      end as status,
      case
        when a.user_principal_name like '%EXT%' then a.display_name || ' is external user with ' || a.role_name || ' role.'
        else a.display_name || ' is domain user with ' || a.role_name || ' role.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      all_owner_users as a;
  EOQ
}

query "iam_deprecated_account" {
  sql = <<-EOQ
    with disabled_users as (
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
    ), distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      u.user_principal_name as resource,
      case
        when d.id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.id is null then u.display_name || ' sign-in enabled.'
        else u.display_name || ' sign-in disabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_user as u
      left join disabled_users as d on d.id = u.id;
  EOQ
}

query "iam_external_user_with_read_permission" {
  sql = <<-EOQ
    with all_write_permission_users as (
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
        where d.role_name = 'Reader'
    ), distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      a.user_principal_name as resource,
      case
        when a.user_principal_name like '%EXT%' then 'alarm'
        else 'ok'
      end as status,
      case
        when a.user_principal_name like '%EXT%' then a.display_name || ' is external user with ' || a.role_name || ' role.'
        else a.display_name || ' is domain user with ' || a.role_name || ' role.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      all_write_permission_users as a;
  EOQ
}

query "iam_external_user_with_write_permission" {
  sql = <<-EOQ
    with all_write_permission_users as (
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
      where
        d.role_name = any(array['Owner', 'Contributor'])
    ), distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      a.user_principal_name as resource,
      case
        when a.user_principal_name like '%EXT%' then 'alarm'
        else 'ok'
      end as status,
      case
        when a.user_principal_name like '%EXT%' then a.display_name || ' is external user with ' || a.role_name || ' role.'
        else a.display_name || ' is domain user with ' || a.role_name || ' role.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      all_write_permission_users as a;
  EOQ
}

query "iam_conditional_access_mfa_enabled" {
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
        when p.built_in_controls @> '["mfa"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when p.built_in_controls @> '["mfa"]' then p.display_name || ' MFA enabled.'
        else p.display_name || ' MFA disabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_conditional_access_policy as p;
  EOQ
}

query "iam_conditional_access_mfa_enabled_for_administrators" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        u.id,
        tenant_id
      from
        azuread_user as u
        left join azure_role_assignment as a on a.principal_id = u.id
        left join azure_role_definition as d on d.id = a.role_definition_id
      where role_type = 'BuiltInRole' and (role_name like '%Administrator%' or role_name = 'Owner')
    )
    select
      p.id as resource,
      case
        when p.built_in_controls @> '["mfa"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when p.built_in_controls @> '["mfa"]' then p.display_name || ' MFA enabled.'
        else p.display_name || ' MFA disabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_conditional_access_policy as p;
  EOQ
}

query "iam_user_not_allowed_to_create_security_group" {
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
      a.id as resource,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateSecurityGroups' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateSecurityGroups' = 'false' then a.display_name || ' does not allow user to create security groups.'
        else a.display_name || ' allows user to create security groups.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy as a;
  EOQ
}

query "iam_user_not_allowed_to_create_tenants" {
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
      a.id as resource,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateTenants' = 'true' then 'alarm'
        else 'ok'
      end as status,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateTenants' = 'true' then a.display_name || ' allows user to create tenants.'
        else a.display_name || ' restricts the user to create tenants.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy as a;
  EOQ
}

query "iam_user_not_allowed_to_register_application" {
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
      a.id as resource,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateApps' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when a.default_user_role_permissions ->> 'allowedToCreateApps' = 'false' then a.display_name || ' does not allow user to register applications.'
        else a.display_name || ' allows user to register applications.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_authorization_policy as a;
  EOQ
}

query "iam_subscriptions_with_custom_roles_no_overly_permissive" {
  sql = <<-EOQ
    with custom_roles as (
      select
        role_name,
        role_type,
        title,
        action,
        _ctx,
        subscription_id
      from
        azure_role_definition,
        jsonb_array_elements(permissions) as s,
        jsonb_array_elements_text(s -> 'actions') as action
      where
        role_type = 'CustomRole'
        and assignable_scopes @> '["/"]'
        and action in ('*', '*:*')
    )
    select
      cr.subscription_id as resource,
      case
        when count(*) > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when count(*) = 1 then 'There is one subscription where custom roles are overly permissive.'
        when count(*) > 1 then 'There are ' || count(*) || ' subscriptions where custom roles are overly permissive.'
        else 'There is no subscription where custom roles are overly permissive.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "cr.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      custom_roles cr,
      azure_subscription sub
    where
      sub.subscription_id = cr.subscription_id
    group by
      cr.subscription_id,
      cr._ctx,
      sub.display_name;
  EOQ
}

query "iam_user_no_built_in_contributor_role" {
  sql = <<-EOQ
    with all_contributor_permission_users as (
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
      where
        d.role_name = 'Contributor'
    ), distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      u.user_principal_name as resource,
      case
        when c.user_principal_name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.user_principal_name is not null then u.display_name || ' has contributor role assigned.'
        else u.display_name || ' does not have contributor role assigned.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_user as u left join all_contributor_permission_users as c on c.user_principal_name = u.user_principal_name;
  EOQ
}

query "iam_user_consent_to_apps_accessing_data_on_their_behalf_disabled" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        subscription_id,
        _ctx
      from
        azure_tenant
    ), authorization_policy_with_overly_permission as (
      select
        *
      from
        azuread_authorization_policy,
        jsonb_array_elements_text(default_user_role_permissions -> 'permissionGrantPoliciesAssigned') as a
      where
        a like '%microsoft-user-default-legacy'
    )
    select
      a.id as resource,
      case
        when a.tenant_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.tenant_id is null then a.display_name || ' user consent to apps accessing company data on their behalf disabled.'
        else a.display_name ||  ' user consent to apps accessing company data on their behalf enabled.'
      end as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      authorization_policy_with_overly_permission as a;
  EOQ
}

query "iam_global_administrator_max_5" {
  sql = <<-EOQ
    with distinct_tenant as (
      select
        distinct tenant_id,
        title,
        subscription_id,
        _ctx
      from
        azure_tenant
    )
    select
      t.tenant_id as resource,
      case
        when jsonb_array_length(member_ids) <= 5 then 'ok'
        else 'alarm'
      end as status,
      t.title || ' has ' ||  (jsonb_array_length(member_ids)) || ' users with global administrator assignment.'  as reason,
      t.tenant_id
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      distinct_tenant as t,
      azuread_directory_role
    where
      display_name = 'Global Administrator'
  EOQ
}

query "iam_user_access_administrator_role_restricted" {
  sql = <<-EOQ
    with user_access_admin_role as (
      select
        id,
        role_name,
        subscription_id
      from
        azure_role_definition
      where
        role_name = 'User Access Administrator'
    )
    select
      ra.id as resource,
      case
        when r.role_name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when r.role_name is not null then ra.subscription_id || ' has User Access Administrator role assigned at scope ' || ra.scope
        else 'No User Access Administrator role assignments found.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "ra.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_role_assignment ra
      left join user_access_admin_role r on ra.role_definition_id = r.id
      left join azure_subscription sub on sub.subscription_id = ra.subscription_id
    where
      r.role_name is not null;
  EOQ
}