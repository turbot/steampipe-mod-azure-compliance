locals {
  fundamental_security_activedirectory_common_tags = {
    service = "Azure/ActiveDirectory"
  }
}

benchmark "fundamental_security_activedirectory" {
  title       = "ActiveDirectory"
  description = "This section contains recommendations for configuring ActiveDirectory resources."
  children = [
    control.ad_guest_user_reviewed_monthly
  ]
}
