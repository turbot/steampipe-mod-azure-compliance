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
    benchmark.nist_sp_800_53_rev_5_ac_2_12,
    benchmark.nist_sp_800_53_rev_5_ac_2_7,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_1" {
  title       = "Automated System Account Management AC-2(1)"
  description = "The organization employs automated mechanisms to support the management of information system accounts."
  children = [
    control.cognitive_service_local_auth_disabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_7" {
  title       = "Privileged User Accounts AC-2(7)"
  description = "The organization establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles, monitors privileged role assignments, and takes organization-defined actions when privileged role assignments are no longer appropriate."
  children = [
    control.cognitive_service_local_auth_disabled,
    control.iam_no_custom_role,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_12" {
  title       = "Account Monitoring for Atypical Usage AC-2(12)"
  description = "The organization monitors information system accounts for organization-defined atypical use and reports atypical usage of information system accounts to organization-defined personnel or roles."
  children = [
    control.appservice_azure_defender_enabled,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_jit_access_protected,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.resource_manager_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
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
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.authorize_access_to_security_functions_and_information,
    control.cognitive_service_local_auth_disabled,
    control.compute_vm_account_with_password_linux,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_ssh_key_authentication_linux,
    control.compute_vm_uses_azure_resource_manager,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled,
    control.storage_account_uses_azure_resource_manager
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_3_7" {
  title       = "Role-based Access Control AC-3(7)"
  description = "The information system enforces a role-based access control policy over defined subjects and objects and controls access based upon organization-defined roles and users authorized to assume such roles."
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service       = "Azure/KubernetesService"
  })
}

benchmark "nist_sp_800_53_rev_5_ac_4" {
  title       = "Information Flow Enforcement (AC-4)"
  description = "Enforce approved authorizations. Control information workflow between interconnected systems."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_4_3,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.appservice_web_app_cors_no_star,
    control.azure_redis_cache_uses_private_link,
    control.cognitive_account_private_link_used,
    control.cognitive_account_public_network_access_disabled,
    control.cognitive_account_restrict_public_access,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_image_builder_uses_private_link,
    control.compute_vm_jit_access_protected,
    control.compute_vm_non_internet_facing_protected_with_nsg,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.eventhub_namespace_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_firewall_enabled,
    control.keyvault_vault_private_link_used,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_private_link_used,
    control.mysql_server_public_network_access_disabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.postgres_server_private_link_used,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.sql_db_public_network_access_disabled,
    control.sql_server_uses_private_link,
    control.storage_account_block_public_access,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_restrict_network_access,
    control.storage_account_uses_private_link,
    control.storage_sync_private_link_used,
    control.synapse_workspace_private_link_used
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_4_3" {
  title       = "Dynamic Information Flow Control AC-4(3)"
  description = "The information system enforces dynamic information flow control based on organization-defined policies."
  children = [
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service       = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_ac_5" {
  title       = "Separation of Duties (AC-5)"
  description = "Separate duties of individuals to prevent malevolent activity. automate separation of duties and access authorizations."
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}

benchmark "nist_sp_800_53_rev_5_ac_6" {
  title       = "Least Privilege (AC-6)"
  description = "Automate least privilege. Allow only authorized accesses for users and processes which are necessary."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_6_7,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}

benchmark "nist_sp_800_53_rev_5_ac_6_7" {
  title       = "Review of User Privileges AC-6(7)"
  description = "The organization reviews organization-defined frequency the privileges assigned to organization-defined roles or classes of users to validate the need for such privileges and reassigns or removes privileges, if necessary, to correctly reflect organizational mission/business needs."
  children = [
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}

benchmark "nist_sp_800_53_rev_5_ac_16" {
  title       = "Security and Privacy Attributes (AC-16)"
  description = "Support and maintains the binding of security attributes to information in storage, in process, and in transition."
  children = [
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_17" {
  title       = "Remote Access (AC-17)"
  description = "Authorize remote access systems prior to connection. Enforce remote connection requirements to information systems."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_17_1,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.azure_redis_cache_uses_private_link,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_image_builder_uses_private_link,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.eventhub_namespace_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_vault_private_link_used,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.sql_server_uses_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.storage_sync_private_link_used,
    control.synapse_workspace_private_link_used
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_17_1" {
  title       = "Monitoring and Control AC-17(1)"
  description = "The information system monitors and controls remote access methods."
  children = [
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.azure_redis_cache_uses_private_link,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_image_builder_uses_private_link,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.eventhub_namespace_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_vault_private_link_used,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.sql_server_uses_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.storage_sync_private_link_used,
    control.synapse_workspace_private_link_used
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
