locals {
  controls_by_service_mariadb_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/MariaDB"
  })
}

benchmark "controls_by_service_mariadb" {
  title       = "MariaDB"
  description = "This section contains recommendations for configuring MariaDB resources."
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mariadb_server_ssl_enabled
  ]

  tags = merge(local.controls_by_service_mariadb_common_tags, {
    type = "Benchmark"
  })
}
