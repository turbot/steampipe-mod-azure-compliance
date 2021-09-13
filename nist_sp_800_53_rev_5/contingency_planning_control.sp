benchmark "nist_sp_800_53_rev_5_cp" {
  title       = "Contingency Planning (CP)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_cp_6,
    benchmark.nist_sp_800_53_rev_5_cp_7,
    benchmark.nist_sp_800_53_rev_5_cp_9
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_cp_6" {
  title       = "Alternate Storage Site (CP-6)"
  description = "to  do"
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
  description = "to  do"
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
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cp_9" {
  title       = "System Backup (CP-9)"
  description = "to  do"
  children = [
    control.keyvault_purge_protection_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
