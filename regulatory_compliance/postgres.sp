locals {
  regulatory_compliance_postgres_common_tags = {
    service = "Azure/PostgreSQL"
  }
}

control "postgres_db_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for PostgreSQL"
  description = "Azure Database for PostgreSQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  query       = query.postgres_db_server_geo_redundant_backup_enabled

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "postgres_sql_ssl_enabled" {
  title       = "Enforce SSL connection should be enabled for PostgreSQL database servers"
  description = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server"
  query       = query.postgres_sql_ssl_enabled

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2016    = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "postgresql_server_public_network_access_disabled" {
  title       = "Public network access should be disabled for PostgreSQL servers"
  description = "Disable the public network access property to improve security and ensure your Azure Database for PostgreSQL can only be accessed from a private endpoint. This configuration disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  query       = query.postgresql_server_public_network_access_disabled

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2016    = "true"
  })
}

control "postgresql_server_infrastructure_encryption_enabled" {
  title       = "Infrastructure encryption should be enabled for Azure Database for PostgreSQL servers"
  description = "Enable infrastructure encryption for Azure Database for PostgreSQL servers to have higher level of assurance that the data is secure. When infrastructure encryption is enabled, the data at rest is encrypted twice using FIPS 140-2 compliant Microsoft managed keys."
  query       = query.postgresql_server_infrastructure_encryption_enabled

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "postgres_server_private_link_used" {
  title       = "Private endpoint should be enabled for PostgreSQL servers"
  description = "Private endpoint connections enforce secure communication by enabling private connectivity to Azure Database for PostgreSQL. Configure a private endpoint connection to enable access to traffic coming only from known networks and prevent access from all other IP addresses, including within Azure."
  query       = query.postgres_server_private_link_used

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2016    = "true"
  })
}

control "postgres_sql_server_encrypted_at_rest_using_cmk" {
  title       = "PostgreSQL servers should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your PostgreSQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.postgres_sql_server_encrypted_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "postgres_db_server_latest_tls_version" {
  title       = "PostgreSQL servers should have the latest TLS version"
  description = "This control checks if the PostgreSQL server is upgraded to the latest TLS version."
  query       = query.postgres_db_server_latest_tls_version

  tags = local.regulatory_compliance_postgres_common_tags
}

control "postgres_db_server_connection_throttling_on" {
  title       = "Ensure server parameter 'connection_throttling' is set to 'ON' for PostgreSQL Database Server"
  description = "Enable connection_throttling on PostgreSQL Servers."
  query       = query.postgres_db_server_connection_throttling_on

  tags = local.regulatory_compliance_postgres_common_tags
}

