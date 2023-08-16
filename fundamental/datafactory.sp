locals {
  fundamental_security_datafactory_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/DataFactory"
  })
}

benchmark "fundamental_security_datafactory" {
  title       = "Data Factory"
  description = "This section contains recommendations for configuring DataFactory resources."
  children = [
    control.data_factory_encrypted_with_cmk,
    control.data_factory_public_network_access_disabled,
    control.data_factory_uses_git_repository,
    control.data_factory_uses_private_link
  ]

  tags = merge(local.fundamental_security_datafactory_common_tags, {
    type = "Benchmark"
  })
}
