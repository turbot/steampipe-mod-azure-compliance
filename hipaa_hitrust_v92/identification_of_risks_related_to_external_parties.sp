benchmark "hipaa_hitrust_v92_identification_of_risks_related_to_external_parties" {
  title    = "Identification of Risks Related to External Parties"
  children = [
    benchmark.hipaa_hitrust_v92_1401_05i1organizational_1239_05_i,
    benchmark.hipaa_hitrust_v92_1402_05i1organizational_45_05_i,
    benchmark.hipaa_hitrust_v92_1403_05i1organizational_67_05_i,
    benchmark.hipaa_hitrust_v92_1418_05i1organizational_8_05_i
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1401_05i1organizational_1239_05_i" {
  title       = "Access to the organizations information and systems by external parties"
  description = "Access to the organizations information and systems by external parties is not permitted until due diligence has been conducted, the appropriate controls have been implemented, and a contract/agreement reflecting the security requirements is signed acknowledging they understand and accept their obligations."
  children = [
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Storage"
  })
}

benchmark "hipaa_hitrust_v92_1402_05i1organizational_45_05_i" {
  title    = "Remote access connections between the organization and external parties are encrypted"
  children = [
    control.appservice_function_app_only_https_accessible
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1403_05i1organizational_67_05_i" {
  title    = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required"
  children = [
    control.appservice_web_app_use_https
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1418_05i1organizational_8_05_i" {
  title    = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues"
  children = [
    control.mysql_ssl_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/MySQL"
  })
}