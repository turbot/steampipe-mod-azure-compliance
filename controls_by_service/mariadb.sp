locals {
  fundamental_security_mariadb_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/MariaDB"
  })
}

benchmark "fundamental_security_mariadb" {
  title       = "MariaDB"
  description = "This section contains recommendations for configuring MariaDB resources."
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mariadb_server_private_link_used,
    control.mariadb_server_public_network_access_disabled,
    control.mariadb_server_ssl_enabled
  ]

  tags = merge(local.fundamental_security_mariadb_common_tags, {
    type = "Benchmark"
  })
}
