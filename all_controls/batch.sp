locals {
  all_controls_batch_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Batch"
  })
}

benchmark "all_controls_batch" {
  title       = "Batch"
  description = "This section contains recommendations for configuring Batch resources."
  children = [
    control.batch_account_encrypted_with_cmk,
    control.batch_account_logging_enabled
  ]

  tags = merge(local.all_controls_batch_common_tags, {
    type = "Benchmark"
  })
}
