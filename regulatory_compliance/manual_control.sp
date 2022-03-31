locals {
  regulatory_compliance_manual_control_common_tags = {
    service = "ad_manual_control"
  }
}

control "manual_control" {
  title       = "Manual verification."
  description = "Manual verification."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_manual_control_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    soc_2                = "true"
  })
}
