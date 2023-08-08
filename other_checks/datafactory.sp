locals {
  other_datafactory_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/DataFactory"
  })
}

benchmark "other_datafactory" {
  title = "DataFactory"
  children = [
    control.data_factory_public_network_access_disabled,
    control.data_factory_uses_git_repository
  ]

  tags = merge(local.other_datafactory_common_tags, {
    type = "Benchmark"
  })
}
