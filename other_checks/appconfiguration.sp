locals {
  other_appconfiguration_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/AppConfiguration"
  })
}

benchmark "other_appconfiguration" {
  title = "AppConfiguration"
  children = [
    control.app_configuration_encryption_enabled,
    control.app_configuration_sku_standard
  ]

  tags = merge(local.other_appconfiguration_common_tags, {
    type = "Benchmark"
  })
}
