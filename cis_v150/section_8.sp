locals {
  cis_v150_8_common_tags = merge(local.cis_v150_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v150_8" {
  title         = "8 Other Security Considerations"
  documentation = file("./cis_v150/docs/cis_v150_8.md")
  children = [
    control.cis_v150_8_1,
    control.cis_v150_8_2,
    control.cis_v150_8_3,
    control.cis_v150_8_4,
    control.cis_v150_8_5,
    control.cis_v150_8_6,
    control.cis_v150_8_7,
    control.cis_v150_8_8
  ]

  tags = merge(local.cis_v150_8_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v150_8_1" {
  title         = "8.1 Ensure that the Expiration Date is set for all Keys in RBAC Key Vaults"
  description   = "Ensure that all Keys in Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  sql           = query.keyvault_with_rbac_key_expiration_set.sql
  documentation = file("./cis_v150/docs/cis_v150_8_1.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_2" {
  title       = "8.2 Ensure that the Expiration Date is set for all Keys in Non-RBAC Key Vaults"
  description = "Ensure that all Keys in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  sql           = query.keyvault_with_non_rbac_key_expiration_set.sql
  documentation = file("./cis_v150/docs/cis_v150_8_2.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_3" {
  title         = "8.3 Ensure that the Expiration Date is set for all Secrets in RBAC Key Vaults"
  description   = "Ensure that all Secrets in Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  sql           = query.keyvault_with_rbac_secret_expiration_set.sql
  documentation = file("./cis_v150/docs/cis_v150_8_3.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_4" {
  title       = "8.4 Ensure that the Expiration Date is set for all Secrets in Non-RBAC Key Vaults"
  description = "Ensure that all Secrets in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  sql           = query.keyvault_with_non_rbac_secret_expiration_set.sql
  documentation = file("./cis_v150/docs/cis_v150_8_4.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_5" {
  title         = "8.5 Ensure the key vault is recoverable"
  description   = "The key vault contains object keys, secrets and certificates. Accidental unavailability of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects. It is recommended the key vault be made recoverable by enabling the \"Do Not Purge\" and \"Soft Delete\" functions."
  sql           = query.keyvault_vault_recoverable.sql
  documentation = file("./cis_v150/docs/cis_v150_8_5.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_6" {
  title         = "8.6 Enable Role Based Access Control for Azure Key Vault"
  description   = "Role assignments disappear when a Key Vault has been deleted (soft- delete) and recovered. Afterwards it will be required to recreate all role assignments. This is a limitation of the soft-delete feature across all Azure services."
  sql           = query.keyvault_rbac_enabled.sql
  documentation = file("./cis_v150/docs/cis_v150_8_6.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_7" {
  title         = "8.7 Ensure that Private Endpoints are Used for Azure Key Vault"
  description   = "Private endpoints will secure network traffic from Azure Key Vault to the resources requesting secrets and keys."
  sql           = query.keyvault_vault_private_link_used.sql
  documentation = file("./cis_v150/docs/cis_v150_8_7.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

control "cis_v150_8_8" {
  title         = "8.8 Ensure Automatic Key Rotation is Enabled Within Azure Key Vault for the Supported Services"
  description   = "Automatic Key Rotation is available in Public Preview. The currently supported applications are Key Vault, Managed Disks, and Storage accounts accessing keys within Key Vault. The number of supported applications will incrementally increased."
  sql           = query.manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_8_8.md")

  tags = merge(local.cis_v150_8_common_tags, {
    cis_item_id = "8.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}