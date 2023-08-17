locals {
  fundamental_security_databoxedge_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/DataBox"
  })
}

benchmark "fundamental_security_databoxedge" {
  title       = "Data Box"
  description = "This section contains recommendations for configuring Data Box resources."
  children = [
    control.databox_edge_device_double_encryption_enabled
  ]
}
