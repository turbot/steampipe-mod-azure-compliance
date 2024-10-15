locals {
  cis_v140_8_common_tags = merge(local.cis_v140_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v140_8" {
  title         = "8 Other Security Considerations"
  documentation = file("./cis_v140/docs/cis_v140_8.md")
  children = [
    control.cis_v140_8_1,
    control.cis_v140_8_2,
    control.cis_v140_8_3,
    control.cis_v140_8_4,
    control.cis_v140_8_5,
    control.cis_v140_8_6,
    control.cis_v140_8_7
  ]

  tags = merge(local.cis_v140_8_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v140_8_1" {
  title         = "8.1 Ensure that the Expiration Date is set for all Keys in RBAC Key Vaults"
  description   = "Ensure that all Keys in Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  query         = query.keyvault_with_rbac_key_expiration_set
  documentation = file("./cis_v140/docs/cis_v140_8_1.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_8_2" {
  title         = "8.2 Ensure that the Expiration Date is set for all Keys in Non-RBAC Key Vaults"
  description   = "Ensure that all Keys in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  query         = query.keyvault_with_non_rbac_key_expiration_set
  documentation = file("./cis_v140/docs/cis_v140_8_2.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_8_3" {
  title         = "8.3 Ensure that the Expiration Date is set for all Secrets in RBAC Key Vaults"
  description   = "Ensure that all Secrets in Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set"
  query         = query.keyvault_with_rbac_secret_expiration_set
  documentation = file("./cis_v140/docs/cis_v140_8_3.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_8_4" {
  title         = "8.4 Ensure that the Expiration Date is set for all Secrets in Non-RBAC Key Vaults"
  description   = "Ensure that all Secrets in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration time set."
  query         = query.keyvault_with_non_rbac_secret_expiration_set
  documentation = file("./cis_v140/docs/cis_v140_8_4.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_8_5" {
  title         = "8.5 Ensure that Resource Locks are set for mission critical Azure resources"
  description   = "Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion of, or modifications to, a resource. These locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when applied, will place restrictions on the resource for all users. These locks are very useful when there is an important resource in a subscription that users should not be able to delete or change. Locks can help prevent accidental and malicious changes or deletion."
  query         = query.manual_control
  documentation = file("./cis_v140/docs/cis_v140_8_5.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "2"
    cis_type    = "Manual"
    service     = "Azure/ResourceManager"
  })
}

control "cis_v140_8_6" {
  title         = "8.6 Ensure the key vault is recoverable"
  description   = "The key vault contains object keys, secrets and certificates. Accidental unavailability of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects. It is recommended the key vault be made recoverable by enabling the \"Do Not Purge\" and \"Soft Delete\" functions."
  query         = query.keyvault_vault_recoverable
  documentation = file("./cis_v140/docs/cis_v140_8_6.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_8_7" {
  title         = "8.7 Enable role-based access control (RBAC) within Azure Kubernetes Services"
  description   = "Ensure that RBAC is enabled on all Azure Kubernetes Services Instances."
  query         = query.keyvault_vault_recoverable
  documentation = file("./cis_v140/docs/cis_v140_8_5.md")

  tags = merge(local.cis_v140_8_common_tags, {
    cis_item_id = "8.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}
