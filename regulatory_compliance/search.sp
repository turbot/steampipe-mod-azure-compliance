locals {
  regulatory_compliance_search_common_tags = {
    service = "Azure/Cognitive Search"
  }
}

control "search_service_logging_enabled" {
  title       = "Resource logs in Search services should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.search_service_logging_enabled.sql

  tags = merge(local.regulatory_compliance_search_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_uses_sku_supporting_private_link" {
  title       = "Azure Cognitive Search service should use a SKU that supports private link"
  description = "With supported SKUs of Azure Cognitive Search, Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Search service, data leakage risks are reduced."
  sql         = query.search_service_uses_sku_supporting_private_link.sql

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_public_network_access_disabled" {
  title       = "Azure Cognitive Search services should disable public network access"
  description = "Disabling public network access improves security by ensuring that your Azure Cognitive Search service is not exposed on the public internet. Creating private endpoints can limit exposure of your Search service."
  sql         = query.search_service_public_network_access_disabled.sql

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_uses_private_link" {
  title       = "Azure Cognitive Search services should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Cognitive Search, data leakage risks are reduced."
  sql         = query.search_service_uses_private_link.sql

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
