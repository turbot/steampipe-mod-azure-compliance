locals {
  conformance_pack_mysql_common_tags = {
    service = "mysql"
  }
}

control "mysql_ssl_enabled" {
  title       = "Enforce SSL connection should be enabled for MySQL database servers"
  description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  sql         = query.mysql_ssl_enabled.sql

  tags = merge(local.conformance_pack_mysql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}
