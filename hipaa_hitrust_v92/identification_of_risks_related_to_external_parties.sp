benchmark "hipaa_hitrust_v92_identification_of_risks_related_to_external_parties" {
  title         = "Identification of Risks Related to External Parties"
  children = [
    benchmark.hipaa_hitrust_v92_1401_05i1organizational_1239_05_i,
    benchmark.hipaa_hitrust_v92_1402_05i1organizational_45_05_i,
    benchmark.hipaa_hitrust_v92_1403_05i1organizational_67_05_i,
    benchmark.hipaa_hitrust_v92_1404_05i2organizational_1_05_i,
    benchmark.hipaa_hitrust_v92_1418_05i1organizational_8_05_i,
    benchmark.hipaa_hitrust_v92_1450_05i2organizational_2_05_i,
    benchmark.hipaa_hitrust_v92_1451_05icsporganizational_2_05_i
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1401_05i1organizational_1239_05_i" {
  title         = "1401.05i1Organizational.1239 - 05.i"
  description   = "Access to the organizations information and systems by external parties is not permitted until due diligence has been conducted, the appropriate controls have been implemented, and a contract/agreement reflecting the security requirements is signed acknowledging they understand and accept their obligations."
  children = [
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1402_05i1organizational_45_05_i" {
  title         = "1402.05i1Organizational.45 - 05.i"
  description   = "ARemote access connections between the organization and external parties are encrypted."
  children = [
    control.appservice_function_app_only_https_accessible
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1403_05i1organizational_67_05_i" {
  title         = "1403.05i1Organizational.67 - 05.i"
  description   = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required."
  children = [
    control.appservice_web_app_use_https
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1418_05i1organizational_8_05_i" {
  title         = "1418.05i1Organizational.8 - 05.i"
  description   = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues."
  children = [
    control.mysql_ssl_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1450_05i2organizational_2_05_i" {
  title         = "1450.05i2Organizational.2 - 05.i"
  description   = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."
  children = [
    control.postgres_sql_ssl_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1404_05i2organizational_1_05_i" {
  title         = "1404.05i2Organizational.1 - 05.i"
  description   = "Due diligence of the external party includes interviews, document review, checklists, certification reviews (e.g. HITRUST) or other remote means."
  children = [
    control.appservice_api_app_use_https,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1451_05icsporganizational_2_05_i" {
  title         = "1451.05iCSPOrganizational.2 - 05.i"
  description   = "Cloud service providers design and implement controls to mitigate and contain data security risks through proper separation of duties, role-based access, and least-privilege access for all personnel within their supply chain."
  children = [
    control.azure_redis_cache_ssl_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
