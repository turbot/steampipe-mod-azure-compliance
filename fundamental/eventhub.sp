locals {
  fundamental_security_eventhub_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/EventHub"
  })
}

benchmark "fundamental_security_eventhub" {
  title       = "Event Hub"
  description = "This section contains recommendations for configuring Event Hub resources."
  children = [
    control.eventhub_namespace_cmk_encryption_enabled,
    control.eventhub_namespace_logging_enabled,
    control.eventhub_namespace_private_link_used,
    control.eventhub_namespace_use_virtual_service_endpoint
  ]

  tags = merge(local.fundamental_security_eventhub_common_tags, {
    type = "Benchmark"
  })
}
