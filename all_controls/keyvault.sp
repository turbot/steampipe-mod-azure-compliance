locals {
  all_controls_keyvault_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/KeyVault"
  })
}

benchmark "all_controls_keyvault" {
  title       = "Key Vault"
  description = "This section contains recommendations for configuring Key Vault resources."
  children = [
    control.keyvault_key_expiration_set,
    control.keyvault_logging_enabled,
    control.keyvault_managed_hms_logging_enabled,
    control.keyvault_managed_hms_purge_protection_enabled,
    control.keyvault_purge_protection_enabled,
    control.keyvault_rbac_enabled,
    control.keyvault_secret_expiration_set,
    control.keyvault_soft_delete_enabled,
    control.keyvault_vault_private_link_used,
    control.keyvault_vault_public_network_access_disabled,
    control.keyvault_vault_recoverable,
    control.keyvault_vault_use_virtual_service_endpoint,
    control.keyvault_with_non_rbac_key_expiration_set,
    control.keyvault_with_non_rbac_secret_expiration_set,
    control.keyvault_with_rbac_key_expiration_set,
    control.keyvault_with_rbac_secret_expiration_set
  ]

  tags = merge(local.all_controls_keyvault_common_tags, {
    type = "Benchmark"
  })
}
