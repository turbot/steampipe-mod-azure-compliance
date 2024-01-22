locals {
  all_controls_recoveryservice_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/RecoveryService"
  })
}

benchmark "all_controls_recoveryservice" {
  title       = "Recovery Service"
  description = "This section contains recommendations for configuring Recovery Service resources."
  children = [
    control.recovery_service_vault_uses_managed_identity
  ]

  tags = merge(local.all_controls_recoveryservice_common_tags, {
    type = "Benchmark"
  })
}
