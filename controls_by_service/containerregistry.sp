locals {
  controls_by_service_containerregistry_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/ContainerRegistry"
  })
}

benchmark "controls_by_service_containerregistry" {
  title       = "Container Registry"
  description = "This section contains recommendations for configuring Container Registry resources."
  children = [
    control.container_registry_admin_user_disabled,
    control.container_registry_encrypted_with_cmk,
    control.container_registry_geo_replication_enabled,
    control.container_registry_public_network_access_disabled,
    control.container_registry_quarantine_policy_enabled,
    control.container_registry_restrict_public_access,
    control.container_registry_retention_policy_enabled,
    control.container_registry_trust_policy_enabled,
    control.container_registry_use_virtual_service_endpoint,
    control.container_registry_uses_private_link
  ]

  tags = merge(local.controls_by_service_containerregistry_common_tags, {
    type = "Benchmark"
  })
}
