locals {
  all_controls_datalakestore_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/DataLakeStorage"
  })
}

benchmark "all_controls_datalakestore" {
  title       = "Data Lake Storage"
  description = "This section contains recommendations for configuring Data Lake Storage resources."
  children = [
    control.datalake_store_account_encryption_enabled,
    control.datalake_store_account_logging_enabled
  ]

  tags = merge(local.all_controls_datalakestore_common_tags, {
    type = "Benchmark"
  })
}
