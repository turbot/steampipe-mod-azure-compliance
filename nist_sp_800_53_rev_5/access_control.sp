benchmark "nist_sp_800_53_rev_5_ac" {
  title       = "Access Control (AC)"
  description = "The AC Control Family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_2,
    benchmark.nist_sp_800_53_rev_5_ac_3,
    benchmark.nist_sp_800_53_rev_5_ac_4,
    benchmark.nist_sp_800_53_rev_5_ac_5,
    benchmark.nist_sp_800_53_rev_5_ac_6,
    benchmark.nist_sp_800_53_rev_5_ac_16,
    benchmark.nist_sp_800_53_rev_5_ac_17
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_ac_2" {
  title       = "Account Management (AC-2)"
  description = "Manage system accounts, group memberships, privileges, workflow, notifications, deactivations, and authorizations."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_2_1,
    benchmark.nist_sp_800_53_rev_5_ac_2_7,
    benchmark.nist_sp_800_53_rev_5_ac_2_12,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "The organization employs automated mechanisms to support the management of information system accounts."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_7" {
  title       = "AC-2(7) Privileged User Accounts"
  description = "The organization establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles, monitors privileged role assignments, and takes organization-defined actions when privileged role assignments are no longer appropriate."
  children = [
    control.iam_no_custom_role
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_12" {
  title       = "AC-2(12) Account Monitoring for Atypical Usage"
  description = "The organization monitors information system accounts for organization-defined atypical use and reports atypical usage of information system accounts to organization-defined personnel or roles."
  children = [
    control.appservice_azure_defender_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_jit_access_protected,
    control.container_registry_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.kubernetes_azure_defender_enabled,
    control.resource_manager_azure_defender_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_3" {
  title       = "Access Enforcement (AC-3)"
  description = "Enforce approved authorizations for access to systems in accordance with policy."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_3_7,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.compute_vm_uses_azure_resource_manager
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_3_7" {
  title       = "AC-3(7) Role-based Access Control"
  description = "The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon organization-defined roles and users authorized to assume such roles."
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_4" {
  title       = "Information Flow Enforcement (AC-4)"
  description = "Enforce approved authorizations. Control information workflow between interconnected systems."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_4_3,
    control.appservice_web_app_cors_no_star,
    control.azure_redis_cache_uses_private_link,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_4_3" {
  title       = "AC-4(3) Dynamic Information Flow Control"
  description = "The information system enforces dynamic information flow control based on organization-defined policies."
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_5" {
  title       = "Separation of Duties (AC-5)"
  description = "Separate duties of individuals to prevent malevolent activity. automate separation of duties and access authorizations."
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_6" {
  title       = "Least Privilege (AC-6)"
  description = "Automate least privilege. Allow only authorized accesses for users and processes which are necessary."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_6_7,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_6_7" {
  title       = "AC-6(7) Review of User Privileges"
  description = "The organization reviews organization-defined frequency the privileges assigned to organization-defined roles or classes of users to validate the need for such privileges and reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs."
  children = [
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_16" {
  title       = "Security and Privacy Attributes (AC-16)"
  description = "Support and maintains the binding of security attributes to information in storage, in process, and in transition."
  children = [
    control.sql_server_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_17" {
  title       = "Remote Access (AC-17)"
  description = "Authorize remote access systems prior to connection. Enforce remote connection requirements to information systems."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_17_1,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_web_app_remote_debugging_disabled,
    control.azure_redis_cache_in_virtual_network,
    control.azure_redis_cache_uses_private_link,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_17_1" {
  title       = "AC-17(1) Monitoring and Control"
  description = "The information system monitors and controls remote access methods."
  children = [
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_web_app_remote_debugging_disabled,
    control.azure_redis_cache_in_virtual_network,
    control.azure_redis_cache_uses_private_link,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
