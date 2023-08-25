locals {
  controls_by_service_batch_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/Batch"
  })
}

benchmark "controls_by_service_batch" {
  title       = "Batch"
  description = "This section contains recommendations for configuring Batch resources."
  children = [
    control.batch_account_encrypted_with_cmk,
    control.batch_account_logging_enabled
  ]

  tags = merge(local.controls_by_service_batch_common_tags, {
    type = "Benchmark"
  })
}
