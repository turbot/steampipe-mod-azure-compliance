locals {
  fundamental_security_datalakeanalytics_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/DataLakeAnalytics"
  })
}

benchmark "fundamental_security_datalakeanalytics" {
  title       = "Data Lake Analytics"
  description = "This section contains recommendations for configuring Data Lake Analytics resources."
  children = [
    control.datalake_analytics_account_logging_enabled
  ]

  tags = merge(local.fundamental_security_datalakeanalytics_common_tags, {
    type = "Benchmark"
  })
}
