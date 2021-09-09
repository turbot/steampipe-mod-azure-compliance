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

control "container_registry_azure_defender_enabled" {
  title       = "Azure Defender for container registries should be enabled"
  description = "Azure Defender for container registries provides vulnerability scanning of any images pulled within the last 30 days, pushed to your registry, or imported, and exposes detailed findings per image."
  sql         = query.container_registry_azure_defender_enabled.sql.sql

  tags = merge(local.conformance_pack_containerregistry_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
