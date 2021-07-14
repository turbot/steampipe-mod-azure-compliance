benchmark "hipaa_hitrust_v92_back_up" {
  title         = "On-line Transactions"
  children = [
    benchmark.hipaa_hitrust_v92_1618_09l1organizational_45_09_l,
    benchmark.hipaa_hitrust_v92_1623_09l2organizational_4_09_l,
    benchmark.hipaa_hitrust_v92_1626_09l30rganizational_5_09_l
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1618_09l1organizational_45_09_l" {
  title         = "1618.09l1Organizational.45 - 09.l"
  description   = "The backups are stored in a physically secure remote location, at a sufficient distance to make them reasonably immune from damage to data at the primary site, and reasonable physical and environmental controls are in place to ensure their protection at the remote location."
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1623_09l2organizational_4_09_l" {
  title         = "1623.09l2Organizational.4 - 09.l"
  description   = "Covered information is backed-up in an encrypted format to ensure confidentiality."
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1626_09l30rganizational_5_09_l" {
  title         = "1626.09l3Organizational.5 - 09.l"
  description   = "The organization ensures a current, retrievable copy of covered information is available before movement of servers.."
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
