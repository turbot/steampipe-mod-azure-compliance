locals {
  regulatory_compliance_search_common_tags = {
    service = "Azure/CognitiveSearch"
  }
}

control "search_service_logging_enabled" {
  title       = "Resource logs in Search services should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.search_service_logging_enabled

  tags = merge(local.regulatory_compliance_search_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_uses_sku_supporting_private_link" {
  title       = "Azure Cognitive Search service should use a SKU that supports private link"
  description = "With supported SKUs of Azure Cognitive Search, Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your Search service, data leakage risks are reduced."
  query       = query.search_service_uses_sku_supporting_private_link

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_public_network_access_disabled" {
  title       = "Azure Cognitive Search services should disable public network access"
  description = "Disabling public network access improves security by ensuring that your Azure Cognitive Search service is not exposed on the public internet. Creating private endpoints can limit exposure of your Search service."
  query       = query.search_service_public_network_access_disabled

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_uses_private_link" {
  title       = "Azure Cognitive Search services should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Cognitive Search, data leakage risks are reduced."
  query       = query.search_service_uses_private_link

  tags = merge(local.regulatory_compliance_search_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "search_service_uses_managed_identity" {
  title       = "Cognitive Search services should use managed identity"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.search_service_uses_managed_identity

  tags = merge(local.regulatory_compliance_search_common_tags, {
    other_checks = "true"
  })
}

control "search_service_replica_count_3" {
  title       = "Cognitive Search services should maintain SLA for index updates"
  description = "This control checks if Cognitive Search maintains SLA for index updates."
  query       = query.search_service_replica_count_3

  tags = merge(local.regulatory_compliance_search_common_tags, {
    other_checks = "true"
  })
}

query "search_service_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as search_service_name
      from
        azure_search_service,
        jsonb_array_elements(diagnostic_settings) setting,
        jsonb_array_elements(setting -> 'properties' -> 'logs') log
      where
        diagnostic_settings is not null
        and (
          (
            (log ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy' ->> 'enabled') :: boolean
            and (log -> 'retentionPolicy') :: JSONB ? 'days'
          )
          or
          (
            (log ->> 'enabled') :: boolean
            and (
              log -> 'retentionPolicy' ->> 'enabled' <> 'true'
              or setting -> 'properties' ->> 'storageAccountId' = ''
            )
          )
        )
    )
    select
      v.id as resource,
      case
        when v.diagnostic_settings is null then 'alarm'
        when l.search_service_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.search_service_name is null then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as v
      left join logging_details as l on v.name = l.search_service_name,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "search_service_uses_sku_supporting_private_link" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when sku_name = 'free' then 'alarm'
        else 'ok'
      end as status,
      case
        when sku_name = 'free' then s.title || ' SKU does not supports private link.'
        else s.title || ' SKU supports private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "search_service_public_network_access_disabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access = 'Enabled' then name || ' public network access enabled.'
        else name || ' public network access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "search_service_uses_private_link" {
  sql = <<-EOQ
    with search_service_connection as (
      select
        distinct a.id
      from
        azure_search_service as a,
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
        when c.id is null then a.title || ' not uses private link.'
        else a.title || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as a
      left join search_service_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "search_service_uses_managed_identity" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when identity ->> 'type' = 'SystemAssigned' then 'ok'
        else 'alarm'
      end as status,
      case
        when identity ->> 'type' = 'SystemAssigned' then name || ' uses managed identity.'
        else name || ' not uses managed identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "search_service_replica_count_3" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when replica_count > 3 then 'ok'
        else 'alarm'
      end as status,
        name || ' has ' || replica_count || ' replica count.' as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_search_service as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
