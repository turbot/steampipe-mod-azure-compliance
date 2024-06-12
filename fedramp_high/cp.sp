benchmark "fedramp_high_contingency_planning" {
  title       = "Contingency Planning"
  description = "The organization must develop, document, and periodically update system security plans that describe system boundaries, system environments of operation, how security requirements are implemented, and the relationships with or connections to other systems. The organization must also develop and implement configuration management plans for the information system."

  children = [
    benchmark.fedramp_high_contingency_planning_6,
    benchmark.fedramp_high_contingency_planning_7,
    benchmark.fedramp_high_contingency_planning_9
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_contingency_planning_6" {
  title = "Alternate Storage Site-6"

  children = [
    benchmark.fedramp_high_contingency_planning_6_1,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "fedramp_high_contingency_planning_6_1" {
  title = "Separation From Primary Site-6.1"

  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "fedramp_high_contingency_planning_7" {
  title = "Alternate Processing Site-7"

  children = [
    control.compute_vm_disaster_recovery_enabled
  ]
}

benchmark "fedramp_high_contingency_planning_9" {
  title = "Information System Backup-9"

  children = [
    control.keyvault_purge_protection_enabled,
    control.keyvault_soft_delete_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]
}