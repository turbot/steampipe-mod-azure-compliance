locals {
  other_keyvault_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/KeyVault"
  })
}

benchmark "other_keyvault" {
  title = "Key Vault"
  children = [
    control.keyvault_vault_public_network_access_disabled
  ]

  tags = merge(local.other_keyvault_common_tags, {
    type = "Benchmark"
  })
}
