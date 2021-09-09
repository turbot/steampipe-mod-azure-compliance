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

control "mysql_db_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MySQL"
  description = "Azure Database for MySQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql         = query.mysql_db_server_geo_redundant_backup_enabled.sql

  tags = merge(local.conformance_pack_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mssql_managed_instance_encryption_at_rest_using_cmk" {
  title       = "SQL managed instances should use customer-managed keys to encrypt data at rest"
  description = "Implementing Transparent Data Encryption (TDE) with your own key provides you with increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
  sql         = query.mssql_managed_instance_encryption_at_rest_using_cmk.sql

  tags = merge(local.conformance_pack_mysql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "mssql_managed_instance_vulnerability_assessment_enabled" {
  title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
  description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  sql         = query.mssql_managed_instance_vulnerability_assessment_enabled.sql

  tags = merge(local.conformance_pack_mysql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}