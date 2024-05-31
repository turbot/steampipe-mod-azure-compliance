locals {
  all_controls_recoveryservice_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/RecoveryService"
  })
}

benchmark "all_controls_recoveryservice" {
  title       = "Recovery Service"
  description = "This section contains recommendations for configuring Recovery Service resources."
  children = [
    control.recovery_service_vault_uses_managed_identity,
    control.recovery_service_vault_uses_private_link,
    control.recovery_service_vault_uses_private_link_for_backup
  ]

  tags = merge(local.all_controls_recoveryservice_common_tags, {
    type = "Benchmark"
  })
}
