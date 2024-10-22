benchmark "hipaa_hitrust_v92_on_line_transactions" {
  title       = "On-line Transactions"
  description = "Information involved in online transactions shall be protected to prevent incomplete transmission, misrouting, unauthorized message alteration, unauthorized disclosure, unauthorized message duplication or replay."
  children = [
    benchmark.hipaa_hitrust_v92_0946_09y2organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0946_09y2organizational" {
  title = "The organization requires the use of encryption between, and the use of electronic signatures by, each of the parties involved in the transaction"
  children = [
    control.redis_cache_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Redis"
  })
}
