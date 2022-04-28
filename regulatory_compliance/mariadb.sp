locals {
  regulatory_compliance_mariadb_common_tags = {
    service = "Azure/DatabaseForMariaDB"
  }
}

control "mariadb_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
  description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  sql         = query.mariadb_server_geo_redundant_backup_enabled.sql

  tags = merge(local.regulatory_compliance_mariadb_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mariadb_server_public_network_access_disabled" {
  title       = "Public network access should be disabled for MariaDB servers"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MariaDB can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  sql         = query.mariadb_server_public_network_access_disabled.sql

  tags = merge(local.regulatory_compliance_mariadb_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
