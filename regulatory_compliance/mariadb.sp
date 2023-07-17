locals {
  regulatory_compliance_mariadb_common_tags = {
    service = "Azure/MariaDB"
  }
}

control "mariadb_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MariaDB"
  description = "Azure Database for MariaDB allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  query       = query.mariadb_server_geo_redundant_backup_enabled

  tags = merge(local.regulatory_compliance_mariadb_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mariadb_server_public_network_access_disabled" {
  title       = "Public network access should be disabled for MariaDB servers"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MariaDB can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  query       = query.mariadb_server_public_network_access_disabled

  tags = merge(local.regulatory_compliance_mariadb_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mariadb_server_private_link_used" {
  title       = "Private endpoint should be enabled for MariaDB servers"
  description = "Private endpoint connections enforce secure communication by enabling private connectivity to Azure Database for MariaDB. Configure a private endpoint connection to enable access to traffic coming only from known networks and prevent access from all other IP addresses, including within Azure."
  query       = query.mariadb_server_private_link_used

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "mariadb_server_geo_redundant_backup_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when s.geo_redundant_backup_enabled = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when s.geo_redundant_backup_enabled = 'Enabled' then s.title || ' geo-redundant backup enabled.'
        else s.title || ' geo-redundant backup disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mariadb_server as s
      join azure_subscription as sub on sub.subscription_id = s.subscription_id;
  EOQ
}

query "mariadb_server_public_network_access_disabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when public_network_access = 'Enabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access = 'Enabled' then name || ' public network access enabled.'
        else name || ' public network access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mariadb_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mariadb_server_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        -- Only applicable to standard tier
        when sku_tier = 'Basic' then 'skip'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_tier = 'Basic' then a.name || ' is of ' || sku_tier || ' tier.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' using private link.'
        else a.name || ' not using private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mariadb_server a,
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}