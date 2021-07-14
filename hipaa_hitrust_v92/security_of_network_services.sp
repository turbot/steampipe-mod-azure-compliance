benchmark "hipaa_hitrust_v92_security_of_network_services" {
  title         = "Security of Network Services"
  children = [
    benchmark.hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n,
    benchmark.hipaa_hitrust_v92_0886_09n2Organizational_4_09_n,
    benchmark.hipaa_hitrust_v92_0888_09n2Organizational_6_09_n
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n" {
  title         = "0837.09.n2Organizational.2 - 09.n"
  description   = "Formal agreements with external information system providers include specific obligations for security and privacy."
  children = [
    control.hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0837_09_n2Organizational_2_09_n_1" {
  title         = "Network Watcher should be enabled"
  description   = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region."
  sql           = query.network_watcher_enabled.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0886_09n2Organizational_4_09_n" {
  title         = "0886.09n2Organizational.4 - 09.n"
  description   = "The organization employs and documents in a formal agreement or other document, either i) allow-all, deny-by-exception, or, ii) deny-all, permit-by-exception (preferred), policy for allowing specific information systems to connect to external information systems."
  children = [
    control.hipaa_hitrust_v92_0886_09n2Organizational_4_09_n_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0886_09n2Organizational_4_09_n_1" {
  title         = "Network Watcher should be enabled"
  description   = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region.."
  sql           = query.network_watcher_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0888_09n2Organizational_6_09_n" {
  title         = "0888.09n2Organizational.6 - 09.n "
  description   = "The contract with the external/outsourced service provider includes the specification that the service provider is responsible for the protection of covered information shared."
  children = [
    control.hipaa_hitrust_v92_0888_09n2Organizational_6_09_n_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0888_09n2Organizational_6_09_n_1" {
  title         = "Network Watcher should be enabled"
  description   = "Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level in, to, and from Azure. Scenario level monitoring enables you to diagnose problems at an end to end network level view. It is required to have a network watcher resource group to be created in every region where a virtual network is present. An alert is enabled if a network watcher resource group is not available in a particular region.."
  sql           = query.network_watcher_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}
