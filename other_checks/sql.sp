locals {
  other_sql_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/SQL"
  })
}

benchmark "other_sql" {
  title = "SQL"
  children = [
    control.sql_server_threat_detection_all_enabled
  ]

  tags = merge(local.other_sql_common_tags, {
    type = "Benchmark"
  })
}
