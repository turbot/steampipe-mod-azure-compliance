benchmark "hipaa_hitrust_v92_network_controls" {
  title         = "Network Controls"
  children = [
    benchmark.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m,
    #benchmark.hipaa_hitrust_v92_1153_01c3system_35_01_c
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0866_09m3organizational_1516_09_m" {
  title         = "0866.09m3Organizational.1516 - 09.m"
  description   = "The organization describes the groups, roles, and responsibilities for the logical management of network components and ensures coordination of and consistency in the elements of the network infrastructure."
  children = [
    control.hipaa_hitrust_v92_0866_09m3organizational_1516_09_m_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0866_09m3organizational_1516_09_m_1" {
  title         = "Storage accounts should restrict network access"
  description   = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  sql           = query.storage_account_default_network_access_rule_denied.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}