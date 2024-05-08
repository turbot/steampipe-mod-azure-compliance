benchmark "nist_sp_800_171_r2_3_13" {
  title       = "3.12 System and Communications Protection"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_13_1,
    benchmark.nist_sp_800_171_r2_3_13_10,
    benchmark.nist_sp_800_171_r2_3_13_16,
    benchmark.nist_sp_800_171_r2_3_13_2,
    benchmark.nist_sp_800_171_r2_3_13_5,
    benchmark.nist_sp_800_171_r2_3_13_6,
    benchmark.nist_sp_800_171_r2_3_13_8
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_13_1" {
  title       = "3.13.1 Monitor, control, and protect communications (i.e., information transmitted or received by organizational systems) at the external boundaries and key internal boundaries of organizational systems"
  description = ""
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
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
    control.frontdoor_waf_enabled,
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
    control.compute_vm_non_internet_facing_protected_with_nsg,
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
    control.compute_vm_image_builder_uses_private_link,
    control.application_gateway_waf_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_13_10" {
  title       = "3.13.10 Establish and manage cryptographic keys for cryptography employed in organizational systems"
  description = ""
  children = [
    control.recovery_service_vault_encrypted_with_cmk,
    control.iot_hub_encrypted_with_cmk,
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.automation_account_encrypted_with_cmk,
    control.batch_account_encrypted_with_cmk,
    control.container_instance_container_group_encrypted_using_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk,
    control.databox_job_unlock_password_encrypted_with_cmk,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.data_factory_encrypted_with_cmk,
    control.hdinsight_cluster_encrypted_at_rest_with_cmk,
    control.hdinsight_cluster_encryption_at_host_enabled,
    control.machine_learning_workspace_encrypted_with_cmk,
    control.monitor_log_cluster_encrypted_with_cmk,
    control.stream_analytics_job_encrypted_with_cmk,
    control.synapse_workspace_encryption_at_rest_using_cmk,
    control.bot_service_encrypted_with_cmk,
    control.kubernetes_cluster_os_and_data_disks_encrypted_with_cmk,
    control.cognitive_account_encrypted_with_cmk,
    control.container_registry_encrypted_with_cmk,
    control.eventhub_namespace_cmk_encryption_enabled,
    control.hpc_cache_encrypted_with_cmk,
    control.logic_app_integration_service_environment_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.postgres_sql_server_encrypted_at_rest_using_cmk,
    control.monitor_log_analytics_workspace_integrated_with_encrypted_storage_account,
    control.servicebus_premium_namespace_cmk_encrypted,
    control.mssql_managed_instance_encryption_at_rest_using_cmk,
    control.sql_server_tde_protector_cmk_encrypted,
    control.storage_account_encryption_scopes_encrypted_at_rest_with_cmk,
    control.storage_account_encryption_at_rest_using_cmk
  ]
}

benchmark "nist_sp_800_171_r2_3_13_16" {
  title       = "3.13.16 Protect the confidentiality of CUI at rest"
  description = ""
  children = [
    control.app_service_environment_internal_encryption_enabled,
    control.automation_account_variable_encryption_enabled,
    control.databox_job_double_encryption_enabled,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.databox_edge_device_double_encryption_enabled,
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.storage_account_infrastructure_encryption_enabled,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.sql_server_transparent_data_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted
  ]
}

benchmark "nist_sp_800_171_r2_3_13_2" {
  title       = "3.13.2 Employ architectural designs, software development techniques, and systems engineering principles that promote effective information security within organizational systems"
  description = ""
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
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
    control.frontdoor_waf_enabled,
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
    control.compute_vm_non_internet_facing_protected_with_nsg,
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
    control.compute_vm_image_builder_uses_private_link,
    control.application_gateway_waf_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_13_5" {
  title       = "3.13.5 Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks"
  description = ""
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
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
    control.frontdoor_waf_enabled,
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
    control.compute_vm_non_internet_facing_protected_with_nsg,
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
    control.compute_vm_image_builder_uses_private_link,
    control.application_gateway_waf_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_13_6" {
  title       = "3.13.6 Deny network communications traffic by default and allow network communications traffic by exception (i.e., deny all, permit by exception)"
  description = ""
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.cognitive_service_local_auth_disabled,
    control.search_service_public_network_access_disabled,
    control.cosmosdb_account_with_firewall_rules,
    control.keyvault_firewall_enabled,
    control.frontdoor_waf_enabled,
    control.container_registry_restrict_public_access,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.compute_vm_jit_access_protected,
    control.network_security_group_remote_access_restricted,
    control.compute_vm_non_internet_facing_protected_with_nsg,
    control.sql_db_public_network_access_disabled,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.postgresql_server_public_network_access_disabled,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_restrict_network_access,
    control.network_security_group_subnet_associated,
    control.application_gateway_waf_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_13_8" {
  title       = "3.13.8 Implement cryptographic mechanisms to prevent unauthorized disclosure of CUI during transmission unless otherwise protected by alternative physical safeguards"
  description = ""
  children = [
    control.appservice_web_app_use_https,
    control.appservice_web_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.appservice_function_app_only_https_accessible,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.kubernetes_cluster_https_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]
}
