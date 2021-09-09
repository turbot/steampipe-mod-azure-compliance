locals {
  conformance_pack_servicebus_common_tags = {
    service = "servicebus"
  }
}

control "servicebus_namespace_logging_enabled" {
  title       = "Resource logs in Service Bus should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.servicebus_namespace_logging_enabled.sql

  tags = merge(local.conformance_pack_servicebus_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}