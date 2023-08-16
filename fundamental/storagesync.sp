locals {
  fundamental_security_storagesync_common_tags = {
    service = "Azure/FileSync"
  }
}

benchmark "fundamental_security_storagesync" {
  title       = "FileSync"
  description = "This section contains recommendations for configuring FileSync resources."
  children = [
    control.storage_sync_private_link_used
  ]
}
