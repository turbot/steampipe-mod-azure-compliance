benchmark "nist_sp_800_171_r2_3_8" {
  title       = "3.8 Media Protection"
  description = "This control family help organizations control access to sensitive media. Requirements cover best practice storage or destruction of sensitive information and media in both physical and digital formats."
  children = [
    benchmark.nist_sp_800_171_r2_3_8_9
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_8_9" {
  title       = "3.8.9 Protect the confidentiality of backup CUI at storage locations"
  description = "Organizations can employ cryptographic mechanisms or alternative physical controls to protect the confidentiality of backup information at designated storage locations. Backed-up information containing CUI may include system-level information and user-level information. System-level information includes system-state information, operating system software, application software, and licenses. User-level information includes information other than system-level information."
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.keyvault_purge_protection_enabled,
    control.keyvault_soft_delete_enabled
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}
