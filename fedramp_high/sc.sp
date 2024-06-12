benchmark "fedramp_high_system_and_communication_protection" {
  title       = "System And Communications Protection"
  description = "The organization: (i) implements cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions; (ii) employs cryptographic mechanisms to protect the confidentiality and integrity of transmitted information; (iii) protects the authenticity of communications; and (iv) implements cryptographic mechanisms to prevent unauthorized disclosure of information during transmission."

  children = [
    benchmark.fedramp_high_system_and_communication_protection_3,
    benchmark.fedramp_high_system_and_communication_protection_5,
    benchmark.fedramp_high_system_and_communication_protection_7,
    benchmark.fedramp_high_system_and_communication_protection_8,
    benchmark.fedramp_high_system_and_communication_protection_12,
    benchmark.fedramp_high_system_and_communication_protection_28
  ]

  tags = local.fedramp_high_common_tags
}


benchmark "fedramp_high_system_and_communication_protection_3" {
  title = "Security Function Isolation-3"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}

benchmark "fedramp_high_system_and_communication_protection_5" {
  title = "Denial Of Service Protection-5"

  children = [
    control.application_gateway_waf_enabled,
    control.frontdoor_waf_enabled,
    control.network_interface_ip_forwarding_disabled
  ]
}

benchmark "fedramp_high_system_and_communication_protection_7" {
  title = "Boundary Protection-7"

  children = [
    benchmark.fedramp_high_system_and_communication_protection_7_3,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
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
    control.frontdoor_waf_enabled,
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

benchmark "fedramp_high_system_and_communication_protection_7_3" {
  title = "Access Points-7.3"

  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
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
    control.frontdoor_waf_enabled,
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

benchmark "fedramp_high_system_and_communication_protection_8" {
  title = "Transmission Confidentiality And Integrity-8"

  children = [
    benchmark.fedramp_high_system_and_communication_protection_8_1,
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]
}

benchmark "fedramp_high_system_and_communication_protection_8_1" {
  title = "Cryptographic Or Alternate Physical Protection-8.1"

  children = [
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]
}

benchmark "fedramp_high_system_and_communication_protection_12" {
  title = "Cryptographic Key Establishment And Management-12"

  children = [
    control.batch_account_encrypted_with_cmk,
    control.cognitive_account_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,
    control.container_registry_encrypted_with_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk,
    control.eventhub_namespace_cmk_encryption_enabled,
    control.hdinsight_cluster_encrypted_at_rest_with_cmk,
    control.hdinsight_cluster_encryption_at_host_enabled,
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.hpc_cache_encrypted_with_cmk,
    control.kubernetes_cluster_os_and_data_disks_encrypted_with_cmk,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.machine_learning_workspace_encrypted_with_cmk,
    control.mssql_managed_instance_encryption_at_rest_using_cmk,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.postgres_sql_server_encrypted_at_rest_using_cmk,
    control.servicebus_premium_namespace_cmk_encrypted,
    control.sql_server_tde_protector_cmk_encrypted,
    control.storage_account_encryption_at_rest_using_cmk,
    control.storage_account_encryption_scopes_encrypted_at_rest_with_cmk,
    control.synapse_workspace_encryption_at_rest_using_cmk
  ]
}

benchmark "fedramp_high_system_and_communication_protection_28" {
  title = "Protection Of Information At Rest-28"

  children = [
    benchmark.fedramp_high_system_and_communication_protection_28_1,
    control.app_service_environment_internal_encryption_enabled,
    control.automation_account_variable_encryption_enabled,
    control.databox_edge_device_double_encryption_enabled,
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.storage_account_infrastructure_encryption_enabled,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.sql_server_transparent_data_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled
  ]
}

benchmark "fedramp_high_system_and_communication_protection_28_1" {
  title = "Cryptographic Protection-28.1"

  children = [
    control.app_service_environment_internal_encryption_enabled,
    control.automation_account_variable_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
    control.databox_edge_device_double_encryption_enabled,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_server_transparent_data_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]
}