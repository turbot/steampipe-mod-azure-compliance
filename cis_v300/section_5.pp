locals {
  cis_v300_5_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_v300_5_1_common_tags = merge(local.cis_v300_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v300_5_2_common_tags = merge(local.cis_v300_5_common_tags, {
    cis_section_id = "5.2"
  })
  cis_v300_5_3_common_tags = merge(local.cis_v300_5_common_tags, {
    cis_section_id = "5.3"
  })
  cis_v300_5_4_common_tags = merge(local.cis_v300_5_common_tags, {
    cis_section_id = "5.4"
  })
}

benchmark "cis_v300_5" {
  title         = "5 Database Services"
  documentation = file("./cis_v300/docs/cis_v300_5.md")
  children = [
    benchmark.cis_v300_5_1,
    benchmark.cis_v300_5_2,
    benchmark.cis_v300_5_3,
    benchmark.cis_v300_5_4
  ]

  tags = merge(local.cis_v300_5_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v300_5_1" {
  title         = "5.1 SQL Azure SQL Database"
  documentation = file("./cis_v300/docs/cis_v300_5_1.md")
  children = [
    control.cis_v300_5_1_1,
    control.cis_v300_5_1_2,
    control.cis_v300_5_1_3,
    control.cis_v300_5_1_4,
    control.cis_v300_5_1_5,
    control.cis_v300_5_1_6,
    control.cis_v300_5_1_7
  ]

  tags = merge(local.cis_v300_5_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v300_5_1_1" {
  title         = "5.1.1 Ensure that 'Auditing' is set to 'On'"
  description   = "Enable auditing on SQL Servers."
  query         = query.sql_server_auditing_on
  documentation = file("./cis_v300/docs/cis_v300_5_1_1.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_2" {
  title         = "5.1.2 Ensure no Azure SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)"
  description   = "Ensure that no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)."
  query         = query.sql_database_allow_internet_access
  documentation = file("./cis_v300/docs/cis_v300_5_1_2.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_3" {
  title         = "5.1.3 Ensure SQL server's Transparent Data Encryption (TDE) protector is encrypted with Customer-managed key"
  description   = "Transparent Data Encryption (TDE) with Customer-managed key support provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties."
  query         = query.sql_server_tde_protector_cmk_encrypted
  documentation = file("./cis_v300/docs/cis_v300_5_1_3.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_4" {
  title         = "5.1.4 Ensure that Microsoft Entra authentication is Configured for SQL Servers"
  description   = "Use Azure Active Directory Authentication for authentication with SQL Database to manage credentials in a single place."
  query         = query.sql_db_active_directory_admin_configured
  documentation = file("./cis_v300/docs/cis_v300_5_1_4.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_5" {
  title         = "5.1.5 Ensure that 'Data encryption' is set to 'On' on a SQL Database"
  description   = "Enable Transparent Data Encryption on every SQL server."
  query         = query.sql_database_transparent_data_encryption_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_1_5.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_6" {
  title         = "5.1.6 Ensure that 'Auditing' Retention is 'greater than 90 days'"
  description   = "SQL Server Audit Retention should be configured to be greater than 90 days."
  query         = query.sql_server_auditing_retention_period_90
  documentation = file("./cis_v300/docs/cis_v300_5_1_6.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_1_7" {
  title         = "5.1.7 Ensure Public Network Access is Disabled"
  description   = "Disabling public network access restricts the service from accessing public networks."
  query         = query.sql_db_public_network_access_disabled
  documentation = file("./cis_v300/docs/cis_v300_5_1_7.md")

  tags = merge(local.cis_v300_5_1_common_tags, {
    cis_item_id = "5.1.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SQL"
  })
}

benchmark "cis_v300_5_2" {
  title         = "5.2 Azure Database for PostgreSQL"
  documentation = file("./cis_v300/docs/cis_v300_5_2.md")
  children = [
    control.cis_v300_5_2_1,
    control.cis_v300_5_2_2,
    control.cis_v300_5_2_3,
    control.cis_v300_5_2_4,
    control.cis_v300_5_2_5,
    control.cis_v300_5_2_6,
    control.cis_v300_5_2_7,
    control.cis_v300_5_2_8
  ]

  tags = merge(local.cis_v300_5_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v300_5_2_1" {
  title         = "5.2.1 Ensure server parameter 'require_secure_transport' is set to 'ON' for PostgreSQL flexible server"
  description   = "Enable 'require_secure_transport' on 'PostgreSQL flexible servers'."
  query         = query.postgres_sql_flexible_server_ssl_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_2_1.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_2" {
  title         = "5.2.2 Ensure server parameter 'log_checkpoints' is set to 'ON' for PostgreSQL flexible Server"
  description   = "Enable 'log_checkpoints' on 'PostgreSQL Servers'."
  query         = query.postgres_flexible_server_log_checkpoints_on
  documentation = file("./cis_v300/docs/cis_v300_5_2_2.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_3" {
  title         = "5.2.3 Ensure server parameter 'connection_throttle.enable' is set to 'ON' for PostgreSQL flexible Server"
  description   = "Enable connection_throttling on PostgreSQL flexible Servers."
  query         = query.postgres_flexible_server_connection_throttling_on
  documentation = file("./cis_v300/docs/cis_v300_5_2_3.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_4" {
  title         = "5.2.4 Ensure Server Parameter 'logfiles.retention_days' is greater than 3 days for PostgreSQL flexible Server"
  description   = "Ensure logfiles.retention_days on PostgreSQL flexible Servers is set to an appropriate value."
  query         = query.postgres_flexible_server_log_retention_days_3
  documentation = file("./cis_v300/docs/cis_v300_5_2_4.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_5" {
  title         = "5.2.5 Ensure 'Allow public access from any Azure service within Azure to this server' for PostgreSQL flexible server is disabled"
  description   = "Disable access from Azure services to PostgreSQL flexible server."
  query         = query.postgres_flexible_server_allow_access_to_azure_services_disabled
  documentation = file("./cis_v300/docs/cis_v300_5_2_5.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_6" {
  title         = "5.2.6 [LEGACY]Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL single Server"
  description   = "Enable 'log_connections' on 'PostgreSQL single Servers'."
  query         = query.postgres_db_server_log_connections_on
  documentation = file("./cis_v300/docs/cis_v300_5_2_6.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_7" {
  title         = "5.2.7 [LEGACY]Ensure server parameter 'log_disconnections' is set to 'ON' for PostgreSQL single Server"
  description   = "Enable 'log_disconnections' on 'PostgreSQL Servers'."
  query         = query.postgres_db_server_log_disconnections_on
  documentation = file("./cis_v300/docs/cis_v300_5_2_7.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v300_5_2_8" {
  title         = "5.2.8 [LEGACY]Ensure 'Infrastructure double encryption' for PostgreSQL Database Server is 'Enabled'"
  description   = "Azure Database for PostgreSQL servers should be created with 'infrastructure double encryption' enabled."
  query         = query.postgresql_server_infrastructure_encryption_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_2_8.md")

  tags = merge(local.cis_v300_5_2_common_tags, {
    cis_item_id = "5.2.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

benchmark "cis_v300_5_3" {
  title         = "5.3 Azure Database for MySQL"
  documentation = file("./cis_v300/docs/cis_v300_5_3.md")
  children = [
    control.cis_v300_5_3_1,
    control.cis_v300_5_3_2,
    control.cis_v300_5_3_3,
    control.cis_v300_5_3_4
  ]

  tags = merge(local.cis_v300_5_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v300_5_3_1" {
  title         = "5.3.1 Ensure server parameter 'require_secure_transport' is set to 'ON' for MySQL flexible server"
  description   = "Enable require_secure_transport on MySQL flexible servers."
  query         = query.mysql_flexible_server_ssl_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_3_1.md")

  tags = merge(local.cis_v300_5_3_common_tags, {
    cis_item_id = "5.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v300_5_3_2" {
  title         = "5.3.2 Ensure server parameter 'tls_version' is set to 'TLSv1.2' (or higher) for MySQL flexible server"
  description   = "Ensure tls_version on MySQL flexible servers is set to use TLS version 1.2 or higher."
  query         = query.mysql_flexible_server_min_tls_1_2
  documentation = file("./cis_v300/docs/cis_v300_5_3_2.md")

  tags = merge(local.cis_v300_5_3_common_tags, {
    cis_item_id = "5.3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v300_5_3_3" {
  title         = "5.3.3 Ensure server parameter 'audit_log_enabled' is set to 'ON' for MySQL flexible Server"
  description   = "Enable audit_log_enabled on MySQL flexible Servers."
  query         = query.mysql_flexible_server_audit_logging_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_3_3.md")

  tags = merge(local.cis_v300_5_3_common_tags, {
    cis_item_id = "5.3.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v300_5_3_4" {
  title         = "5.3.4 Ensure server parameter 'audit_log_events' has 'CONNECTION' set for MySQL flexible Server"
  description   = "Set audit_log_enabled to include CONNECTION on MySQL flexible servers."
  query         = query.mysql_flexible_server_audit_logging_events_connection_set
  documentation = file("./cis_v300/docs/cis_v300_5_3_4.md")

  tags = merge(local.cis_v300_5_3_common_tags, {
    cis_item_id = "5.3.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/MySQL"
  })
}

benchmark "cis_v300_5_4" {
  title         = "5.4 Azure Cosmos DB"
  documentation = file("./cis_v300/docs/cis_v300_5_4.md")
  children = [
    control.cis_v300_5_4_1,
    control.cis_v300_5_4_2,
    control.cis_v300_5_4_3
  ]

  tags = merge(local.cis_v300_5_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v300_5_4_1" {
  title         = "5.4.1 Ensure That 'Firewalls & Networks' Is Limited to Use Selected Networks Instead of All Networks"
  description   = "Limiting your Cosmos DB to only communicate on whitelisted networks lowers its attack footprint."
  query         = query.cosmosdb_account_virtual_network_filter_enabled
  documentation = file("./cis_v300/docs/cis_v300_5_4_1.md")

  tags = merge(local.cis_v300_5_4_common_tags, {
    cis_item_id = "5.4.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_4_2" {
  title         = "5.4.2 Ensure That Private Endpoints Are Used Where Possible"
  description   = "Private endpoints limit network traffic to approved sources."
  query         = query.cosmosdb_account_uses_private_link
  documentation = file("./cis_v300/docs/cis_v300_5_4_2.md")

  tags = merge(local.cis_v300_5_4_common_tags, {
    cis_item_id = "5.4.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v300_5_4_3" {
  title         = "5.4.3 Use Entra ID Client Authentication and Azure RBAC where possible"
  description   = "Cosmos DB can use tokens or AAD for client authentication which in turn will use Azure RBAC for authorization. Using AAD is significantly more secure because AAD handles the credentials and allows for MFA and centralized management, and the Azure RBAC better integrated with the rest of Azure."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_5_4_3.md")

  tags = merge(local.cis_v300_5_4_common_tags, {
    cis_item_id = "5.4.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SQL"
  })
}
