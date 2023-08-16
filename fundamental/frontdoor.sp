locals {
  fundamental_security_frontdoor_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/FrontDoor"
  })
}

benchmark "fundamental_security_frontdoor" {
  title       = "Front Door"
  description = "This section contains recommendations for configuring FrontDoor resources."
  children = [
    control.frontdoor_waf_enabled
  ]

  tags = merge(local.fundamental_security_frontdoor_common_tags, {
    type = "Benchmark"
  })
}
