locals {
  regulatory_compliance_keyvault_common_tags = {
    service = "Azure/KeyVault"
  }
}

control "keyvault_purge_protection_enabled" {
  title       = "Key vaults should have purge protection enabled"
  description = "Malicious deletion of a key vault can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge key vaults. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period."
  sql         = query.keyvault_purge_protection_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_logging_enabled" {
  title       = "Resource logs in Key Vault should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised."
  sql         = query.keyvault_logging_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_vault_use_virtual_service_endpoint" {
  title       = "Key Vault should use a virtual network service endpoint"
  description = "This policy audits any Key Vault not configured to use a virtual network service endpoint."
  sql         = query.keyvault_vault_use_virtual_service_endpoint.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_purge_protection_enabled" {
  title       = "Azure Key Vault Managed HSM should have purge protection enabled"
  description = "Malicious deletion of an Azure Key Vault Managed HSM can lead to permanent data loss. A malicious insider in your organization can potentially delete and purge Azure Key Vault Managed HSM. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted Azure Key Vault Managed HSM. No one inside your organization or Microsoft will be able to purge your Azure Key Vault Managed HSM during the soft delete retention period."
  sql         = query.keyvault_managed_hms_purge_protection_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_managed_hms_logging_enabled" {
  title       = "Resource logs in Azure Key Vault Managed HSM should be enabled"
  description = "To recreate activity trails for investigation purposes when a security incident occurs or when your network is compromised, you may want to audit by enabling resource logs on Managed HSMs."
  sql         = query.keyvault_managed_hms_logging_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "keyvault_azure_defender_enabled" {
  title       = "Azure Defender for Key Vault should be enabled"
  description = "Azure Defender for Key Vault provides an additional layer of protection and security intelligence by detecting unusual and potentially harmful attempts to access or exploit key vault accounts."
  sql         = query.keyvault_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_vault_private_link_used" {
  title       = "Private endpoint should be configured for Key Vault"
  description = "Private link provides a way to connect Key Vault to your Azure resources without sending traffic over the public internet. Private link provides defense in depth protection against data exfiltration."
  sql         = query.keyvault_vault_private_link_used.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_vault_public_network_access_disabled" {
  title       = "Azure Key Vault should disable public network access"
  description = "Disable public network access for your key vault so that it's not accessible over the public internet. This can reduce data leakage risks."
  sql         = query.keyvault_vault_public_network_access_disabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_key_expiration_set" {
  title       = "Key Vault keys should have an expiration date"
  description = "Cryptographic keys should have a defined expiration date and not be permanent. Keys that are valid forever provide a potential attacker with more time to compromise the key. It is a recommended security practice to set expiration dates on cryptographic keys."
  sql         = query.keyvault_key_expiration_set.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_secret_expiration_set" {
  title       = "Key Vault secrets should have an expiration date"
  description = "Secrets should have a defined expiration date and not be permanent. Secrets that are valid forever provide a potential attacker with more time to compromise them. It is a recommended security practice to set expiration dates on secrets."
  sql         = query.keyvault_secret_expiration_set.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "keyvault_soft_delete_enabled" {
  title       = "Key vaults should have soft delete enabled"
  description = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period."
  sql         = query.keyvault_soft_delete_enabled.sql

  tags = merge(local.regulatory_compliance_keyvault_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
