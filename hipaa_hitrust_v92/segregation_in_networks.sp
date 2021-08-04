benchmark "hipaa_hitrust_v92_segregation_in_networks" {
  title         = "Segregation in Networks"
  children = [
    benchmark.hipaa_hitrust_v92_0805_01m1organizational_12_01_m,
    benchmark.hipaa_hitrust_v92_0806_01m2organizational_12356_01_m,
    benchmark.hipaa_hitrust_v92_0894_01m2organizational_7_01_m
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0805_01m1organizational_12_01_m" {
  title         = "0805.01m1Organizational.12 - 01.m"
  description   = "The organization's security gateways (e.g. firewalls) enforce security policies and are configured to filter traffic between domains, block unauthorized access, and are used to maintain segregation between internal wired, internal wireless, and external network segments (e.g., the Internet) including DMZs and enforce access control policies for each of the domains."
  children = [
    control.network_security_group_subnet_associated,
    control.appservice_web_app_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_access_restricted_public_vm,
    control.storage_account_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0806_01m2organizational_12356_01_m" {
  title         = "0806.01m2Organizational.12356 - 01.m"
  description   = "The organizations network is logically and physically segmented with a defined security perimeter and a graduated set of controls, including subnetworks for publicly accessible system components that are logically separated from the internal network, based on organizational requirements; and traffic is controlled based on functionality required and classification of the data/systems based on a risk assessment and their respective security requirements."
  children = [
    control.network_security_group_subnet_associated,
    control.appservice_web_app_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_access_restricted_public_vm,
    control.storage_account_use_virtual_service_endpoint
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0894_01m2organizational_7_01_m" {
  title         = "0894.01m2Organizational.7 - 01.m"
  description   = "Networks are segregated from production-level networks when migrating physical servers, applications or data to virtualized servers."
  children = [
    control.network_security_group_subnet_associated,
    control.appservice_web_app_use_virtual_service_endpoint,
    control.cosmosdb_use_virtual_service_endpoint,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_access_restricted_public_vm,
    control.storage_account_use_virtual_service_endpoint,
    control.compute_vm_attached_with_network

  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
