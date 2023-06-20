benchmark "hipaa_hitrust_v92_on_line_transactions" {
  title    = "On-line Transactions"
  children = [
    benchmark.hipaa_hitrust_v92_0946_09y2organizational_14_09_y
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0946_09y2organizational_14_09_y" {
  title    = "The organization requires the use of encryption between, and the use of electronic signatures by, each of the parties involved in the transaction"
  children = [
    control.azure_redis_cache_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Redis"
  })
}
