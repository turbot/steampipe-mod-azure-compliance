locals {
  fundamental_security_redis_common_tags = {
    service = "Azure/Redis"
  }
}

benchmark "fundamental_security_redis" {
  title       = "Redis"
  description = "This section contains recommendations for configuring Redis resources."
  children = [
    control.azure_redis_cache_ssl_enabled,
    control.azure_redis_cache_uses_private_link,
    control.redis_cache_in_virtual_network,
    control.redis_cache_min_tls_1_2,
    control.redis_cache_no_basic_sku
  ]
}
