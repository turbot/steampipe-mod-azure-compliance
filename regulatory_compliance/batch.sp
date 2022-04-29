locals {
  regulatory_compliance_batch_common_tags = {
    service = "Azure/Batch"
  }
}

control "batch_account_logging_enabled" {
  title       = "Resource logs in Batch accounts should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.batch_account_logging_enabled.sql

  tags = merge(local.regulatory_compliance_batch_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "batch_account_encrypted_with_cmk" {
  title       = "Azure Batch account should use customer-managed keys to encrypt data"
  description = "Use customer-managed keys to manage the encryption at rest of your Batch account's data. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.batch_account_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_batch_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}


