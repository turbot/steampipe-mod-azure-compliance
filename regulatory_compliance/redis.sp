locals {
  regulatory_compliance_redis_common_tags = {
    service = "Azure/Redis"
  }
}

control "azure_redis_cache_ssl_enabled" {
  title       = "Only secure connections to your Azure Cache for Redis should be enabled"
  description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  query       = query.azure_redis_cache_ssl_enabled

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "azure_redis_cache_uses_private_link" {
  title       = "Azure Cache for Redis should use private link"
  description = "Private endpoints lets you connect your virtual network to Azure services without a public IP address at the source or destination. By mapping private endpoints to your Azure Cache for Redis instances, data leakage risks are reduced."
  query       = query.azure_redis_cache_uses_private_link

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "azure_redis_cache_in_virtual_network" {
  title       = "Azure Cache for Redis should reside within a virtual network"
  description = "Azure Virtual Network deployment provides enhanced security and isolation for your Azure Cache for Redis, as well as subnets, access control policies, and other features to further restrict access.When an Azure Cache for Redis instance is configured with a virtual network, it is not publicly addressable and can only be accessed from virtual machines and applications within the virtual network."
  query       = query.azure_redis_cache_in_virtual_network

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "redis_cache_no_basic_sku" {
  title       = "Azure Cache for Redis should use standard SKUs as a minimum"
  description = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft. Typically, these SKU’s do not have a service SLA and Microsoft will usually refuse to provide support for them. Consequently Basic/Free SKUs should never be used for production workloads."
  query       = query.redis_cache_no_basic_sku

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    cis = "true"
  })
}