locals {
  controls_by_service_appconfiguration_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/AppConfiguration"
  })
}

benchmark "controls_by_service_appconfiguration" {
  title       = "App Configuration"
  description = "This section contains recommendations for configuring App Configuration resources."
  children = [
    control.app_configuration_encryption_enabled,
    control.app_configuration_private_link_used,
    control.app_configuration_sku_standard
  ]

  tags = merge(local.controls_by_service_appconfiguration_common_tags, {
    type = "Benchmark"
  })
}
