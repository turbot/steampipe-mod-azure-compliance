locals {
  controls_by_service_datalakeanalytics_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/DataLakeAnalytics"
  })
}

benchmark "controls_by_service_datalakeanalytics" {
  title       = "Data Lake Analytics"
  description = "This section contains recommendations for configuring Data Lake Analytics resources."
  children = [
    control.datalake_analytics_account_logging_enabled
  ]

  tags = merge(local.controls_by_service_datalakeanalytics_common_tags, {
    type = "Benchmark"
  })
}
