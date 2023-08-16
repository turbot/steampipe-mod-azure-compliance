locals {
  fundamental_security_kusto_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/DataExplorer"
  })
}

benchmark "fundamental_security_kusto" {
  title       = "DataExplorer"
  description = "This section contains recommendations for configuring DataExplorer resources."
  children = [
    control.kusto_cluster_disk_encryption_enabled,
    control.kusto_cluster_double_encryption_enabled,
    control.kusto_cluster_encrypted_at_rest_with_cmk,
    control.kusto_cluster_sku_with_sla
  ]

  tags = merge(local.fundamental_security_kusto_common_tags, {
    type = "Benchmark"
  })
}
