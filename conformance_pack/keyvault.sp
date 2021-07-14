locals {
  conformance_pack_keyvault_common_tags = {
    service = "keyvault"
  }
}

control "keyvault_purge_protection_enabled" {
  title       = "Key vaults should have purge protection enabled"
  description = "Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
  sql         = query.keyvault_purge_protection_enabled.sql

  tags = merge(local.conformance_pack_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_logging_enabled" {
  title       = "Resource logs in Key Vault should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised."
  sql         = query.keyvault_logging_enabled.sql

  tags = merge(local.conformance_pack_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}