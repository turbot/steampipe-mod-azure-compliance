benchmark "hipaa_hitrust_v92_network_connection_control" {
  title         = "Network Connection Control"
  children = [
    benchmark.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n,
    benchmark.hipaa_hitrust_v92_0810_01n2organizational_5_01_n,
    benchmark.hipaa_hitrust_v92_0811_01n2organizational_6_01_n,
    benchmark.hipaa_hitrust_v92_0812_01n2organizational_8_01_n,
    benchmark.hipaa_hitrust_v92_0814_01n1organizational_12_01_n
  ]

  tags  = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n" {
  title         = "0809.01n2Organizational.1234 - 01.n"
  description   = "Network traffic is controlled in accordance with the organizations access control policy through firewall and other network-related restrictions for each network access point or external telecommunication service's managed interface."
  children = [
    control.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_3,
    control.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_4,
    control.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_9,
    control.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_11,
    control.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_14
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_3" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_4" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server.	Audit, Disabled."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_9" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_11" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n_14" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0810_01n2organizational_5_01_n" {
  title         = "0810.01n2Organizational.5 - 01.n"
  description   = "Transmitted information is secured and, at a minimum, encrypted over open, public networks"
  children = [
    control.hipaa_hitrust_v92_0810_01n2organizational_5_01_n_3,
    control.hipaa_hitrust_v92_0810_01n2organizational_5_01_n_4,
    control.hipaa_hitrust_v92_0810_01n2organizational_5_01_n_9,
    control.hipaa_hitrust_v92_0810_01n2organizational_5_01_n_11,
    control.hipaa_hitrust_v92_0810_01n2organizational_5_01_n_14
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0810_01n2organizational_5_01_n_3" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0810_01n2organizational_5_01_n_4" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0810_01n2organizational_5_01_n_9" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0810_01n2organizational_5_01_n_11" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0810_01n2organizational_5_01_n_14" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0811_01n2organizational_6_01_n" {
  title         = "0811.01n2Organizational.6 - 01.n"
  description   = "Exceptions to the traffic flow policy are documented with a supporting mission/business need, duration of the exception, and reviewed at least annually; traffic flow policy exceptions are removed when no longer supported by an explicit mission/business need."
  children = [
    control.hipaa_hitrust_v92_0811_01n2organizational_6_01_n_3,
    control.hipaa_hitrust_v92_0811_01n2organizational_6_01_n_4,
    control.hipaa_hitrust_v92_0811_01n2organizational_6_01_n_9,
    control.hipaa_hitrust_v92_0811_01n2organizational_6_01_n_11,
    control.hipaa_hitrust_v92_0811_01n2organizational_6_01_n_14
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0811_01n2organizational_6_01_n_3" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0811_01n2organizational_6_01_n_4" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0811_01n2organizational_6_01_n_9" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0811_01n2organizational_6_01_n_11" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0811_01n2organizational_6_01_n_14" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0812_01n2organizational_8_01_n" {
  title         = "0812.01n2Organizational.8 - 01.n"
  description   = "Remote devices establishing a non-remote connection are not allowed to communicate with external (remote) resources."
  children = [
    control.hipaa_hitrust_v92_0812_01n2organizational_8_01_n_3,
    control.hipaa_hitrust_v92_0812_01n2organizational_8_01_n_4,
    control.hipaa_hitrust_v92_0812_01n2organizational_8_01_n_9,
    control.hipaa_hitrust_v92_0812_01n2organizational_8_01_n_11,
    control.hipaa_hitrust_v92_0812_01n2organizational_8_01_n_14
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0812_01n2organizational_8_01_n_3" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0812_01n2organizational_8_01_n_4" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0812_01n2organizational_8_01_n_9" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0812_01n2organizational_8_01_n_11" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0812_01n2organizational_8_01_n_14" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0814_01n1organizational_12_01_n" {
  title         = "0814.01n1Organizational.12 - 01.n"
  description   = "The ability of users to connect to the internal network is restricted using a deny-by-default and allow-by-exception policy at managed interfaces according to the access control policy and the requirements of clinical and business applications."
  children = [
    control.hipaa_hitrust_v92_0814_01n1organizational_12_01_n_3,
    control.hipaa_hitrust_v92_0814_01n1organizational_12_01_n_4,
    control.hipaa_hitrust_v92_0814_01n1organizational_12_01_n_9,
    control.hipaa_hitrust_v92_0814_01n1organizational_12_01_n_11,
    control.hipaa_hitrust_v92_0814_01n1organizational_12_01_n_14
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0814_01n1organizational_12_01_n_3" {
  title         = "Enforce SSL connection should be enabled for MySQL database servers"
  description   = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.mysql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0814_01n1organizational_12_01_n_4" {
  title         = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description   = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql           = query.postgres_sql_ssl_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0814_01n1organizational_12_01_n_9" {
  title         = "Latest TLS version should be used in your Web App"
  description   = "Upgrade to the latest TLS version."
  sql           = query.appservice_web_app_latest_tls_version.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0814_01n1organizational_12_01_n_11" {
  title         = "Secure transfer to storage accounts should be enabled"
  description   = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql           = query.storage_account_secure_transfer_required_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_0814_01n1organizational_12_01_n_14" {
  title         = "Web Application should only be accessible over HTTPS"
  description   = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks.."
  sql           = query.appservice_web_app_use_https.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}