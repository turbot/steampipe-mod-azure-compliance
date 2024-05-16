locals {
  regulatory_compliance_subscription_common_tags = {
    service = "Azure/Subscription"
  }
}

control "authorize_access_to_security_functions_and_information" {
  title       = "Authorize access to security functions and information"
  description = "CMA_0022 - Authorize access to security functions and information."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_subscription_common_tags, {
    nist_sp_800_53_rev_5  = "true"
  })
}
