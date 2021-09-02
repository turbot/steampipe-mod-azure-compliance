benchmark "hipaa_hitrust_v92_back_up" {
  title    = "Back-up"
  children = [
    benchmark.hipaa_hitrust_v92_11617_09l1organizational_23_09_l,
    benchmark.hipaa_hitrust_v92_1616_09l1organizational_16_09_l,
    benchmark.hipaa_hitrust_v92_1618_09l1organizational_45_09_l,
    benchmark.hipaa_hitrust_v92_1619_09l1organizational_7_09_l,
    benchmark.hipaa_hitrust_v92_1621_09l2organizational_1_09_l,
    benchmark.hipaa_hitrust_v92_1622_09l2organizational_23_09_l,
    benchmark.hipaa_hitrust_v92_1623_09l2organizational_4_09_l,
    benchmark.hipaa_hitrust_v92_1624_09l3organizational_12_09_l,
    benchmark.hipaa_hitrust_v92_1626_09l3organizational_5_09_l,
    benchmark.hipaa_hitrust_v92_1627_09l3organizational_6_09_l
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11617_09l1organizational_23_09_l" {
  title       = "A formal definition of the level of backup"
  description = "A formal definition of the level of backup required for each system is defined and documented including how each system will be restored, the scope of data to be imaged, frequency of imaging, and duration of retention based on relevant contractual, legal, regulatory and business requirements."
  children = [
    control.mysql_db_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1618_09l1organizational_45_09_l" {
  title       = "Storing and protecting the backups at the remote location"
  description = "The backups are stored in a physically secure remote location, at a sufficient distance to make them reasonably immune from damage to data at the primary site, and reasonable physical and environmental controls are in place to ensure their protection at the remote location"
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled,
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1619_09l1organizational_7_09_l" {
  title    = "Inventory records for the backup copies, including content and current location, are maintained"
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1622_09l2organizational_23_09_l" {
  title       = "Maintaining the integrity and security of the backup copies"
  description = "The integrity and security of the backup copies are maintained to ensure future availability, and any potential accessibility problems with the backup copies are identified and mitigated in the event of an area-wide disaster."
  children = [
    control.mysql_db_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1623_09l2organizational_4_09_l" {
  title    = "Covered information is backed-up in an encrypted format to ensure confidentiality"
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1624_09l3organizational_12_09_l" {
  title    = "The organization performs incremental or differential backups daily and full backups weekly to separate media"
  children = [
    control.mariadb_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1626_09l3organizational_5_09_l" {
  title    = "The organization ensures a current, retrievable copy of covered information is available before movement of servers"
  children = [
    control.postgres_db_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1627_09l3organizational_6_09_l" {
  title    = "The organization tests backup information following each backup to verify media reliability and information integrity, and at least annually thereafter"
  children = [
    control.mysql_db_server_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1616_09l1organizational_16_09_l" {
  title    = "Backup copies of information and software are made and tests of the media and restoration procedures are regularly performed at appropriate intervals"
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1621_09l2organizational_1_09_l" {
  title    = "Automated tools are used to track all backups"
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}