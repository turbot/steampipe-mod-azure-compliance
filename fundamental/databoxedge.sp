locals {
  fundamental_security_databoxedge_common_tags = {
    service = "Azure/DataBox"
  }
}

benchmark "fundamental_security_databoxedge" {
  title       = "DataBox"
  description = "This section contains recommendations for configuring DataBox resources."
  children = [
    control.databox_edge_device_double_encryption_enabled
  ]
}
