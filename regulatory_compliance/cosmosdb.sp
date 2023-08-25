locals {
  regulatory_compliance_cosmosdb_common_tags = {
    service = "Azure/CosmosDB"
  }
}

control "cosmosdb_use_virtual_service_endpoint" {
  title       = "Cosmos DB should use a virtual network service endpoint"
  description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
  query       = query.cosmosdb_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service = "true"
    hipaa_hitrust_v92   = "true"
  })
}

control "cosmosdb_account_with_firewall_rules" {
  title       = "Azure Cosmos DB accounts should have firewall rules"
  description = "Firewall rules should be defined on your Azure Cosmos DB accounts to prevent traffic from unauthorized sources. Accounts that have at least one IP rule defined with the virtual network filter enabled are deemed compliant. Accounts disabling public access are also deemed compliant."
  query       = query.cosmosdb_account_with_firewall_rules

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service  = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cosmosdb_account_uses_private_link" {
  title       = "CosmosDB accounts should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your CosmosDB account, data leakage risks are reduced."
  query       = query.cosmosdb_account_uses_private_link

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service  = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cosmosdb_account_encryption_at_rest_using_cmk" {
  title       = "Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure Cosmos DB. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.cosmosdb_account_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service  = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cosmosdb_account_key_based_metadata_write_access_disabled" {
  title       = "Cosmos DB accounts should disable key based metadata write access"
  description = "Ensure Cosmos DB accounts have key-based metadata write_access disabled. This control is non-compliant if Cosmos DB accounts have key-based metadata write access enabled."
  query       = query.cosmosdb_account_key_based_metadata_write_access_disabled

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service = "true"
  })
}

control "cosmosdb_account_virtual_network_filter_enabled" {
  title         = "Ensure That 'Firewalls & Networks' Is Limited to Use Selected Networks Instead of All Networks"
  query         = query.cosmosdb_account_virtual_network_filter_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_5_1.md")

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    controls_by_service = "true"
  })
}

query "cosmosdb_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with cosmosdb_with_virtual_network as (
      select
        distinct a.id
      from
        azure_cosmosdb_account as a,
        jsonb_array_elements(virtual_network_rules) as rule
      where
        rule ->> 'id' is not null
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
      azure_cosmosdb_account as a
      left join cosmosdb_with_virtual_network as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "cosmosdb_account_with_firewall_rules" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when
          public_network_access = 'Enabled'
          and is_virtual_network_filter_enabled = 'false'
          and jsonb_array_length(ip_rules) = 0
          then 'alarm'
        else 'ok'
      end as status,
      case
        when
          public_network_access = 'Enabled'
          and is_virtual_network_filter_enabled = 'false'
          and jsonb_array_length(ip_rules) = 0
          then a.name || ' not have firewall rules.'
        else a.name || ' have firewall rules.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cosmosdb_account as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "cosmosdb_account_uses_private_link" {
  sql = <<-EOQ
    with cosmosdb_private_connection as (
      select
        distinct a.id
      from
        azure_cosmosdb_account as a,
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
      azure_cosmosdb_account as a
      left join cosmosdb_private_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "cosmosdb_account_encryption_at_rest_using_cmk" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when key_vault_key_uri is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when key_vault_key_uri is not null then a.name || ' encrypted at rest using CMK.'
        else a.name || ' not encrypted at rest using CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cosmosdb_account as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "cosmosdb_account_key_based_metadata_write_access_disabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when disable_key_based_metadata_write_access then 'ok'
        else 'alarm'
      end as status,
      case
        when disable_key_based_metadata_write_access then a.name || ' key based metadata write_access disabled.'
        else a.name || ' key based metadata write_access enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cosmosdb_account as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

# Non-config rules

query "cosmosdb_account_virtual_network_filter_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access = 'Disabled' then 'ok'
        when public_network_access = 'Enabled' and is_virtual_network_filter_enabled = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Disabled' then a.name || ' public network access disabled.'
        when public_network_access = 'Enabled' and is_virtual_network_filter_enabled = 'true' then a.name || ' virtual network filter enabled.'
        else a.name || ' virtual network filter disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_cosmosdb_account as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
