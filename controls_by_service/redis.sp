locals {
  controls_by_service_redis_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/Redis"
  })
}

benchmark "controls_by_service_redis" {
  title       = "Redis"
  description = "This section contains recommendations for configuring Redis resources."
  children = [
    control.azure_redis_cache_ssl_enabled,
    control.azure_redis_cache_uses_private_link,
    control.redis_cache_in_virtual_network,
    control.redis_cache_min_tls_1_2,
    control.redis_cache_no_basic_sku
  ]

  tags = merge(local.controls_by_service_redis_common_tags, {
    type = "Benchmark"
  })
}
