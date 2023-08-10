locals {
  other_mariadb_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/MariaDB"
  })
}

benchmark "other_mariadb" {
  title = "MariaDB"
  children = [
    control.mariadb_server_ssl_enabled
  ]

  tags = merge(local.other_mariadb_common_tags, {
    type = "Benchmark"
  })
}
