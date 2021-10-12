locals {
  regulatory_compliance_datalakestore_common_tags = {
    service = "datalakestore"
  }
}

control "datalake_store_account_encryption_enabled" {
  title       = "Require encryption on Data Lake Store accounts"
  description = "This policy ensures encryption is enabled on all Data Lake Store accounts."
  sql         = query.datalake_store_account_encryption_enabled.sql

  tags = merge(local.regulatory_compliance_datalakestore_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "datalake_store_account_logging_enabled" {
  title       = "Resource logs in Azure Data Lake Store should be enabled"
  description = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes; when a security incident occurs or when your network is compromised."
  sql         = query.datalake_store_account_logging_enabled.sql

  tags = merge(local.regulatory_compliance_datalakestore_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}