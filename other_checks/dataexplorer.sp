locals {
  other_dataexplorer_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/DataExplorer"
  })
}

benchmark "other_dataexplorer" {
  title = "Data Explorer"
  children = [
    control.kusto_cluster_sku_with_sla
  ]

  tags = merge(local.other_dataexplorer_common_tags, {
    type = "Benchmark"
  })
}
