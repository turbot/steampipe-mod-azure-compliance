benchmark "hipaa_hitrust_v92_on_line_transactions" {
  title         = "On-line Transactions"
  children = [
    benchmark.hipaa_hitrust_v92_0943_09y1organizational_1_09_y,
    benchmark.hipaa_hitrust_v92_0947_09y2organizational_2_09_y,
    benchmark.hipaa_hitrust_v92_0948_09y2organizational_3_09_y,
    benchmark.hipaa_hitrust_v92_0949_09y2organizational_5_09_y
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0943_09y1organizational_1_09_y" {
  title         = "0943.09y1Organizational.1 - 09.y"
  description   = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."
  children = [
    control.hipaa_hitrust_v92_0943_09y1organizational_1_09_y_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0943_09y1organizational_1_09_y_1" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0947_09y2organizational_2_09_y" {
  title         = "0947.09y2Organizational.2 - 09.y"
  description   = "The organization ensures the storage of the transaction details are located outside of any publicly accessible environments (e.g., on a storage platform existing on the organization's intranet) and not retained and exposed on a storage medium directly accessible from the Internet."
  children = [
    control.hipaa_hitrust_v92_0947_09y2organizational_2_09_y_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0947_09y2organizational_2_09_y_1" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0948_09y2organizational_3_09_y" {
  title         = "0948.09y2Organizational.3 - 09.y"
  description   = "TWhere a trusted authority is used (e.g., for the purposes of issuing and maintaining digital signatures and/or digital certificates), security is integrated and embedded throughout the entire end-to-end certificate/signature management process."
  children = [
    control.hipaa_hitrust_v92_0948_09y2organizational_3_09_y_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0948_09y2organizational_3_09_y_1" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0949_09y2organizational_5_09_y" {
  title         = "0949.09y2Organizational.5 - 09.y"
  description   = "The protocols used for communications are enhanced to address any new vulnerability, and the updated versions of the protocols are adopted as soon as possible."
  children = [
    control.hipaa_hitrust_v92_0949_09y2organizational_5_09_y_4,
    control.hipaa_hitrust_v92_0949_09y2organizational_5_09_y_5,
    control.hipaa_hitrust_v92_0949_09y2organizational_5_09_y_6
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0949_09y2organizational_5_09_y_4" {
  title         = "Latest TLS version should be used in your Function App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_function_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0949_09y2organizational_5_09_y_5" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0949_09y2organizational_5_09_y_6" {
  title         = "Web Application should only be accessible over HTTPSs"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}