benchmark "rbi_itf_nbfc_v2017_business_continuity_planning" {
  title = "Business Continuity Planning"
  children = [
    benchmark.rbi_itf_nbfc_v2017_business_continuity_planning_6
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_business_continuity_planning_6" {
  title = "Business Continuity Planning (BCP) and Disaster Recovery-6"
  children = [
    benchmark.rbi_itf_nbfc_v2017_business_continuity_planning_6_2,
    benchmark.rbi_itf_nbfc_v2017_business_continuity_planning_6_3,
    benchmark.rbi_itf_nbfc_v2017_business_continuity_planning_6_4,
    control.compute_vm_disaster_recovery_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.recovery_service_vault_uses_private_link,
    control.recovery_service_vault_uses_private_link_for_backup,
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_business_continuity_planning_6_2" {
  title = "Recovery strategy / Contingency Plan-6.2"
  children = [
    control.compute_vm_disaster_recovery_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.recovery_service_vault_uses_private_link_for_backup,
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_business_continuity_planning_6_3" {
  title = "Recovery strategy / Contingency Plan-6.3"
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.recovery_service_vault_uses_private_link_for_backup,
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_business_continuity_planning_6_4" {
  title = "Recovery strategy / Contingency Plan-6.4"
  children = [
    control.compute_vm_disaster_recovery_enabled,
    control.recovery_service_vault_uses_private_link,
    control.recovery_service_vault_uses_private_link_for_backup
  ]
}
