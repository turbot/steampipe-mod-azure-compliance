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
    control.hipaa_hitrust_v92_1618_09l1organizational_45_09_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1618_09l1organizational_45_09_l_1" {
  title         = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  description   = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql           = query.postgres_db_server_geo_redundant_backup_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1623_09l2organizational_4_09_l" {
  title         = "1623.09l2Organizational.4 - 09.l"
  description   = "Covered information is backed-up in an encrypted format to ensure confidentiality."
  children = [
    control.hipaa_hitrust_v92_1623_09l2organizational_4_09_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1623_09l2organizational_4_09_l_1" {
  title         = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  description   = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql           = query.postgres_db_server_geo_redundant_backup_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1626_09l30rganizational_5_09_l" {
  title         = "1626.09l3Organizational.5 - 09.l"
  description   = "The organization ensures a current, retrievable copy of covered information is available before movement of servers.."
  children = [
    control.hipaa_hitrust_v92_1626_09l30rganizational_5_09_l_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1626_09l30rganizational_5_09_l_1" {
  title         = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  description   = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql           = query.postgres_db_server_geo_redundant_backup_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}
