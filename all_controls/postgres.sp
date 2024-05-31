locals {
  all_controls_postgres_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "all_controls_postgres" {
  title       = "PostgreSQL"
  description = "This section contains recommendations for configuring PostgreSQL resources."
  children = [
    control.postgres_db_server_allow_access_to_azure_services_disabled,
    control.postgres_db_server_connection_throttling_on,
    control.postgres_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_latest_tls_version,
    control.postgres_db_server_log_checkpoints_on,
    control.postgres_db_server_log_connections_on,
    control.postgres_db_server_log_disconnections_on,
    control.postgres_db_server_log_duration_on,
    control.postgres_db_server_log_retention_days_3,
    control.postgres_server_private_link_used,
    control.postgres_sql_server_encrypted_at_rest_using_cmk,
    control.postgres_sql_ssl_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.postgresql_server_public_network_access_disabled
  ]

  tags = merge(local.all_controls_postgres_common_tags, {
    type = "Benchmark"
  })
}
