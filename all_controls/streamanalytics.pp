locals {
  all_controls_streamanalytics_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/StreamAnalytics"
  })
}

benchmark "all_controls_streamanalytics" {
  title       = "Stream Analytics"
  description = "This section contains recommendations for configuring Stream Analytics resources."
  children = [
    control.stream_analytics_job_logging_enabled
  ]

  tags = merge(local.all_controls_streamanalytics_common_tags, {
    type = "Benchmark"
  })
}
