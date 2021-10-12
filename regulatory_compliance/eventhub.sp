locals {
  regulatory_compliance_eventhub_common_tags = {
    service = "eventhub"
  }
}

control "eventhub_namespace_logging_enabled" {
  title       = "Resource logs in Event Hub should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.eventhub_namespace_logging_enabled.sql

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventhub_namespace_use_virtual_service_endpoint" {
  title       = "Event Hub should use a virtual network service endpoint"
  description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
  sql         = query.eventhub_namespace_use_virtual_service_endpoint.sql

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "eventhub_namespace_private_link_used" {
  title       = "Event Hub namespaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Event Hub namespaces, data leakage risks are reduced."
  sql         = query.eventhub_namespace_private_link_used.sql

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

