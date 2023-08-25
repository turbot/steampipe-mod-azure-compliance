locals {
  controls_by_service_databoxedge_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/DataBox"
  })
}

benchmark "controls_by_service_databoxedge" {
  title       = "Data Box"
  description = "This section contains recommendations for configuring Data Box resources."
  children = [
    control.databox_edge_device_double_encryption_enabled
  ]

  tags = merge(local.controls_by_service_databoxedge_common_tags, {
    type = "Benchmark"
  })
}
