locals {
  conformance_pack_postgres_common_tags = {
    service = "postgres"
  }
}

control "postgres_db_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  description = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql         = query.postgres_db_server_geo_redundant_backup_enabled.sql

  tags = merge(local.conformance_pack_postgres_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "postgres_sql_ssl_enabled" {
  title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server"
  sql         = query.postgres_sql_ssl_enabled.sql

  tags = merge(local.conformance_pack_postgres_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}