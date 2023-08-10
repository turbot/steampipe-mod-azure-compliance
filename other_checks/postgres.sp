locals {
  other_postgres_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/PostgreSQL"
  })
}

benchmark "other_postgres" {
  title = "PostgreSQL"
  children = [
    control.postgres_db_server_latest_tls_version
  ]

  tags = merge(local.other_postgres_common_tags, {
    type = "Benchmark"
  })
}
