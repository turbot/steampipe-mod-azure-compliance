benchmark "hipaa_hitrust_v92_identification_of_risks_related_to_external_parties" {
  title         = "Identification of Risks Related to External Parties"
  children = [
    benchmark.hipaa_hitrust_v92_1401_05i1organizational_1239_05_i,
    benchmark.hipaa_hitrust_v92_1403_05i1organizational_67_05_i,
    benchmark.hipaa_hitrust_v92_1418_05i1organizational_8_05_i,
    benchmark.hipaa_hitrust_v92_1450_05i2organizational_2_05_i
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1401_05i1organizational_1239_05_i" {
  title         = "1401.05i1Organizational.1239 - 05.i"
  description   = "Access to the organizations information and systems by external parties is not permitted until due diligence has been conducted, the appropriate controls have been implemented, and a contract/agreement reflecting the security requirements is signed acknowledging they understand and accept their obligations."
  children = [
    control.storage_account_secure_transfer_required_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1403_05i1organizational_67_05_i" {
  title         = "1403.05i1Organizational.67 - 05.i"
  description   = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required."
  children = [
    control.appservice_web_app_use_https,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1418_05i1organizational_8_05_i" {
  title         = "1418.05i1Organizational.8 - 05.i"
  description   = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues."
  children = [
    control.mysql_ssl_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1450_05i2organizational_2_05_i" {
  title         = "1450.05i2Organizational.2 - 05.i"
  description   = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."
  children = [
    control.postgres_sql_ssl_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
