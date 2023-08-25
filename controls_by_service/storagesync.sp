locals {
  controls_by_service_storagesync_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/FileSync"
  })
}

benchmark "controls_by_service_storagesync" {
  title       = "File Sync"
  description = "This section contains recommendations for configuring FileSync resources."
  children = [
    control.storage_sync_private_link_used
  ]

  tags = merge(local.controls_by_service_storagesync_common_tags, {
    type = "Benchmark"
  })
}
