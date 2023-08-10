locals {
  other_containerregistry_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "other_containerregistry" {
  title = "Container Registry"
  children = [
    control.container_registry_admin_user_disabled,
    control.container_registry_geo_replication_enabled,
    control.container_registry_public_network_access_disabled,
    control.container_registry_quarantine_policy_enabled,
    control.container_registry_retention_policy_enabled,
    control.container_registry_trust_policy_enabled
  ]

  tags = merge(local.other_containerregistry_common_tags, {
    type = "Benchmark"
  })
}
