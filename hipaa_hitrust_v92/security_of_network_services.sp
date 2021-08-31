benchmark "hipaa_hitrust_v92_security_of_network_services" {
  title    = "Security of Network Services"
  children = [
    benchmark.hipaa_hitrust_v92_0835_09n1organizational_1_09_n,
    benchmark.hipaa_hitrust_v92_0836_09_n2organizational_1_09_n,
    benchmark.hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n,
    benchmark.hipaa_hitrust_v92_0885_09n2organizational_3_09_n,
    benchmark.hipaa_hitrust_v92_0886_09n2Organizational_4_09_n,
    benchmark.hipaa_hitrust_v92_0887_09n2organizational_5_09_n,
    benchmark.hipaa_hitrust_v92_0888_09n2Organizational_6_09_n
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n" {
  title    = "Formal agreements with external information system providers include specific obligations for security and privacy"
  children = [
    control.network_watcher_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0886_09n2Organizational_4_09_n" {
  title       = "Formal agreement for allowing specific information systems to connect to external information systems"
  description = "The organization employs and documents in a formal agreement or other document, either i) allow-all, deny-by-exception, or, ii) deny-all, permit-by-exception (preferred), policy for allowing specific information systems to connect to external information systems."
  children = [
    control.network_watcher_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0888_09n2Organizational_6_09_n" {
  title    = "The contract with the external/outsourced service provider includes the specification that the service provider is responsible for the protection of covered information shared"
  children = [
    control.network_watcher_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0835_09n1organizational_1_09_n" {
  title    = "Agreed services provided by a network service provider/manager are formally managed and monitored to ensure they are provided securely"
  children = [
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_uses_azure_resource_manager
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0887_09n2organizational_5_09_n" {
  title    = "The organization requires external/outsourced service providers to identify the specific functions, ports, and protocols used in the provision of the external/outsourced services"
  children = [
    control.compute_vm_network_traffic_data_collection_windows_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0836_09_n2organizational_1_09_n" {
  title    = "The organization formally authorizes and documents the characteristics of each connection from an information system to other information systems outside the organization"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0885_09n2organizational_3_09_n" {
  title    = "The organization reviews and updates the interconnection security agreements on an ongoing basis verifying enforcement of security requirements"
  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}