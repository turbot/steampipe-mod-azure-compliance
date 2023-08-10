locals {
  other_signalr_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/SignalRService"
  })
}

benchmark "other_signalr" {
  title = "SignalR Service"
  children = [
    control.signalr_service_no_free_tier_sku
  ]

  tags = merge(local.other_signalr_common_tags, {
    type = "Benchmark"
  })
}
