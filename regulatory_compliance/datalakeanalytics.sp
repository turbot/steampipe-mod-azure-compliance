locals {
  regulatory_compliance_datalakeanalytics_common_tags = {
    service = "Azure/DataLakeAnalytics"
  }
}

control "datalake_analytics_account_logging_enabled" {
  title       = "Resource logs in Data Lake Analytics should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  query       = query.datalake_analytics_account_logging_enabled

  tags = merge(local.regulatory_compliance_datalakeanalytics_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}
