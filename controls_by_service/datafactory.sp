locals {
  controls_by_service_datafactory_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/DataFactory"
  })
}

benchmark "controls_by_service_datafactory" {
  title       = "Data Factory"
  description = "This section contains recommendations for configuring Data Factory resources."
  children = [
    control.data_factory_encrypted_with_cmk,
    control.data_factory_public_network_access_disabled,
    control.data_factory_uses_git_repository,
    control.data_factory_uses_private_link
  ]

  tags = merge(local.controls_by_service_datafactory_common_tags, {
    type = "Benchmark"
  })
}
