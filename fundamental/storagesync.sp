locals {
  fundamental_security_storagesync_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/FileSync"
  })
}

benchmark "fundamental_security_storagesync" {
  title       = "File Sync"
  description = "This section contains recommendations for configuring FileSync resources."
  children = [
    control.storage_sync_private_link_used
  ]

  tags = merge(local.fundamental_security_storagesync_common_tags, {
    type = "Benchmark"
  })
}
