locals {
  all_controls_eventhub_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/EventHub"
  })
}

benchmark "all_controls_eventhub" {
  title       = "Event Hub"
  description = "This section contains recommendations for configuring Event Hub resources."
  children = [
    control.eventhub_namespace_cmk_encryption_enabled,
    control.eventhub_namespace_logging_enabled,
    control.eventhub_namespace_private_link_used,
    control.eventhub_namespace_use_virtual_service_endpoint
  ]

  tags = merge(local.all_controls_eventhub_common_tags, {
    type = "Benchmark"
  })
}
