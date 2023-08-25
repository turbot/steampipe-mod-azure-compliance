locals {
  controls_by_service_search_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/CognitiveSearch"
  })
}

benchmark "controls_by_service_search" {
  title       = "Cognitive Search"
  description = "This section contains recommendations for configuring Cognitive Search resources."
  children = [
    control.search_service_logging_enabled,
    control.search_service_public_network_access_disabled,
    control.search_service_replica_count_3,
    control.search_service_uses_managed_identity,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link
  ]

  tags = merge(local.controls_by_service_search_common_tags, {
    type = "Benchmark"
  })
}
