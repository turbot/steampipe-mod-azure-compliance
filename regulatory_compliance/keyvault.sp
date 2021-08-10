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

control "keyvault_vault_use_virtual_service_endpoint" {
  title       = "Key Vault should use a virtual network service endpoint"
  description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
  sql         = query.keyvault_vault_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_purge_protection_enabled" {
  title       = "Azure Key Vault Managed HSM should have purge protection enabled"
  description = "Malicious deletion of an Azure Key Vault Managed HSM can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge Azure Key Vault Managed HSM. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted Azure Key Vault Managed HSM. No one inside your organization or Microsoft will be able to purge your Azure Key Vault Managed HSM during the soft delete retention period."
  sql         = query.keyvault_managed_hms_purge_protection_enabled.sql

  tags = merge(local.conformance_pack_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_logging_enabled" {
  title       = "Resource logs in Azure Key Vault Managed HSM should be enabled"
  description = "To recreate activity trails for investigation purposes when a security incident occurs or when your network is compromised, you may want to audit by enabling resource logs on Managed HSMs."
  sql         = query.keyvault_managed_hms_logging_enabled.sql

  tags = merge(local.conformance_pack_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}