locals {
  fundamental_security_frontdoor_common_tags = {
    service = "Azure/FrontDoor"
  }
}

benchmark "fundamental_security_frontdoor" {
  title       = "FrontDoor"
  description = "This section contains recommendations for configuring FrontDoor resources."
  children = [
    control.frontdoor_waf_enabled
  ]
}
