locals {
  controls_by_service_streamanalytics_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/StreamAnalytics"
  })
}

benchmark "controls_by_service_streamanalytics" {
  title       = "Stream Analytics"
  description = "This section contains recommendations for configuring Stream Analytics resources."
  children = [
    control.stream_analytics_job_logging_enabled
  ]

  tags = merge(local.controls_by_service_streamanalytics_common_tags, {
    type = "Benchmark"
  })
}
