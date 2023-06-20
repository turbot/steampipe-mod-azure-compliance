benchmark "hipaa_hitrust_v92_network_protection" {
  title = "08 Network Protection"
  description = "The organization's security gateways (e.g. firewalls) enforce security policies and are configured to filter traffic between domains, block unauthorized access, and are used to maintain segregation between internal wired, internal wireless, and external network segments (e.g., the Internet) including DMZs and enforce access control policies for each of the domains."
  children = [
    benchmark.hipaa_hitrust_v92_0805_01m1organizational_12_01_m,
    benchmark.hipaa_hitrust_v92_0806_01m2organizational_12356_01_m,
    benchmark.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n,
    benchmark.hipaa_hitrust_v92_0810_01n2organizational_5_01_n,
    benchmark.hipaa_hitrust_v92_0811_01n2organizational_6_01_n,
    benchmark.hipaa_hitrust_v92_0812_01n2organizational_8_01_n,
    benchmark.hipaa_hitrust_v92_0814_01n1organizational_12_01_n,
    benchmark.hipaa_hitrust_v92_0835_09n1organizational_1_09_n,
    benchmark.hipaa_hitrust_v92_0836_09_n2organizational_1_09_n,
    benchmark.hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n,
    benchmark.hipaa_hitrust_v92_0858_09m1organizational_4_09_m,
    benchmark.hipaa_hitrust_v92_0859_09m1organizational_78_09_m,
    benchmark.hipaa_hitrust_v92_0860_09m1organizational_9_09_m,
    benchmark.hipaa_hitrust_v92_0861_09m2organizational_67_09_m,
    benchmark.hipaa_hitrust_v92_0862_09m2organizational_8_09_m,
    benchmark.hipaa_hitrust_v92_0863_09m2organizational_910_09_m,
    benchmark.hipaa_hitrust_v92_0864_09m2organizational_12_09_m,
    benchmark.hipaa_hitrust_v92_0865_09m2organizational_13_09_m,
    benchmark.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m,
    benchmark.hipaa_hitrust_v92_0868_09m3organizational_18_09_m,
    benchmark.hipaa_hitrust_v92_0869_09m3organizational_19_09_m,
    benchmark.hipaa_hitrust_v92_0870_09m3organizational_20_09_m,
    benchmark.hipaa_hitrust_v92_0871_09m3organizational_22_09_m,
    benchmark.hipaa_hitrust_v92_0885_09n2organizational_3_09_n,
    benchmark.hipaa_hitrust_v92_0886_09n2Organizational_4_09_n,
    benchmark.hipaa_hitrust_v92_0887_09n2organizational_5_09_n,
    benchmark.hipaa_hitrust_v92_0888_09n2Organizational_6_09_n,
    benchmark.hipaa_hitrust_v92_0894_01m2organizational_7_01_m
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0805_01m1organizational_12_01_m" {
  title       = "0805.01m1Organizational.12-01.m 01.04 Network Access Control"
  description = "The organization's security gateways (e.g. firewalls) enforce security policies and are configured to filter traffic between domains, block unauthorized access, and are used to maintain segregation between internal wired, internal wireless, and external network segments (e.g., the Internet) including DMZs and enforce access control policies for each of the domains."
  children = [
    control.appservice_web_app_use_virtual_service_endpoint,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.container_registry_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.eventhub_namespace_use_virtual_service_endpoint,
    control.keyvault_vault_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_subnet_associated,
    control.sql_server_use_virtual_service_endpoint,
    control.storage_account_use_virtual_service_endpoint
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0806_01m2organizational_12356_01_m" {
  title       = "The organizations network is logically and physically segmented with a defined security perimeter and a graduated set of controls"
  description = "The organizations network is logically and physically segmented with a defined security perimeter and a graduated set of controls, including subnetworks for publicly accessible system components that are logically separated from the internal network, based on organizational requirements; and traffic is controlled based on functionality required and classification of the data/systems based on a risk assessment and their respective security requirements."
  children = [
    control.appservice_web_app_use_virtual_service_endpoint,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.container_registry_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.eventhub_namespace_use_virtual_service_endpoint,
    control.keyvault_vault_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_subnet_associated,
    control.sql_server_use_virtual_service_endpoint,
    control.storage_account_use_virtual_service_endpoint
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n" {
  title       = "0809.01n2Organizational.1234-01.n 01.04 Network Access Control"
  description = "Network traffic is controlled in accordance with the organizations access control policy through firewall and other network-related restrictions for each network access point or external telecommunication service's managed interface."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0810_01n2organizational_5_01_n" {
  title       = "0810.01n2Organizational.5-01.n 01.04 Network Access Control"
  description = "Transmitted information is secured and, at a minimum, encrypted over open, public networks"
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0811_01n2organizational_6_01_n" {
  title       = "0811.01n2Organizational.6-01.n 01.04 Network Access Control"
  description = "Exceptions to the traffic flow policy are documented with a supporting mission/business need, duration of the exception, and reviewed at least annually; traffic flow policy exceptions are removed when no longer supported by an explicit mission/business need."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0812_01n2organizational_8_01_n" {
  title       = "0812.01n2Organizational.8-01.n 01.04 Network Access Control"
  description = "Remote devices establishing a non-remote connection are not allowed to communicate with external (remote) resources"
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0814_01n1organizational_12_01_n" {
  title       = "0814.01n1Organizational.12-01.n 01.04 Network Access Control"
  description = "The ability of users to connect to the internal network is restricted using a deny-by-default and allow-by-exception policy at managed interfaces according to the access control policy and the requirements of clinical and business applications."
  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0835_09n1organizational_1_09_n" {
  title       = "0835.09n1Organizational.1-09.n 09.06 Network Security Management"
  description = "Agreed services provided by a network service provider/manager are formally managed and monitored to ensure they are provided securely"
  children = [
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_uses_azure_resource_manager
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0836_09_n2organizational_1_09_n" {
  title       = "0836.09.n2Organizational.1-09.n 09.06 Network Security Management"
  description = "The organization formally authorizes and documents the characteristics of each connection from an information system to other information systems outside the organization"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n" {
  title       = "0837.09.n2Organizational.2-09.n 09.06 Network Security Management"
  description = "Formal agreements with external information system providers include specific obligations for security and privacy"
  children = [
    control.network_watcher_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_0858_09m1organizational_4_09_m" {
  title       = "0858.09m1Organizational.4-09.m 09.06 Network Security Management"
  description = "The organization monitors for all authorized and unauthorized wireless access to the information system and prohibits installation of wireless access points (WAPs) unless explicitly authorized in writing by the CIO or his/her designated representative."
  children = [
    control.compute_vm_jit_access_protected,
    control.compute_vm_meet_firewall_properties_windows,
    control.compute_vm_remote_access_restricted_all_ports
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0859_09m1organizational_78_09_m" {
  title       = "0859.09m1Organizational.78-09.m 09.06 Network Security Management"
  description = "The organization ensures the security of information in networks, availability of network services and information services using the network, and the protection of connected services from unauthorized access"
  children = [
    control.compute_vm_adaptive_network_hardening_recommendation_applied
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0860_09m1organizational_9_09_m" {
  title       = "0860.09m1Organizational.9-09.m 09.06 Network Security Management"
  description = "The organization formally manages equipment on the network, including equipment in user areas"
  children = [
    control.network_security_group_diagnostic_setting_deployed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_0861_09m2organizational_67_09_m" {
  title       = "0861.09m2Organizational.67-09.m 09.06 Network Security Management"
  description = "To identify and authenticate devices on local and/or wide area networks, including wireless networks, the information system uses either a (i) shared known information solution or (ii) an organizational authentication solution, the exact selection and strength of which is dependent on the security categorization of the information system."
  children = [
    control.appservice_web_app_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_0862_09m2organizational_8_09_m" {
  title       = "0862.09m2Organizational.8-09.m 09.06 Network Security Management"
  description = "The organization ensures information systems protect the confidentiality and integrity of transmitted information, including during preparation for transmission and during reception"
  children = [
    control.sql_server_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/SQL"
  })
}

benchmark "hipaa_hitrust_v92_0863_09m2organizational_910_09_m" {
  title       = "0863.09m2Organizational.910-09.m 09.06 Network Security Management"
  description = "The organization builds a firewall configuration that restricts connections between un-trusted networks and any system components in the covered information environment; and any changes to the firewall configuration are updated in the network diagram."
  children = [
    control.eventhub_namespace_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/EventHub"
  })
}

benchmark "hipaa_hitrust_v92_0864_09m2organizational_12_09_m" {
  title       = "0864.09m2Organizational.12-09.m 09.06 Network Security Management"
  description = "Usage restrictions and implementation guidance are formally defined for VoIP, including the authorization and monitoring of the service"
  children = [
    control.cosmosdb_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/CosmosDB"
  })
}

benchmark "hipaa_hitrust_v92_0865_09m2organizational_13_09_m" {
  title       = "0865.09m2Organizational.13-09.m 09.06 Network Security Management"
  description = "The organization (i) authorizes connections from the information system to other information systems outside of the organization through the use of interconnection security agreements or other formal agreement; (ii) documents each connection, the interface characteristics, security requirements, and the nature of the information communicated; (iii) employs a deny all, permit by exception policy for allowing connections from the information system to other information systems outside of the organization; and (iv) applies a default-deny rule that drops all traffic via host-based firewalls or port filtering tools on its endpoints (workstations, servers, etc.), except those services and ports that are explicitly allowed."
  children = [
    control.keyvault_vault_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/KeyVault"
  })
}

benchmark "hipaa_hitrust_v92_0866_09m3organizational_1516_09_m" {
  title       = "0866.09m3Organizational.1516-09.m 09.06 Network Security Management"
  description = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure"
  children = [
    control.storage_account_default_network_access_rule_denied
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0868_09m3organizational_18_09_m" {
  title = "0868.09m3Organizational.18-09.m 09.06 Network Security Management"
  description = "The organization builds a firewall configuration to restrict inbound and outbound traffic to that which is necessary for the covered data environment"
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "hipaa_hitrust_v92_0869_09m3organizational_19_09_m" {
  title = "0869.09m3Organizational.19-09.m 09.06 Network Security Management"
  description = "The router configuration files are secured and synchronized"
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "hipaa_hitrust_v92_0870_09m3organizational_20_09_m" {
  title       = "0870.09m3Organizational.20-09.m 09.06 Network Security Management"
  description = "Access to all proxies is denied, except for those hosts, ports, and services that are explicitly required"
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "hipaa_hitrust_v92_0871_09m3organizational_22_09_m" {
  title       = "0871.09m3Organizational.22-09.m 09.07 Network Security Management"
  description = "Authoritative DNS servers are segregated into internal and external roles"
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "hipaa_hitrust_v92_0885_09n2organizational_3_09_n" {
  title       = "0885.09n2Organizational.3-09.n 09.06 Network Security Management"
  description = "The organization reviews and updates the interconnection security agreements on an ongoing basis verifying enforcement of security requirements"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0886_09n2Organizational_4_09_n" {
  title       = "0886.09n2Organizational.4-09.n 09.06 Network Security Management"
  description = "The organization employs and documents in a formal agreement or other document, either i) allow-all, deny-by-exception, or, ii) deny-all, permit-by-exception (preferred), policy for allowing specific information systems to connect to external information systems."
  children = [
    control.network_watcher_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_0887_09n2organizational_5_09_n" {
  title       = "0887.09n2Organizational.5-09.n 09.06 Network Security Management"
  description = "The organization requires external/outsourced service providers to identify the specific functions, ports, and protocols used in the provision of the external/outsourced services"
  children = [
    control.compute_vm_network_traffic_data_collection_windows_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0888_09n2Organizational_6_09_n" {
  title       = "0888.09n2Organizational.6-09.n 09.06 Network Security Management"
  description = "The contract with the external/outsourced service provider includes the specification that the service provider is responsible for the protection of covered information shared"
  children = [
    control.network_watcher_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_0894_01m2organizational_7_01_m" {
  title       = "0894.01m2Organizational.7-01.m 01.04 Network Access Control"
  description = "Networks are segregated from production-level networks when migrating physical servers, applications or data to virtualized servers"
  children = [
    control.appservice_web_app_use_virtual_service_endpoint,
    control.compute_vm_attached_with_network,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.container_registry_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.eventhub_namespace_use_virtual_service_endpoint,
    control.keyvault_vault_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_subnet_associated,
    control.network_watcher_in_regions_with_virtual_network,
    control.sql_server_use_virtual_service_endpoint,
    control.storage_account_use_virtual_service_endpoint
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}
