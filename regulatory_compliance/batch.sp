locals {
  conformance_pack_batch_common_tags = {
    service = "batch"
  }
}

control "batch_account_logging_enabled" {
  title       = "Resource logs in Batch accounts should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.batch_account_logging_enabled.sql

  tags = merge(local.conformance_pack_batch_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}
