locals {
  regulatory_compliance_automation_common_tags = {
    service = "Azure/Automation"
  }
}

control "automation_account_variable_encryption_enabled" {
  title       = "Automation account variables should be encrypted"
  description = "It is important to enable encryption of Automation account variable assets when storing sensitive data"
  query       = query.automation_account_variable_encryption_enabled

  tags = merge(local.regulatory_compliance_automation_common_tags, {
    pci_dss_v321 = "true"
  })
}
