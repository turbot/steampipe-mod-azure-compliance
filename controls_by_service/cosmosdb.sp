locals {
  controls_by_service_cosmosdb_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/CosmosDB"
  })
}

benchmark "controls_by_service_cosmosdb" {
  title       = "Cosmos DB"
  description = "This section contains recommendations for configuring CosmosDB resources."
  children = [
    control.cosmosdb_account_encryption_at_rest_using_cmk,
    control.cosmosdb_account_key_based_metadata_write_access_disabled,
    control.cosmosdb_account_uses_private_link,
    control.cosmosdb_account_virtual_network_filter_enabled,
    control.cosmosdb_account_with_firewall_rules,
    control.cosmosdb_use_virtual_service_endpoint
  ]

  tags = merge(local.controls_by_service_cosmosdb_common_tags, {
    type = "Benchmark"
  })
}
