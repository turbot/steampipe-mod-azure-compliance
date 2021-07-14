benchmark "hipaa_hitrust_v92_network_controls" {
  title         = "Network Controls"
  children = [
    benchmark.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m,
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