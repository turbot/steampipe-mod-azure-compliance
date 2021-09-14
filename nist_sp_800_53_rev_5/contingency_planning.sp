benchmark "nist_sp_800_53_rev_5_cp" {
  title       = "Contingency Planning (CP)"
  description = "The CP control family includes controls specific to an organization's contingency plan if a cybersecurity event should occur. This includes controls like contingency plan testing, updating, training, and backups, and system reconstitution."
  children = [
    benchmark.nist_sp_800_53_rev_5_cp_6,
    benchmark.nist_sp_800_53_rev_5_cp_7,
    benchmark.nist_sp_800_53_rev_5_cp_9
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_cp_6" {
  title       = "Alternate Storage Site (CP-6)"
  description = "The organization establishes an alternate storage site including necessary agreements to permit the storage and retrieval of information system backup information and ensures that the alternate storage site provides information security safeguards equivalent to that of the primary site."
  children = [
    benchmark.nist_sp_800_53_rev_5_cp_6_1,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cp_6_1" {
  title       = "CP-6(1) Separation from Primary Site"
  description = "The organization identifies an alternate storage site that is separated from the primary storage site to reduce susceptibility to the same threats."
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cp_7" {
  title       = "Alternate Processing Site (CP-7)"
  description = "The organization establishes an alternate processing site including necessary agreements to permit the transfer and resumption of organization-defined information system operations for essential missions/business functions within an organization-defined time period consistent with recovery time and recovery point objectives when the primary processing capabilities are unavailable, ensures that equipment and supplies required to transfer and resume operations are available at the alternate processing site or contracts are in place to support delivery to the site within the organization-defined time period for transfer/resumption and ensure that the alternate processing site provides information security safeguards equivalent to that of the primary site."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cp_9" {
  title       = "System Backup (CP-9)"
  description = "The organization conducts backups of information system documentation including security-related documentation, user-level and system-level information contained in the information system with recovery time and recovery point objectives, and protects the confidentiality, integrity, and availability of backup information at storage locations."
  children = [
    control.keyvault_purge_protection_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
