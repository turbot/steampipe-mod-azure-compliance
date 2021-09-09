locals {
  conformance_pack_mariadb_common_tags = {
    service = "mariadb"
  }
}

control "mariadb_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
  description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql         = query.mariadb_server_geo_redundant_backup_enabled.sql

  tags = merge(local.conformance_pack_mariadb_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}
