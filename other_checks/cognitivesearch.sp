locals {
  other_cognitivesearch_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/CognitiveSearch"
  })
}

benchmark "other_cognitivesearch" {
  title = "CognitiveSearch"
  children = [
    control.search_service_replica_count_2,
    control.search_service_replica_count_3,
    control.search_service_uses_managed_identity
  ]

  tags = merge(local.other_cognitivesearch_common_tags, {
    type = "Benchmark"
  })
}