control "postgres_db_server_log_checkpoints_on" {
  title       = "Ensure server parameter 'log_checkpoints' is set to 'ON' for PostgreSQL Database Server"
  description = "Enable log_checkpoints on PostgreSQL Servers."
  query       = query.postgres_db_server_log_checkpoints_on

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "postgres_db_server_log_connections_on" {
  title       = "Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL Database Server"
  description = "Enable log_connections on PostgreSQL Servers."
  query       = query.postgres_db_server_log_connections_on

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "postgres_db_server_log_disconnections_on" {
  title       = "Ensure server parameter 'log_disconnections' is set to 'ON' for PostgreSQL Database Server"
  description = "Enable log_disconnections on PostgreSQL Servers."
  query       = query.postgres_db_server_log_disconnections_on

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "postgres_db_server_log_duration_on" {
  title       = "Ensure server parameter 'log_duration' is set to 'ON' for PostgreSQL Database Server"
  description = "Enable log_duration on PostgreSQL Servers."
  query       = query.postgres_db_server_log_duration_on

  tags = merge(local.regulatory_compliance_postgres_common_tags, {
    rbi_itf_nbfc_v2016 = "true"
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "postgres_db_server_log_retention_days_3" {
  title       = "Ensure server parameter 'log_retention_days' is greater than 3 days for PostgreSQL Database Server"
  description = "Enable log_retention_days on PostgreSQL Servers."
  query       = query.postgres_db_server_log_retention_days_3

  tags = local.regulatory_compliance_postgres_common_tags
}

control "postgres_db_server_allow_access_to_azure_services_disabled" {
  title       = "Ensure 'Allow access to Azure services' for PostgreSQL Database Server is disabled"
  description = "Disable access from Azure services to PostgreSQL Database Server."
  query       = query.postgres_db_server_allow_access_to_azure_services_disabled

  tags = local.regulatory_compliance_postgres_common_tags
}

query "postgres_db_server_geo_redundant_backup_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when geo_redundant_backup = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when geo_redundant_backup = 'Enabled' then name || ' Geo-redundant backup enabled.'
        else name || ' Geo-redundant backup disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_sql_ssl_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when ssl_enforcement = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when ssl_enforcement = 'Disabled' then name || ' SSL connection disabled.'
        else name || ' SSL connection enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgresql_server_public_network_access_disabled" {
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
      azure_postgresql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgresql_server_infrastructure_encryption_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when infrastructure_encryption = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when infrastructure_encryption = 'Enabled' then name || ' infrastructure encryption enabled.'
        else name || ' infrastructure encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_server_private_link_used" {
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
      azure_postgresql_server a,
      azure_subscription sub;
  EOQ
}

query "postgres_sql_server_encrypted_at_rest_using_cmk" {
  sql = <<-EOQ
    with pgql_server_encrypted as (
      select
        distinct i.id as id
      from
        azure_mysql_server as i,
        jsonb_array_elements(server_keys) a
        where
          a ->> 'serverKeyType' = 'AzureKeyVault'
          and a ->> 'uri' is not null
    )
    select
      s.id as resource,
      case
        when a.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.id is not null then s.title || ' encrypted with CMK.'
        else s.title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server as s
      left join pgql_server_encrypted as a on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_connection_throttling_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then s.name || ' server parameter connection_throttling off.'
        else s.name || ' server parameter connection_throttling on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'connection_throttling'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_log_checkpoints_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then s.name || ' server parameter log_checkpoints off.'
        else s.name || ' server parameter log_checkpoints on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'log_checkpoints'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_log_connections_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then s.name || ' server parameter log_connections off.'
        else s.name || ' server parameter log_connections on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'log_connections'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_log_disconnections_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then name || ' server parameter log_disconnections off.'
        else name || ' server parameter log_disconnections on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'log_disconnections'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_log_duration_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then name || ' server parameter log_duration off.'
        else name || ' server parameter log_duration on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'log_duration'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_log_retention_days_3" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then 'alarm'
        else 'ok'
      end as status,
      case
        when (config -> 'ConfigurationProperties' ->> 'value')::integer <= 3 then s.name || ' log files are retained for 3 days or lesser.'
        else s.name || ' log files are retained for more than 3 days.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server s,
      jsonb_array_elements(server_configurations) as config,
      azure_subscription sub
    where
      config ->> 'Name' = 'log_retention_days'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_allow_access_to_azure_services_disabled" {
  sql = <<-EOQ
    with postgres_db_with_allow_access_to_azure_services as (
      select
        id
      from
        azure_postgresql_server,
        jsonb_array_elements(firewall_rules) as r
      where
        r -> 'FirewallRuleProperties' ->> 'endIpAddress' = '0.0.0.0'
        and r -> 'FirewallRuleProperties' ->> 'startIpAddress' = '0.0.0.0'
    )
    select
      s.id as resource,
      case
        when a.id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when a.id is not null then s.title || ' does not restrict access to azure services.'
        else s.title || ' restricts access to azure services.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server as s
      left join postgres_db_with_allow_access_to_azure_services as a on a.id = s.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "postgres_db_server_latest_tls_version" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when minimal_tls_version = 'TLS1_2' then 'ok'
        else 'alarm'
      end as status,
      case
        when minimal_tls_version = 'TLS1_2' then name || ' uses the latest version of TLS encryption.'
        else name || ' does not use the latest version of TLS encryption.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_postgresql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
