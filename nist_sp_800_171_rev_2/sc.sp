benchmark "nist_sp_800_171_rev_2_3_13" {
  title       = "3.13 System and Communications Protection"
  description = "The SC control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_13_1,
    benchmark.nist_sp_800_171_rev_2_3_13_2,
    benchmark.nist_sp_800_171_rev_2_3_13_5,
    benchmark.nist_sp_800_171_rev_2_3_13_6,
    benchmark.nist_sp_800_171_rev_2_3_13_8,
    benchmark.nist_sp_800_171_rev_2_3_13_10,
    benchmark.nist_sp_800_171_rev_2_3_13_16
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_13_1" {
  title       = "3.13.1 Monitor, control, and protect communications (i.e., information transmitted or received by organizational systems) at the external boundaries and key internal boundaries of organizational systems"
  description = "Communications can be monitored, controlled, and protected at boundary components and by restricting or prohibiting interfaces in organizational systems. Boundary components include gateways, routers, firewalls, guards, network-based malicious code analysis and virtualization systems, or encrypted tunnels implemented within a system security architecture (e.g., routers protecting firewalls or application gateways residing on protected subnetworks). Restricting or prohibiting interfaces in organizational systems includes restricting external web communications traffic to designated web servers within managed interfaces and prohibiting external traffic that appears to be spoofing internal addresses. Organizations consider the shared nature of commercial telecommunications services in the implementation of security requirements associated with the use of such services. Commercial telecommunications services are commonly based on network components and consolidated management systems shared by all attached commercial customers and may also include third party-provided access lines and other service elements. Such transmission services may represent sources of increased risk despite contract security provisions."
  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
    control.cognitive_account_private_link_used,
    control.cognitive_service_local_auth_disabled,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
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

benchmark "nist_sp_800_171_rev_2_3_13_10" {
  title       = "3.13.10 Establish and manage cryptographic keys for cryptography employed in organizational systems"
  description = "Cryptographic key management and establishment can be performed using manual procedures or mechanisms supported by manual procedures. Organizations define key management requirements in accordance with applicable federal laws, Executive Orders, policies, directives, regulations, and standards specifying appropriate options, levels, and parameters."
  children = [
    control.automation_account_encrypted_with_cmk,
    control.batch_account_encrypted_with_cmk,
    control.bot_service_encrypted_with_cmk,
    control.cognitive_account_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.container_instance_container_group_encrypted_using_cmk,
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
}

benchmark "nist_sp_800_171_rev_2_3_13_16" {
  title       = "3.13.16 Protect the confidentiality of CUI at rest"
  description = "Information at rest refers to the state of information when it is not in process or in transit and is located on storage devices as specific components of systems. The focus of protection at rest is not on the type of storage device or the frequency of access but rather the state of the information. Organizations can use different mechanisms to achieve confidentiality protections, including the use of cryptographic mechanisms and file share scanning. Organizations may also use other controls including secure off-line storage in lieu of online storage when adequate protection of information at rest cannot otherwise be achieved or continuous monitoring to identify malicious code at rest."
  children = [
    control.app_service_environment_internal_encryption_enabled,
    control.automation_account_variable_encryption_enabled,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
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
}

benchmark "nist_sp_800_171_rev_2_3_13_2" {
  title       = "3.13.2 Employ architectural designs, software development techniques, and systems engineering principles that promote effective information security within organizational systems"
  description = "Organizations apply systems security engineering principles to new development systems or systems undergoing major upgrades. For legacy systems, organizations apply systems security engineering principles to system upgrades and modifications to the extent feasible, given the current state of hardware, software, and firmware components within those systems. The application of systems security engineering concepts and principles helps to develop trustworthy, secure, and resilient systems and system components and reduce the susceptibility of organizations to disruptions, hazards, and threats. Examples of these concepts and principles include developing layered protections; establishing security policies, architecture, and controls as the foundation for design; incorporating security requirements into the system development life cycle; delineating physical and logical security boundaries; ensuring that developers are trained on how to build secure software; and performing threat modeling to identify use cases, threat agents, attack vectors and patterns, design patterns, and compensating controls needed to mitigate risk. Organizations that apply security engineering concepts and principles can facilitate the development of trustworthy, secure systems, system components, and system services; reduce risk to acceptable levels; and make informed risk-management decisions."
  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
    control.cognitive_account_private_link_used,
    control.cognitive_service_local_auth_disabled,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
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

benchmark "nist_sp_800_171_rev_2_3_13_5" {
  title       = "3.13.5 Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks"
  description = "Subnetworks that are physically or logically separated from internal networks are referred to as demilitarized zones (DMZs). DMZs are typically implemented with boundary control devices and techniques that include routers, gateways, firewalls, virtualization, or cloud-based technologies."
  children = [
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.application_gateway_waf_enabled,
    control.cognitive_account_private_link_used,
    control.cognitive_service_local_auth_disabled,
    control.compute_disk_access_uses_private_link,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
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

benchmark "nist_sp_800_171_rev_2_3_13_6" {
  title       = "3.13.6 Deny network communications traffic by default and allow network communications traffic by exception (i.e., deny all, permit by exception)"
  description = "This requirement applies to inbound and outbound network communications traffic at the system boundary and at identified points within the system. A deny-all, permit-by-exception network communications traffic policy ensures that only those connections which are essential and approved are allowed."
  children = [
    control.application_gateway_waf_enabled,
    control.cognitive_service_local_auth_disabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.container_registry_restrict_public_access,
    control.cosmosdb_account_with_firewall_rules,
    control.frontdoor_waf_enabled,
    control.keyvault_firewall_enabled,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_subnet_protected_by_firewall,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.sql_db_public_network_access_disabled,
    control.storage_account_block_public_access,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_restrict_network_access
  ]
}

benchmark "nist_sp_800_171_rev_2_3_13_8" {
  title       = "3.13.8 Implement cryptographic mechanisms to prevent unauthorized disclosure of CUI during transmission unless otherwise protected by alternative physical safeguards"
  description = "This requirement applies to internal and external networks and any system components that can transmit information including servers, notebook computers, desktop computers, mobile devices, printers, copiers, scanners, and facsimile machines. Communication paths outside the physical protection of controlled boundaries are susceptible to both interception and modification. Organizations relying on commercial providers offering transmission services as commodity services rather than as fully dedicated services (i.e., services which can be highly specialized to individual customer needs), may find it difficult to obtain the necessary assurances regarding the implementation of the controls for transmission confidentiality. In such situations, organizations determine what types of confidentiality services are available in commercial telecommunication service packages. If it is infeasible or impractical to obtain the necessary safeguards and assurances of the effectiveness of the safeguards through appropriate contracting vehicles, organizations implement compensating safeguards or explicitly accept the additional risk. An example of an alternative physical safeguard is a protected distribution system (PDS) where the distribution medium is protected against electronic or physical intercept, thereby ensuring the confidentiality of the information being transmitted."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_use_https,
    control.hdinsight_cluster_encryption_in_transit_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]
}
