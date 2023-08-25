locals {
  controls_by_service_frontdoor_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/FrontDoor"
  })
}

benchmark "controls_by_service_frontdoor" {
  title       = "Front Door"
  description = "This section contains recommendations for configuring Front Door resources."
  children = [
    control.frontdoor_waf_enabled
  ]

  tags = merge(local.controls_by_service_frontdoor_common_tags, {
    type = "Benchmark"
  })
}
