locals {
  controls_by_service_mysql_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/MySQL"
  })
}

benchmark "controls_by_service_mysql" {
  title       = "MySQL"
  description = "This section contains recommendations for configuring MySQL resources."
  children = [
    control.mssql_managed_instance_encryption_at_rest_using_cmk,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.mysql_server_audit_logging_enabled,
    control.mysql_server_audit_logging_events_connection_set,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.mysql_server_infrastructure_encryption_enabled,
    control.mysql_server_min_tls_1_2,
    control.mysql_server_private_link_used,
    control.mysql_server_public_network_access_disabled,
    control.mysql_ssl_enabled
  ]

  tags = merge(local.controls_by_service_mysql_common_tags, {
    type = "Benchmark"
  })
}