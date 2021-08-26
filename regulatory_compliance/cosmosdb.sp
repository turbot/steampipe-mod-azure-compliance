locals {
  conformance_pack_cosmosdb_common_tags = {
    service = "cosmosdb"
  }
}

control "cosmosdb_use_virtual_service_endpoint" {
  title       = "Cosmos DB should use a virtual network service endpoint"
  description = "This policy audits any Cosmos DB not configured to use a virtual network service endpoint."
  sql         = query.cosmosdb_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_cosmosdb_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}