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
    nist_sp_800_171_rev_2 = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "automation_account_encrypted_with_cmk" {
  title       = "Azure Automation accounts should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure Automation Accounts. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/automation-cmk."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_automation_common_tags, {
    nist_sp_800_53_rev_5 = "true"
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
