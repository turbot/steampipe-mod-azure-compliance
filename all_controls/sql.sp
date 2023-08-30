locals {
  all_controls_sql_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/SQL"
  })
}

benchmark "all_controls_sql" {
  title       = "SQL"
  description = "This section contains recommendations for configuring SQL resources."
  children = [
    control.sql_database_allow_internet_access,
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.sql_database_transparent_data_encryption_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_db_active_directory_admin_configured,
    control.sql_db_public_network_access_disabled,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_atp_enabled,
    control.sql_server_auditing_on,
    control.sql_server_auditing_retention_period_90,
    control.sql_server_auditing_storage_account_destination_retention_90_days,
    control.sql_server_azure_ad_authentication_enabled,
    control.sql_server_azure_defender_enabled,
    control.sql_server_tde_protector_cmk_encrypted,
    control.sql_server_threat_detection_all_enabled,
    control.sql_server_transparent_data_encryption_enabled,
    control.sql_server_use_virtual_service_endpoint,
    control.sql_server_uses_private_link,
    control.sql_server_va_setting_periodic_scan_enabled,
    control.sql_server_va_setting_reports_notify_admins,
    control.sql_server_va_setting_scan_reports_configured
  ]

  tags = merge(local.all_controls_sql_common_tags, {
    type = "Benchmark"
  })
}
