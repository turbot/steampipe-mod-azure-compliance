locals {
  regulatory_compliance_mysql_common_tags = {
    service = "Azure/MySQL"
  }
}

control "mysql_ssl_enabled" {
  title       = "Enforce SSL connection should be enabled for MySQL database servers"
  description = "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  query       = query.mysql_ssl_enabled

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_db_server_geo_redundant_backup_enabled" {
  title       = "Geo-redundant backup should be enabled for Azure Database for MySQL"
  description = "Azure Database for MySQL allows you to choose the redundancy option for your database server. It can be set to a geo-redundant backup storage in which the data is not only stored within the region in which your server is hosted, but is also replicated to a paired region to provide recovery option in case of a region failure. Configuring geo-redundant storage for backup is only allowed during server create."
  query       = query.mysql_db_server_geo_redundant_backup_enabled

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mssql_managed_instance_encryption_at_rest_using_cmk" {
  title       = "SQL managed instances should use customer-managed keys to encrypt data at rest"
  description = "Implementing Transparent Data Encryption (TDE) with your own key provides you with increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
  query       = query.mssql_managed_instance_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mssql_managed_instance_vulnerability_assessment_enabled" {
  title       = "Vulnerability assessment should be enabled on SQL Managed Instance"
  description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  query       = query.mssql_managed_instance_vulnerability_assessment_enabled

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_public_network_access_disabled" {
  title       = "Public network access should be disabled for MySQL servers"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MySQL can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  query       = query.mysql_server_public_network_access_disabled

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_infrastructure_encryption_enabled" {
  title       = "Infrastructure encryption should be enabled for Azure Database for MySQL servers"
  description = "Enable infrastructure encryption for Azure Database for MySQL servers to have higher level of assurance that the data is secure. When infrastructure encryption is enabled, the data at rest is encrypted twice using FIPS 140-2 compliant Microsoft managed keys."
  query       = query.mysql_server_infrastructure_encryption_enabled

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_private_link_used" {
  title       = "Private endpoint should be enabled for MySQL servers"
  description = "Private endpoint connections enforce secure communication by enabling private connectivity to Azure Database for MySQL. Configure a private endpoint connection to enable access to traffic coming only from known networks and prevent access from all other IP addresses, including within Azure."
  query       = query.mysql_server_private_link_used

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_encrypted_at_rest_using_cmk" {
  title       = "MySQL servers should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.mysql_server_encrypted_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_mysql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "mysql_server_audit_logging_enabled" {
  title       = "Ensure server parameter 'audit_log_enabled' is set to 'ON' for MySQL Database Server"
  description = "Enable audit logging on MySQL Servers."
  query       = query.mysql_server_audit_logging_enabled

  tags = local.regulatory_compliance_mysql_common_tags
}

control "mysql_server_audit_logging_events_connection_set" {
  title       = "Ensure server parameter 'audit_log_events' has 'CONNECTION' set for MySQL Database Server"
  description = "Set audit_log_enabled to include CONNECTION on MySQL Servers."
  query       = query.mysql_server_audit_logging_events_connection_set

  tags = local.regulatory_compliance_mysql_common_tags
}

control "mysql_server_min_tls_1_2" {
  title       = "Ensure 'TLS Version' is set to 'TLSV1.2' for MySQL flexible Database Server"
  description = "Ensure TLS version on MySQL flexible servers is set to the default value."
  query       = query.mysql_server_min_tls_1_2

  tags = local.regulatory_compliance_mysql_common_tags
}

query "mysql_ssl_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when ssl_enforcement = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when ssl_enforcement = 'Disabled' then s.name || ' SSL connection disabled.'
        else s.name || ' SSL connection enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mysql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_db_server_geo_redundant_backup_enabled" {
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
      azure_mysql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mssql_managed_instance_encryption_at_rest_using_cmk" {
  sql = <<-EOQ
    with encryption_protector as (
      select
        distinct i.id as id
      from
        azure_mssql_managed_instance as i,
        jsonb_array_elements(encryption_protectors) a
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
      azure_mssql_managed_instance as s
      left join encryption_protector as a on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mssql_managed_instance_vulnerability_assessment_enabled" {
  sql = <<-EOQ
    with vulnerability_assessments as (
      select
        distinct i.id as id
      from
        azure_mssql_managed_instance as i,
        jsonb_array_elements(vulnerability_assessments) a
      where
        a -> 'recurringScans' ->> 'isEnabled' = 'true'
        and a ->> 'name' = 'Default'
    )
    select
      s.id as resource,
      case
        when a.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.id is not null then s.title || ' vulnerability assessment enabled.'
        else s.title || ' vulnerability assessment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mssql_managed_instance as s
      left join vulnerability_assessments as a on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_public_network_access_disabled" {
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
      azure_mysql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_infrastructure_encryption_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when infrastructure_encryption = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when infrastructure_encryption = 'Enabled' then s.name || ' infrastructure encryption enabled.'
        else s.name || ' infrastructure encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mysql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_private_link_used" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
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
      azure_mysql_server a,
      azure_subscription sub;
  EOQ
}

query "mysql_server_encrypted_at_rest_using_cmk" {
  sql = <<-EOQ
    with mysql_server_encrypted as (
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
      azure_mysql_server as s
      left join mysql_server_encrypted as a on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_audit_logging_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') != 'on' then s.name || ' server parameter audit_log_enabled off.'
        else s.name || ' server parameter audit_log_enabled on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mysql_server as s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'audit_log_enabled'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_audit_logging_events_connection_set" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') = 'connection' then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(config -> 'ConfigurationProperties' ->> 'value') = 'connection' then s.name || ' server parameter audit_log_events has connection set.'
        else s.name || ' server parameter audit_log_events connection not set.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mysql_server as s,
      jsonb_array_elements(server_configurations) config,
      azure_subscription sub
    where
      config ->> 'Name' = 'audit_log_events'
      and sub.subscription_id = s.subscription_id;
  EOQ
}

query "mysql_server_min_tls_1_2" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when minimal_tls_version = 'TLSEnforcementDisabled' then 'alarm'
        when minimal_tls_version = 'TLS1_2' then 'ok'
        else 'alarm'
      end as status,
      case
        when minimal_tls_version = 'TLSEnforcementDisabled' then s.name || ' TLS enforcement is disabled.'
        when minimal_tls_version = 'TLS1_2' then s.name || ' minimum TLS version set to ' || minimal_tls_version || '.'
        else s.name || ' minimum TLS version set to ' || minimal_tls_version || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_mysql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}
