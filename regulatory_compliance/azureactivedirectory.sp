locals {
  regulatory_compliance_azureactivedirectory_common_tags = {
    service = "azureactivedirectory"
  }
}

control "ad_guest_user_reviewed_monthly" {
  title       = "Ensure guest users are reviewed on a monthly basis."
  description = "Guest users are typically added outside your employee on-boarding/off-boarding process and could potentially be overlooked indefinitely leading to a potential vulnerability. Guest users should be review on a monthly basis to ensure that inactive and unneeded accounts are removed."
  sql         = query.ad_guest_user_reviewed_monthly.sql

  tags = merge(local.regulatory_compliance_azureactivedirectory_common_tags, {
    soc_2 = "true"
  })
}
