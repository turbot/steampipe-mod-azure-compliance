locals {
  other_redis_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/Redis"
  })
}

benchmark "other_redis" {
  title = "Redis"
  children = [
    control.redis_cache_in_virtual_network,
    control.redis_cache_min_tls_1_2
  ]

  tags = merge(local.other_redis_common_tags, {
    type = "Benchmark"
  })
}
