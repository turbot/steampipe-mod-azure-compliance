locals {
  fundamental_security_batch_common_tags = {
    service = "Azure/Batch"
  }
}

benchmark "fundamental_security_batch" {
  title       = "Batch"
  description = "This section contains recommendations for configuring Batch resources."
  children = [
    control.batch_account_encrypted_with_cmk,
    control.batch_account_logging_enabled
  ]
}
