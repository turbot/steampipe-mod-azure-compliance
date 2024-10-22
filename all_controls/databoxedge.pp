locals {
  all_controls_databoxedge_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/DataBox"
  })
}

benchmark "all_controls_databoxedge" {
  title       = "Data Box"
  description = "This section contains recommendations for configuring Data Box resources."
  children = [
    control.databox_edge_device_double_encryption_enabled
  ]

  tags = merge(local.all_controls_databoxedge_common_tags, {
    type = "Benchmark"
  })
}
