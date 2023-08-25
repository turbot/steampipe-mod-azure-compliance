locals {
  controls_by_service_signalr_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/SignalRService"
  })
}

benchmark "controls_by_service_signalr" {
  title       = "SignalR Service"
  description = "This section contains recommendations for configuring SignalR Service resources."
  children = [
    control.signalr_service_no_free_tier_sku,
    control.signalr_service_private_link_used
  ]

  tags = merge(local.controls_by_service_signalr_common_tags, {
    type = "Benchmark"
  })
}
