benchmark "nist_sp_800_171_r2_3_1" {
  title       = "3.1 Access Control"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_1_1,
    benchmark.nist_sp_800_171_r2_3_1_12,

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

