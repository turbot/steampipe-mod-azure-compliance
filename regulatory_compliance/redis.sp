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

control "redis_cache_in_virtual_network" {
  title       = "Azure Cache for Redis should reside within a virtual network"
  description = "Azure Virtual Network deployment provides enhanced security and isolation for your Azure Cache for Redis, as well as subnets, access control policies, and other features to further restrict access.When an Azure Cache for Redis instance is configured with a virtual network, it is not publicly addressable and can only be accessed from virtual machines and applications within the virtual network."
  query       = query.redis_cache_in_virtual_network

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    other_checks = "true"
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

control "redis_cache_min_tls_1_2" {
  title       = "Redis Caches 'Minimum TLS version' should be set 'Version 1.2'"
  description = "This control checks whether 'Minimum TLS version' is set to 1.2. TLS 1.0 is a legacy version and has known vulnerabilities. This minimum TLS version can be configured to be later protocols such as TLS 1.2."
  query       = query.redis_cache_min_tls_1_2

  tags = merge(local.regulatory_compliance_redis_common_tags, {
    other_checks = "true"
  })
}

query "azure_redis_cache_ssl_enabled" {
  sql = <<-EOQ
    select
      redis.id as resource,
      case
        when enable_non_ssl_port then 'alarm'
        else 'ok'
      end as status,
      case
        when enable_non_ssl_port then redis.name || ' secure connections disabled.'
        else redis.name || ' secure connections enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "redis.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_redis_cache as redis,
      azure_subscription as sub
    where
      sub.subscription_id = redis.subscription_id;
  EOQ
}

query "azure_redis_cache_uses_private_link" {
  sql = <<-EOQ
    with redis_private_connection as (
      select
        distinct a.id
      from
        azure_redis_cache as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      a.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_redis_cache as a
      left join redis_private_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "redis_cache_in_virtual_network" {
  sql = <<-EOQ
    select
      redis.id as resource,
      case
        when subnet_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when subnet_id is not null then redis.name || ' in virtual network.'
        else redis.name || ' not in virtual network.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "redis.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_redis_cache as redis,
      azure_subscription as sub
    where
      sub.subscription_id = redis.subscription_id;
  EOQ
}

query "redis_cache_no_basic_sku" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when c.sku_name = 'Basic' then 'alarm'
        else 'ok'
      end as status,
      case
        when c.sku_name = 'Basic' then c.title || ' using basic SKU.'
        else c.title || ' using ' || sku_name || ' SKU.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_redis_cache as c,
      azure_subscription as sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}

query "redis_cache_min_tls_1_2" {
  sql = <<-EOQ
    select
      c.id as resource,
      case
        when minimum_tls_version is null then 'alarm'
        when minimum_tls_version = '1.2' then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_tls_version is null then c.name || ' minimum TLS version not set.'
        when minimum_tls_version = '1.2' then c.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
        else c.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_redis_cache as c,
      azure_subscription sub
    where
      sub.subscription_id = c.subscription_id;
  EOQ
}