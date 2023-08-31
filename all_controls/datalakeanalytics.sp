locals {
  all_controls_datalakeanalytics_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/DataLakeAnalytics"
  })
}

benchmark "all_controls_datalakeanalytics" {
  title       = "Data Lake Analytics"
  description = "This section contains recommendations for configuring Data Lake Analytics resources."
  children = [
    control.datalake_analytics_account_logging_enabled
  ]

  tags = merge(local.all_controls_datalakeanalytics_common_tags, {
    type = "Benchmark"
  })
}
