benchmark "fedramp_high_ac" {
  title       = "Access Control"
  description = "Access control policies and procedures are established and implemented to ensure that access to systems and data is restricted to authorized users, processes, or devices, and to prevent unauthorized access."

  children = [
    benchmark.fedramp_high_ac_2,
    benchmark.fedramp_high_ac_3,
    benchmark.fedramp_high_ac_4,
    benchmark.fedramp_high_ac_5,
    benchmark.fedramp_high_ac_6,
    benchmark.fedramp_high_ac_17
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_ac_2" {
  title       = "Account Management (AC-2)"
  description = "Manage system accounts, group memberships, privileges, workflow, notifications, deactivations, and authorizations."
  children = [
    benchmark.fedramp_high_ac_2_1,
    benchmark.fedramp_high_ac_2_12,
    benchmark.fedramp_high_ac_2_7,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
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
}

benchmark "fedramp_high_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "Support the management of system accounts using [Assignment: organization-defined automated mechanisms]."

  children = [
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_ac_2_7" {
  title       = "AC-2(7) Role-Based Schemes"
  description = "The organization: Establishes and administers privileged user accounts in accordance with a role-based access scheme that organizes allowed information system access and privileges into roles; Monitors privileged role assignments; and Takes [Assignment: organization-defined actions] when privileged role assignments are no longer appropriate."

  children = [
    control.iam_no_custom_role,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_ac_2_12" {
  title       = "AC-2(12) Account Monitoring"
  description = "Monitors and reports atypical usage of information system accounts to organization-defined personnel or roles."

  children = [
    control.compute_vm_jit_access_protected,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage
  ]
}

benchmark "fedramp_high_ac_3" {
  title       = "Access Enforcement (AC-3)"
  description = "Enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies."

  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.compute_vm_account_with_password_linux,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_ssh_key_authentication_linux,
    control.compute_vm_uses_azure_resource_manager,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled,
    control.storage_account_uses_azure_resource_manager
  ]
}

benchmark "fedramp_high_ac_4" {
  title       = "Information Flow Enforcement (AC-4)"
  description = "Enforce approved authorizations for controlling the flow of information within the system and between connected systems based on [Assignment: organization-defined information flow control policies]."

  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.appservice_web_app_cors_no_star,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_jit_access_protected,
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
    control.redis_cache_uses_private_link,
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
}

benchmark "fedramp_high_ac_5" {
  title       = "Separation Of Duties (AC-5)"
  description = "Separate duties of individuals to prevent malevolent activity. automate separation of duties and access authorizations."

  children = [
    control.iam_subscription_owner_more_than_1
  ]
}

benchmark "fedramp_high_ac_6" {
  title       = "Least Privilege (AC-6)"
  description = "Employ the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) that are necessary to accomplish assigned organizational tasks."

  children = [
    benchmark.fedramp_high_ac_6_7,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]
}

benchmark "fedramp_high_ac_6_7" {
  title       = "AC-6(7) Review Of User Privileges"
  description = "Centralize access control for all enterprise assets through a directory service or SSO provider, where supported."

  children = [
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3
  ]
}

benchmark "fedramp_high_ac_17" {
  title       = "Remote Access (AC-17)"
  description = "Authorize remote access systems prior to connection. Enforce remote connection requirements to information systems."

  children = [
    benchmark.fedramp_high_ac_17_1,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
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
    control.redis_cache_uses_private_link,
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
}

benchmark "fedramp_high_ac_17_1" {
  title       = "AC-17(1) Automated Monitoring / Control"
  description = "Employ automated mechanisms to monitor and control remote access methods."

  children = [
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.cognitive_account_private_link_used,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
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
    control.redis_cache_uses_private_link,
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
}