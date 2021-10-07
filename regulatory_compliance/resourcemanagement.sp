locals {
  regulatory_compliance_resourcemanagement_common_tags = {
    service = "resourcemanagement"
  }
}

control "resource_manager_azure_defender_enabled" {
  title       = "Azure Defender for Resource Manager should be enabled"
  description = "Azure Defender for Resource Manager automatically monitors the resource management operations in your organization. Azure Defender detects threats and alerts you about suspicious activity."
  sql         = query.resource_manager_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_resourcemanagement_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
