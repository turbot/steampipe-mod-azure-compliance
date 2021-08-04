benchmark "hipaa_hitrust_v92_network_controls" {
  title         = "Network Controls"
  children = [
    benchmark.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m,
    benchmark.hipaa_hitrust_v92_0859_09m1organizational_78_09_m,
    benchmark.hipaa_hitrust_v92_0861_09m2organizational_67_09_m,
    benchmark.hipaa_hitrust_v92_0864_09m2organizational_12_09_m,
    benchmark.hipaa_hitrust_v92_0867_09m3organizational_17_09_m,
    benchmark.hipaa_hitrust_v92_0868_09m3organizational_18_09_m,
    benchmark.hipaa_hitrust_v92_0869_09m3organizational_19_09_m,
    benchmark.hipaa_hitrust_v92_0870_09m3organizational_20_09_m,
    benchmark.hipaa_hitrust_v92_0871_09m3organizational_22_09_m

  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0866_09m3organizational_1516_09_m" {
  title         = "0866.09m3Organizational.1516 - 09.m"
  description   = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure."
  children = [
    control.storage_account_default_network_access_rule_denied,
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
    control.compute_vm_remote_access_restricted
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