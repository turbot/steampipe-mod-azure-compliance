locals {
  fundamental_security_servicefabric_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/ServiceFabric"
  })
}

benchmark "fundamental_security_servicefabric" {
  title       = "Service Fabric"
  description = "This section contains recommendations for configuring Service Fabric resources."
  children = [
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign
  ]

  tags = merge(local.fundamental_security_servicefabric_common_tags, {
    type = "Benchmark"
  })
}
