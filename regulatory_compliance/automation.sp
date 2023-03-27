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

query "automation_account_variable_encryption_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when is_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when is_encrypted then a.title || ' encryption enabled.'
        else a.title || ' encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}      
    from
      azure_automation_variable as a,
      azure_subscription as sub;
  EOQ
}