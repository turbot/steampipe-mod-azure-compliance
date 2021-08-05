locals {
  conformance_pack_eventhub_common_tags = {
    service = "eventhub"
  }
}

control "eventhub_namespace_logging_enabled" {
  title         = "Resource logs in Event Hub should be enabled"
  description   = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql           = query.eventhub_namespace_logging_enabled.sql

  tags = merge(local.conformance_pack_eventhub_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "eventhub_namespace_use_virtual_service_endpoint" {
  title         = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
  sql           = query.eventhub_namespace_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_eventhub_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}