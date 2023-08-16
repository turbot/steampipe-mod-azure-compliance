locals {
  fundamental_security_datalakeanalytics_common_tags = {
    service = "Azure/DataLakeAnalytics"
  }
}

benchmark "fundamental_security_datalakeanalytics" {
  title       = "DataLakeAnalytics"
  description = "This section contains recommendations for configuring DataLakeAnalytics resources."
  children = [
    control.datalake_analytics_account_logging_enabled
  ]
}
