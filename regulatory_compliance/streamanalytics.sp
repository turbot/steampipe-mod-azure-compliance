locals {
  conformance_pack_streamanalytics_common_tags = {
    service = "streamanalytics"
  }
}

control "stream_analytics_job_logging_enabled" {
  title       = "Resource logs in Azure Stream Analytics should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.stream_analytics_job_logging_enabled.sql

  tags = merge(local.conformance_pack_streamanalytics_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}