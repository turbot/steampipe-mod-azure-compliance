locals {
  all_controls_redis_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Redis"
  })
}

benchmark "all_controls_redis" {
  title       = "Redis"
  description = "This section contains recommendations for configuring Redis resources."
  children = [
    control.redis_cache_ssl_enabled,
    control.redis_cache_uses_private_link,
    control.redis_cache_in_virtual_network,
    control.redis_cache_min_tls_1_2,
    control.redis_cache_no_basic_sku
  ]

  tags = merge(local.all_controls_redis_common_tags, {
    type = "Benchmark"
  })
}
