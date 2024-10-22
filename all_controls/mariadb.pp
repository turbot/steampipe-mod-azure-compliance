locals {
  all_controls_mariadb_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/MariaDB"
  })
}

benchmark "all_controls_mariadb" {
  title       = "MariaDB"
  description = "This section contains recommendations for configuring MariaDB resources."
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mariadb_server_ssl_enabled
  ]

  tags = merge(local.all_controls_mariadb_common_tags, {
    type = "Benchmark"
  })
}
