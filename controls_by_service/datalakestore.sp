locals {
  controls_by_service_datalakestore_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/DataLakeStorage"
  })
}

benchmark "controls_by_service_datalakestore" {
  title       = "Data Lake Storage"
  description = "This section contains recommendations for configuring Data Lake Storage resources."
  children = [
    control.datalake_store_account_encryption_enabled,
    control.datalake_store_account_logging_enabled
  ]

  tags = merge(local.controls_by_service_datalakestore_common_tags, {
    type = "Benchmark"
  })
}
