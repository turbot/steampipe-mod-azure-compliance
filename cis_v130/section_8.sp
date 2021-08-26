locals {
  cis_v130_8_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "8"
  })
}

benchmark "cis_v130_8" {
  title         = "8 Other Security Considerations"
  documentation = file("./cis_v130/docs/cis_v130_8.md")
  tags          = local.cis_v130_8_common_tags
  children = [
    control.cis_v130_8_1,
    control.cis_v130_8_2,
    control.cis_v130_8_3,
    control.cis_v130_8_4,
    control.cis_v130_8_5
  ]
}

control "cis_v130_8_1" {
  title         = "8.1 Ensure that the expiration date is set on all keys"
  description   = "Ensure that all keys in Azure Key Vault have an expiration time set."
  sql           = query.keyvault_key_expiration_set.sql
  documentation = file("./cis_v130/docs/cis_v130_8_1.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.1"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_8_2" {
  title         = "8.2 Ensure that the expiration date is set on all Secrets"
  description   = "Ensure that all Secrets in the Azure Key Vault have an expiration time set."
  sql           = query.keyvault_secret_expiration_set.sql
  documentation = file("./cis_v130/docs/cis_v130_8_2.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_8_3" {
  title         = "8.3 Ensure that Resource Locks are set for mission critical Azure resources"
  description   = "Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion of, or modifications to, a resource. These locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when applied, will place restrictions on the resource for all users. These locks are very useful when there is an important resource in a subscription that users should not be able to delete or change. Locks can help prevent accidental and malicious changes or deletion."
  sql           = query.manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_8_3.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.3"
    cis_level   = "2"
    cis_type    = "Manual"
  })
}

control "cis_v130_8_4" {
  title         = "8.4 Ensure the key vault is recoverable"
  description   = "The key vault contains object keys, secrets and certificates. Accidental unavailability of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects. It is recommended the key vault be made recoverable by enabling the \"Do Not Purge\" and \"Soft Delete\" functions."
  sql           = query.keyvault_vault_recoverable.sql
  documentation = file("./cis_v130/docs/cis_v130_8_4.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.4"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_8_5" {
  title         = "8.5 Enable role-based access control (RBAC) within Azure Kubernetes Services"
  description   = "Ensure that RBAC is enabled on all Azure Kubernetes Services Instances."
  sql           = query.keyvault_vault_recoverable.sql
  documentation = file("./cis_v130/docs/cis_v130_8_5.md")

  tags = merge(local.cis_v130_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "1"
    cis_type    = "automated"
  })
}
