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
    hipaa_hitrust_v92 = "true"
  })
}

control "cosmosdb_account_with_firewall_rules" {
  title       = "Azure Cosmos DB accounts should have firewall rules"
  description = "Firewall rules should be defined on your Azure Cosmos DB accounts to prevent traffic from unauthorized sources. Accounts that have at least one IP rule defined with the virtual network filter enabled are deemed compliant. Accounts disabling public access are also deemed compliant."
  query       = query.cosmosdb_account_with_firewall_rules

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cosmosdb_account_uses_private_link" {
  title       = "CosmosDB accounts should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your CosmosDB account, data leakage risks are reduced."
  query       = query.cosmosdb_account_uses_private_link

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cosmosdb_account_encryption_at_rest_using_cmk" {
  title       = "Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure Cosmos DB. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.cosmosdb_account_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_cosmosdb_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
