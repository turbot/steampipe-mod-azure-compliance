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
    control.hipaa_hitrust_v92_1401_05i1organizational_1239_05_i_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1401_05i1organizational_1239_05_i_1" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1403_05i1organizational_67_05_i" {
  title         = "1403.05i1Organizational.67 - 05.i"
  description   = "Access granted to external parties is limited to the minimum necessary and granted only for the duration required."
  children = [
    control.hipaa_hitrust_v92_1403_05i1organizational_67_05_i_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1403_05i1organizational_67_05_i_1" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1418_05i1organizational_8_05_i" {
  title         = "1418.05i1Organizational.8 - 05.i"
  description   = "The identification of risks related to external party access takes into account a minimal set of specifically defined issues."
  children = [
    control.hipaa_hitrust_v92_1418_05i1organizational_8_05_i_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1418_05i1organizational_8_05_i_1" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1450_05i2organizational_2_05_i" {
  title         = "1450.05i2Organizational.2 - 05.i"
  description   = "The organization obtains satisfactory assurances that reasonable information security exists across their information supply chain by performing an annual review, which includes all partners/third party-providers upon which their information supply chain depends."
  children = [
    control.hipaa_hitrust_v92_1450_05i2organizational_2_05_i_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1450_05i2organizational_2_05_i_1" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}
