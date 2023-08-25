locals {
  controls_by_service_kusto_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/DataExplorer"
  })
}

benchmark "controls_by_service_kusto" {
  title       = "Data Explorer"
  description = "This section contains recommendations for configuring Data Explorer resources."
  children = [
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.kusto_cluster_sku_with_sla
  ]

  tags = merge(local.controls_by_service_kusto_common_tags, {
    type = "Benchmark"
  })
}
