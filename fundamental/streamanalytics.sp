locals {
  fundamental_security_streamanalytics_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/StreamAnalytics"
  })
}

benchmark "fundamental_security_streamanalytics" {
  title       = "Stream Analytics"
  description = "This section contains recommendations for configuring StreamAnalytics resources."
  children = [
    control.stream_analytics_job_logging_enabled
  ]

  tags = merge(local.fundamental_security_streamanalytics_common_tags, {
    type = "Benchmark"
  })
}
