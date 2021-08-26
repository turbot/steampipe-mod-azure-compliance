benchmark "hipaa_hitrust_v92_network_controls" {
  title         = "Network Controls"
  children = [
    benchmark.hipaa_hitrust_v92_0858_09m1organizational_4_09_m,
    benchmark.hipaa_hitrust_v92_0859_09m1organizational_78_09_m,
    benchmark.hipaa_hitrust_v92_0860_09m1organizational_9_09_m,
    benchmark.hipaa_hitrust_v92_0861_09m2organizational_67_09_m,
    benchmark.hipaa_hitrust_v92_0862_09m2organizational_8_09_m,
    benchmark.hipaa_hitrust_v92_0863_09m2organizational_910_09_m,
    benchmark.hipaa_hitrust_v92_0864_09m2organizational_12_09_m,
    benchmark.hipaa_hitrust_v92_0865_09m2organizational_13_09_m,
    benchmark.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m,
    benchmark.hipaa_hitrust_v92_0867_09m3organizational_17_09_m,
    benchmark.hipaa_hitrust_v92_0868_09m3organizational_18_09_m,
    benchmark.hipaa_hitrust_v92_0869_09m3organizational_19_09_m,
    benchmark.hipaa_hitrust_v92_0870_09m3organizational_20_09_m,
    benchmark.hipaa_hitrust_v92_0871_09m3organizational_22_09_m
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0858_09m1organizational_4_09_m" {
  title         = "0858.09m1Organizational.4 - 09.m"
  description   = "The organization monitors for all authorized and unauthorized wireless access to the information system and prohibits installation of wireless access points (WAPs) unless explicitly authorized in writing by the CIO or his/her designated representative."
  children = [
    control.compute_vm_jit_access_protected,
    control.compute_vm_meet_firewall_properties_windows,
    control.compute_vm_remote_access_restricted_all_ports
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0866_09m3organizational_1516_09_m" {
  title         = "0866.09m3Organizational.1516 - 09.m"
  description   = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure."
  children = [
    control.storage_account_default_network_access_rule_denied
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0867_09m3organizational_17_09_m" {
  title         = "0867.09m3Organizational.17 - 09.m"
  description   = "Wireless access points are placed in secure areas and shut down when not in use (e.g. nights, weekends)."
  children = [
    control.storage_account_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0868_09m3organizational_18_09_m" {
  title         = "0868.09m3Organizational.18 - 09.m"
  description   = "The organization builds a firewall configuration to restrict inbound and outbound traffic to that which is necessary for the covered data environment."
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0862_09m2organizational_8_09_m" {
  title         = "0862.09m2Organizational.8 - 09.m"
  description   = "The organization ensures information systems protect the confidentiality and integrity of transmitted information, including during preparation for transmission and during reception."
  children = [
    control.sql_server_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0863_09m2organizational_910_09_m" {
  title         = "0863.09m2Organizational.910 - 09.m"
  description   = "The organization builds a firewall configuration that restricts connections between un-trusted networks and any system components in the covered information environment; and any changes to the firewall configuration are updated in the network diagram."
  children = [
    control.eventhub_namespace_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0865_09m2organizational_13_09_m" {
  title         = "0865.09m2Organizational.13 - 09.m"
  description   = "The organization (i) authorizes connections from the information system to other information systems outside of the organization through the use of interconnection security agreements or other formal agreement; (ii) documents each connection, the interface characteristics, security requirements, and the nature of the information communicated; (iii) employs a deny all, permit by exception policy for allowing connections from the information system to other information systems outside of the organization; and (iv) applies a default-deny rule that drops all traffic via host-based firewalls or port filtering tools on its endpoints (workstations, servers, etc.), except those services and ports that are explicitly allowed."
  children = [
    control.keyvault_vault_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0869_09m3organizational_19_09_m" {
  title         = "0869.09m3Organizational.19 - 09.m"
  description   = "The router configuration files are secured and synchronized."
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0870_09m3organizational_20_09_m" {
  title         = "0870.09m3Organizational.20 - 09.m"
  description   = "Access to all proxies is denied, except for those hosts, ports, and services that are explicitly required."
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0871_09m3organizational_22_09_m" {
  title         = "0871.09m3Organizational.22 - 09.m"
  description   = "Authoritative DNS servers are segregated into internal and external roles."
  children = [
    control.container_registry_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0859_09m1organizational_78_09_m" {
  title         = "0859.09m1Organizational.78 - 09.m"
  description   = "The organization ensures the security of information in networks, availability of network services and information services using the network, and the protection of connected services from unauthorized access."
  children = [
    control.compute_vm_adaptive_network_hardening_recommendation_applied
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0861_09m2organizational_67_09_m" {
  title         = "0861.09m2Organizational.67 - 09.m"
  description   = "To identify and authenticate devices on local and/or wide area networks, including wireless networks,  the information system uses either a (i) shared known information solution or (ii) an organizational authentication solution, the exact selection and strength of which is dependent on the security categorization of the information system."
  children = [
    control.appservice_web_app_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0864_09m2organizational_12_09_m" {
  title         = "0864.09m2Organizational.12 - 09.m"
  description   = "Usage restrictions and implementation guidance are formally defined for VoIP, including the authorization and monitoring of the service."
  children = [
    control.cosmosdb_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0860_09m1organizational_9_09_m" {
  title         = "0860.09m1Organizational.9 - 09.m"
  description   = "The organization formally manages equipment on the network, including equipment in user areas."
  children = [
    control.network_security_group_diagnostic_setting_deployed
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}