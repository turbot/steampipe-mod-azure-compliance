locals {
  all_controls_frontdoor_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/FrontDoor"
  })
}

benchmark "all_controls_frontdoor" {
  title       = "Front Door"
  description = "This section contains recommendations for configuring Front Door resources."
  children = [
    control.frontdoor_waf_enabled
  ]

  tags = merge(local.all_controls_frontdoor_common_tags, {
    type = "Benchmark"
  })
}
