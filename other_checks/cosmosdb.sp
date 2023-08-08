locals {
  other_cosmosdb_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/CosmosDB"
  })
}

benchmark "other_cosmosdb" {
  title = "CosmosDB"
  children = [
    control.cosmosdb_account_key_based_metadata_write_access_disabled
  ]

  tags = merge(local.other_cosmosdb_common_tags, {
    type = "Benchmark"
  })
}
