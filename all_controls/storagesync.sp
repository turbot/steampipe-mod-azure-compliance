locals {
  all_controls_storagesync_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/FileSync"
  })
}

benchmark "all_controls_storagesync" {
  title       = "File Sync"
  description = "This section contains recommendations for configuring FileSync resources."
  children = [
    control.storage_sync_private_link_used
  ]

  tags = merge(local.all_controls_storagesync_common_tags, {
    type = "Benchmark"
  })
}
