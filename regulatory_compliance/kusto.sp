locals {
  regulatory_compliance_kusto_common_tags = {
    service = "Azure/DataExplorer"
  }
}

control "kusto_cluster_encrypted_at_rest_with_cmk" {
  title       = "Azure Data Explorer encryption at rest should use a customer-managed key"
  description = "Enabling encryption at rest using a customer-managed key on your Azure Data Explorer cluster provides additional control over the key being used by the encryption at rest. This feature is oftentimes applicable to customers with special compliance requirements and requires a Key Vault to managing the keys."
  sql         = query.kusto_cluster_encrypted_at_rest_with_cmk.sql

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kusto_cluster_disk_encryption_enabled" {
  title       = "Disk encryption should be enabled on Azure Data Explorer"
  description = "Enabling disk encryption helps protect and safeguard your data to meet your organizational security and compliance commitments."
  sql         = query.kusto_cluster_disk_encryption_enabled.sql

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kusto_cluster_double_encryption_enabled" {
  title       = "Double encryption should be enabled on Azure Data Explorer"
  description = "Enabling double encryption helps protect and safeguard your data to meet your organizational security and compliance commitments. When double encryption has been enabled, data in the storage account is encrypted twice, once at the service level and once at the infrastructure level, using two different encryption algorithms and two different keys."
  sql         = query.kusto_cluster_double_encryption_enabled.sql

  tags = merge(local.regulatory_compliance_kusto_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}



