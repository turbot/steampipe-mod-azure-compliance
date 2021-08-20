locals {
  conformance_pack_redis_common_tags = {
    service = "redis"
  }
}

control "azure_redis_cache_ssl_enabled" {
  title       = "Only secure connections to your Azure Cache for Redis should be enabled"
  description = "Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql         = query.azure_redis_cache_ssl_enabled.sql

  tags = merge(local.conformance_pack_redis_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}