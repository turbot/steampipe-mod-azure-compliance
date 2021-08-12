locals {
  conformance_pack_containerregistry_common_tags = {
    service = "containerregistry"
  }
}

control "container_registry_use_virtual_service_endpoint" {
  title       = "Container Registry should use a virtual network service endpoint"
  description = "This policy audits any Container Registry not configured to use a virtual network service endpoint."
  sql         = query.container_registry_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_containerregistry_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}
