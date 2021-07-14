benchmark "hipaa_hitrust_v92_audit_logging" {
  title         = "Audit Logging"
  children = [
    benchmark.hipaa_hitrust_v92_1211_09aa3system_4_09_aa,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1211_09aa3system_4_09_aa" {
  title         = "1211.09aa3System.4 - 09.aa"
  description   = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."
  children = [
    control.hipaa_hitrust_v92_1211_09aa3system_4_09_aa_3,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1211_09aa3system_4_09_aa_3" {
  title         = "Resource logs in Key Vault should be enabled"
  description   = "Audit enabling of resource logs. This enables you to recreate activity trails to use for investigation purposes when a security incident occurs or when your network is compromised."
  sql           = query.keyvault_logging_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}