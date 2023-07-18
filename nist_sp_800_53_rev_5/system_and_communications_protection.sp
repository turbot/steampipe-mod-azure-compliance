benchmark "nist_sp_800_53_rev_5_sc" {
  title       = "System and Communications Protection (SC)"
  description = "The SC control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_3,
    benchmark.nist_sp_800_53_rev_5_sc_5,
    benchmark.nist_sp_800_53_rev_5_sc_7,
    benchmark.nist_sp_800_53_rev_5_sc_8,
    benchmark.nist_sp_800_53_rev_5_sc_12,
    benchmark.nist_sp_800_53_rev_5_sc_28
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_3" {
  title       = "Security Function Isolation (SC-3)"
  description = "The information system isolates security functions from nonsecurity functions."
  children = [
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_monitor_missing_endpoint_protection_in_asc,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_sc_5" {
  title       = "Denial-of-service Protection (SC-5)"
  description = "The information system protects against or limits the effects of the organization-defined types of denial of service attacks or reference to a source for such information by employing organization-defined security safeguards."
  children = [
    control.application_gateway_waf_enabled,
    control.frontdoor_waf_enabled,
    control.network_ddos_enabled,
    control.network_interface_ip_forwarding_disabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_7" {
  title       = "Boundary Protection (SC-7)"
  description = "The information system monitors and controls communications at the external boundary of the system and at key internal boundaries within the system; implements subnetworks for publicly accessible system components that are physically or logically separated from internal organizational networks; and connects to external networks or information systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture."
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_7_3,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
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
    control.frontdoor_waf_enabled,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_firewall_enabled,
    control.keyvault_vault_private_link_used,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.machine_learning_workspace_private_link_used,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_private_link_used,
    control.mysql_server_public_network_access_disabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_subnet_protected_by_firewall,
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
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_7_3" {
  title       = "Access Points SC-7(3)"
  description = "The organization limits the number of external network connections to the information system."
  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
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
    control.frontdoor_waf_enabled,
    control.healthcare_fhir_uses_private_link,
    control.iot_hub_private_link_used,
    control.keyvault_firewall_enabled,
    control.keyvault_vault_private_link_used,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.machine_learning_workspace_private_link_used,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_private_link_used,
    control.mysql_server_public_network_access_disabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_subnet_protected_by_firewall,
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
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_8" {
  title       = "Transmission Confidentiality and Integrity (SC-8)"
  description = "The information system protects the confidentiality and integrity of transmitted information."
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_8_1,
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_use_https,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_secure_communication_protocols_configured,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.kubernetes_cluster_https_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_8_1" {
  title       = "Cryptographic Protection SC-8(1) "
  description = "The information system implements cryptographic mechanisms to prevent unauthorized disclosure of information and detect changes to information during transmission unless otherwise protected by organization-defined alternative physical safeguards."
  children = [
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_use_https,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_secure_communication_protocols_configured,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.kubernetes_cluster_https_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_12" {
  title       = "Cryptographic Key Establishment and Management (SC-12)"
  description = "The organization establishes and manages cryptographic keys for required cryptography employed within the information system in accordance with organization-defined requirements for key generation, distribution, storage, access, and destruction."
  children = [
    control.automation_account_encrypted_with_cmk,
    control.batch_account_encrypted_with_cmk,
    control.bot_service_encrypted_with_cmk,
    control.cognitive_account_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.container_registry_encrypted_with_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk,
    control.data_factory_encrypted_with_cmk,
    control.databox_job_unlock_password_encrypted_with_cmk,
    control.eventhub_namespace_cmk_encryption_enabled,
    control.hdinsight_cluster_encrypted_at_rest_with_cmk,
    control.hdinsight_cluster_encryption_at_host_enabled,
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.hpc_cache_encrypted_with_cmk,
    control.iot_hub_encrypted_with_cmk,
    control.kubernetes_cluster_os_and_data_disks_encrypted_with_cmk,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.logic_app_integration_service_environment_encrypted_with_cmk,
    control.machine_learning_workspace_encrypted_with_cmk,
    control.monitor_log_analytics_workspace_integrated_with_encrypted_storage_account,
    control.monitor_log_cluster_encrypted_with_cmk,
    control.mssql_managed_instance_encryption_at_rest_using_cmk,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.postgres_sql_server_encrypted_at_rest_using_cmk,
    control.recovery_service_vault_encrypted_with_cmk,
    control.servicebus_premium_namespace_cmk_encrypted,
    control.sql_server_tde_protector_cmk_encrypted,
    control.storage_account_encryption_at_rest_using_cmk,
    control.storage_account_encryption_scopes_encrypted_at_rest_with_cmk,
    control.stream_analytics_job_encrypted_with_cmk,
    control.synapse_workspace_encryption_at_rest_using_cmk
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_28" {
  title       = "Protection of Information at Rest (SC-28)"
  description = "The information system protects the confidentiality and integrity of organization-defined information at rest."
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_28_1,
    control.app_service_environment_internal_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted,
    control.databox_edge_device_double_encryption_enabled,
    control.databox_job_double_encryption_enabled,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_server_transparent_data_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_28_1" {
  title       = "Cryptographic Protection SC-28(1)"
  description = "The information system implements cryptographic mechanisms to prevent unauthorized disclosure and modification of organization-defined information on organization-defined information system components."
  children = [
    control.app_service_environment_internal_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted,
    control.databox_edge_device_double_encryption_enabled,
    control.databox_job_double_encryption_enabled,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_server_transparent_data_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
