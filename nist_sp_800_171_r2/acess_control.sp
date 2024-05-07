benchmark "nist_sp_800_171_r2_3_1" {
  title       = "3.1 Access Control"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_1_1,
    benchmark.nist_sp_800_171_r2_3_1_12,
    benchmark.nist_sp_800_171_r2_3_1_13,
    benchmark.nist_sp_800_171_r2_3_1_14,
    benchmark.nist_sp_800_171_r2_3_1_2,
    benchmark.nist_sp_800_171_r2_3_1_3,
    benchmark.nist_sp_800_171_r2_3_1_4,
    benchmark.nist_sp_800_171_r2_3_1_5
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_1_1" {
  title       = "3.1.1 Limit system access to authorized users, processes acting on behalf of authorized users, and devices (including other systems)"
  description = ""
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.sql_server_azure_ad_authentication_enabled,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_web_app_uses_managed_identity,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.compute_vm_account_with_password_linux,
    control.iam_no_custom_role,
    control.compute_vm_ssh_key_authentication_linux,
    control.cognitive_service_local_auth_disabled,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_function_app_uses_managed_identity,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.storage_account_uses_azure_resource_manager,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_uses_azure_resource_manager,
    control.compute_vm_image_builder_uses_private_link
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_1_12" {
  title       = "3.1.12 Monitor and control remote access sessions"
  description = ""
  children = [
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.appservice_function_app_remote_debugging_disabled,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_13" {
  title       = "3.1.13 Employ cryptographic mechanisms to protect the confidentiality of remote access sessions"
  description = ""
  children = [
    control.app_configuration_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_14" {
  title       = "3.1.14 Route remote access via managed access control points"
  description = ""
  children = [
    control.app_configuration_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_2" {
  title       = "3.1.2 Limit system access to the types of transactions and functions that authorized users are permitted to execute"
  description = ""
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.sql_server_azure_ad_authentication_enabled,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_web_app_uses_managed_identity,
    control.iam_no_custom_role,
    control.authorize_access_to_security_functions_and_information,
    control.cognitive_service_local_auth_disabled,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_function_app_uses_managed_identity,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.storage_account_uses_azure_resource_manager,
    control.compute_vm_uses_azure_resource_manager
  ]
}

benchmark "nist_sp_800_171_r2_3_1_3" {
  title       = "3.1.3 Control the flow of CUI in accordance with approved authorizations"
  description = ""
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.appservice_web_app_cors_no_star,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.cognitive_service_local_auth_disabled,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_firewall_enabled,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.iot_hub_private_link_used,
    control.network_interface_ip_forwarding_disabled,
    control.compute_vm_jit_access_protected,
    control.network_security_group_remote_access_restricted,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.sql_db_public_network_access_disabled,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.postgresql_server_public_network_access_disabled,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_restrict_network_access,
    control.storage_account_uses_private_link,
    control.network_security_group_subnet_associated,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_4" {
  title       = "3.1.4 Separate the duties of individuals to reduce the risk of malevolent activity without collusion"
  description = ""
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows,
    control.compute_vm_administrators_group_with_specified_members_windows,
    control.iam_subscription_owner_more_than_1
  ]
}

benchmark "nist_sp_800_171_r2_3_1_5" {
  title       = "3.1.5 Employ the principle of least privilege, including for specific security functions and privileged accounts"
  description = ""
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_no_custom_role,
    control.authorize_access_to_security_functions_and_information
  ]
}