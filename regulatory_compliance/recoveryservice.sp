locals {
  regulatory_compliance_recovery_service_common_tags = {
    service = "Azure/RecoveryService"
  }
}

control "recovery_service_vault_encrypted_with_cmk" {
  title       = "Azure Recovery Services vaults should use customer-managed keys for encrypting backup data"
  description = "Use customer-managed keys to manage the encryption at rest of your backup data. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/AB-CmkEncryption."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_recovery_service_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
