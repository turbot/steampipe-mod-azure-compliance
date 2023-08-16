locals {
  fundamental_security_datalakestore_common_tags = {
    service = "Azure/DataLakeStorage"
  }
}

benchmark "fundamental_security_datalakestore" {
  title       = "Data Lake Storage"
  description = "This section contains recommendations for configuring DataLakeStorage resources."
  children = [
    control.datalake_store_account_encryption_enabled,
    control.datalake_store_account_logging_enabled
  ]
}
