benchmark "fedramp_high_cp" {
  title       = "Contingency Planning (CP)"
  description = "Thecp control family includes controls specific to an organization's contingency plan if a cybersecurity event should occur. This includes controls like contingency plan testing, updating, training, and backups, and system reconstitution."

  children = [
    benchmark.fedramp_high_cp_6,
    benchmark.fedramp_high_cp_7,
    benchmark.fedramp_high_cp_9
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_cp_6" {
  title       = "Alternate Storage Sites (CP-6)"
  description = "a. Establish an alternate storage site, including necessary agreements to permit the storage and retrieval of system backup information; and b. Ensure that the alternate storage site provides controls equivalent to that of the primary site."

  children = [
    benchmark.fedramp_high_cp_6_1,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "fedramp_high_cp_6_1" {
  title       = "CP-6(1) Separation From Primary Site"
  description = "Identify an alternate storage site that is sufficiently separated from the primary storage site to reduce susceptibility to the same threats."

  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "fedramp_high_cp_7" {
  title = "Alternate Processing Site (CP-7)"

  children = [
    control.compute_vm_disaster_recovery_enabled
  ]
}

benchmark "fedramp_high_cp_9" {
  title       = "System Backup (CP-9)"
  description = "a. Conduct backups of user-level information contained in [Assignment: organization-defined system components] [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; b. Conduct backups of system-level information contained in the system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; c. Conduct backups of system documentation, including security- and privacy-related documentation [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; and d. Protect the confidentiality, integrity, and availability of backup information."

  children = [
    control.keyvault_purge_protection_enabled,
    control.keyvault_soft_delete_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]
}