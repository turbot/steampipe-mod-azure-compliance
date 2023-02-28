locals {
  regulatory_compliance_hpc_cache_common_tags = {
    service = "Azure/HPCCache"
  }
}

control "hpc_cache_encrypted_with_cmk" {
  title       = "HPC Cache accounts should use customer-managed key for encryption"
  description = "Manage encryption at rest of Azure HPC Cache with customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.hpc_cache_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_hpc_cache_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

