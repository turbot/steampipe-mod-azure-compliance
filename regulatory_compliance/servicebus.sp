locals {
  regulatory_compliance_servicebus_common_tags = {
    service = "Azure/ServiceBus"
  }
}

control "servicebus_namespace_logging_enabled" {
  title       = "Resource logs in Service Bus should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.servicebus_namespace_logging_enabled

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    fundamental_security = "true"
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "servicebus_name_space_private_link_used" {
  title       = "Azure Service Bus namespaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Service Bus namespaces, data leakage risks are reduced."
  query       = query.servicebus_name_space_private_link_used

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "servicebus_premium_namespace_cmk_encrypted" {
  title       = "Service Bus Premium namespaces should use a customer-managed key for encryption"
  description = "Azure Service Bus supports the option of encrypting data at rest with either Microsoft-managed keys (default) or customer-managed keys. Choosing to encrypt data using customer-managed keys enables you to assign, rotate, disable, and revoke access to the keys that Service Bus will use to encrypt data in your namespace. Note that Service Bus only supports encryption with customer-managed keys for premium namespaces."
  query       = query.servicebus_premium_namespace_cmk_encrypted

  tags = merge(local.regulatory_compliance_servicebus_common_tags, {
    fundamental_security = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

query "servicebus_namespace_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as namespace_name
      from
        azure_servicebus_namespace,
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
        when l.namespace_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when v.diagnostic_settings is null then v.name || ' logging not enabled.'
        when l.namespace_name is null then v.name || ' logging not enabled.'
        else v.name || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_servicebus_namespace as v
      left join logging_details as l on v.name = l.namespace_name,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "servicebus_name_space_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku_name in ('Basic', 'Standard') then 'skip'
        when private_endpoint_connections is null then 'info'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name in ('Basic', 'Standard') then a.name || ' is of ' || sku_name || ' tier.'
        when private_endpoint_connections is null then a.name || ' no private link exists.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb
        then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_servicebus_namespace a,
      azure_subscription sub;
  EOQ
}

query "servicebus_premium_namespace_cmk_encrypted" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku_tier <> 'Premium' then 'skip'
        when encryption -> 'keySource' = '"Microsoft.KeyVault"' then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_tier <> 'Premium' then a.name || ' is of ' || sku_tier || ' tier.'
        when encryption -> 'keySource' = '"Microsoft.KeyVault"' then a.name || ' encrypted using CMK.'
        else a.name || ' not encrypted using CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_servicebus_namespace a,
      azure_subscription sub;
  EOQ
}

query "servicebus_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with service_bus as (
      select
        name,
        region,
        network_rule_set -> 'properties' -> 'virtualNetworkRules' as virtual_network_rules
      from
        azure_servicebus_namespace
      where
        sku_tier = 'Premium'
        and (
          jsonb_array_length(network_rule_set -> 'properties' -> 'virtualNetworkRules') = 0
          or exists (
            select
              *
            from
              jsonb_array_elements(network_rule_set -> 'properties' -> 'virtualNetworkRules') as t
            where
              t -> 'subnet' ->> 'id' is null
          )
        )
    )
    select
      bus.id as resource,
      case
        when bus.name != service_bus.name then 'ok'
        else 'alarm'
      end as status,
      case
        when bus.name != service_bus.name then bus.name || ' configured with virtual service endpoint.'
        else bus.name || ' not configured with virtual service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "bus.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_servicebus_namespace as bus,
      azure_subscription as sub
      left join service_bus on true
    where
      sub.subscription_id = bus.subscription_id;
  EOQ
}
