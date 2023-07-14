locals {
  regulatory_compliance_eventhub_common_tags = {
    service = "Azure/EventHub"
  }
}

control "eventhub_namespace_logging_enabled" {
  title       = "Resource logs in Event Hub should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.eventhub_namespace_logging_enabled

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventhub_namespace_use_virtual_service_endpoint" {
  title       = "Event Hub should use a virtual network service endpoint"
  description = "This policy audits any Event Hub not configured to use a virtual network service endpoint."
  query       = query.eventhub_namespace_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "eventhub_namespace_private_link_used" {
  title       = "Event Hub namespaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Event Hub namespaces, data leakage risks are reduced."
  query       = query.eventhub_namespace_private_link_used

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "eventhub_namespace_cmk_encryption_enabled" {
  title       = "Event Hub namespaces should use a customer-managed key for encryption"
  description = "Azure Event Hubs supports the option of encrypting data at rest with either Microsoft-managed keys (default) or customer-managed keys. Choosing to encrypt data using customer-managed keys enables you to assign, rotate, disable, and revoke access to the keys that Event Hub will use to encrypt data in your namespace. Note that Event Hub only supports encryption with customer-managed keys for namespaces in dedicated clusters."
  query       = query.eventhub_namespace_cmk_encryption_enabled

  tags = merge(local.regulatory_compliance_eventhub_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "eventhub_namespace_logging_enabled" {
  sql = <<-EOQ
    with logging_details as (
      select
        distinct name as namespace_name
      from
        azure_eventhub_namespace,
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
      azure_eventhub_namespace as v
      left join logging_details as l on v.name = l.namespace_name,
      azure_subscription as sub
    where
      sub.subscription_id = v.subscription_id;
  EOQ
}

query "eventhub_namespace_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with eventhub_namesapce_with_virtual_network as (
      select
        distinct a.id
      from
        azure_eventhub_namespace as a,
        jsonb_array_elements(network_rule_set -> 'properties' -> 'virtualNetworkRules') as rule
      where
        rule -> 'subnet' ->> 'id' is not null
    )
    select
      a.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then a.name || ' not configured with virtual network service endpoint.'
        else a.name || ' configured with virtual network service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventhub_namespace as a
      left join eventhub_namesapce_with_virtual_network as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "eventhub_namespace_private_link_used" {
  sql = <<-EOQ
    with eventhub_service_connection as (
      select
        distinct a.id
      from
        azure_eventhub_namespace as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      a.id as resource,
      case
        when sku_tier = 'Basic' then 'skip'
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when sku_tier = 'Basic' then a.name || ' is of ' || sku_tier || ' tier.'
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventhub_namespace as a
      left join eventhub_service_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "eventhub_namespace_cmk_encryption_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when encryption ->> 'keySource' = 'Microsoft.KeyVault' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption ->> 'keySource' = 'Microsoft.KeyVault' then a.name || ' CMK encryption enabled.'
        else a.name || ' CMK encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_eventhub_namespace as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
