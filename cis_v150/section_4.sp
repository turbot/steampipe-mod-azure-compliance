locals {
  cis_v150_4_common_tags = merge(local.cis_v150_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_v150_4_1_common_tags = merge(local.cis_v150_4_common_tags, {
    cis_section_id = "4.1"
  })
  cis_v150_4_2_common_tags = merge(local.cis_v150_4_common_tags, {
    cis_section_id = "4.2"
  })
  cis_v150_4_3_common_tags = merge(local.cis_v150_4_common_tags, {
    cis_section_id = "4.3"
  })
  cis_v150_4_4_common_tags = merge(local.cis_v150_4_common_tags, {
    cis_section_id = "4.4"
  })
  cis_v150_4_5_common_tags = merge(local.cis_v150_4_common_tags, {
    cis_section_id = "4.5"
  })
}

benchmark "cis_v150_4" {
  title         = "4 Database Services"
  documentation = file("./cis_v150/docs/cis_v150_4.md")
  children = [
    benchmark.cis_v150_4_1,
    benchmark.cis_v150_4_2,
    benchmark.cis_v150_4_3,
    benchmark.cis_v150_4_4,
    benchmark.cis_v150_4_5
  ]

  tags = merge(local.cis_v150_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v150_4_1" {
  title         = "4.1 SQL Server - Auditing"
  documentation = file("./cis_v150/docs/cis_v150_4_1.md")
  children = [
    control.cis_v150_4_1_1,
    control.cis_v150_4_1_2,
    control.cis_v150_4_1_3,
    control.cis_v150_4_1_4,
    control.cis_v150_4_1_5,
    control.cis_v150_4_1_6
  ]

  tags = merge(local.cis_v150_4_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v150_4_1_1" {
  title         = "4.1.1 Ensure that 'Auditing' is set to 'On'"
  description   = "Enable auditing on SQL Servers."
  query         = query.sql_server_auditing_on
  documentation = file("./cis_v150/docs/cis_v150_4_1_1.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_1_2" {
  title         = "4.1.2 Ensure no Azure SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)"
  description   = "Ensure that no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)."
  query         = query.sql_database_allow_internet_access
  documentation = file("./cis_v150/docs/cis_v150_4_1_2.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_1_3" {
  title         = "4.1.3 Ensure SQL server's Transparent Data Encryption (TDE) protector is encrypted with Customer-managed key"
  description   = "Transparent Data Encryption (TDE) with Customer-managed key support provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties."
  query         = query.sql_server_tde_protector_cmk_encrypted
  documentation = file("./cis_v150/docs/cis_v150_4_1_3.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_1_4" {
  title         = "4.1.4 Ensure that Azure Active Directory Admin is Configured for SQL Servers"
  description   = "Use Azure Active Directory Authentication for authentication with SQL Database to manage credentials in a single place."
  query         = query.sql_db_active_directory_admin_configured
  documentation = file("./cis_v150/docs/cis_v150_4_1_4.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_1_5" {
  title         = "4.1.5 Ensure that 'Data encryption' is set to 'On' on a SQL Database"
  description   = "Enable Transparent Data Encryption on every SQL server."
  query         = query.sql_server_transparent_data_encryption_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_1_5.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_1_6" {
  title         = "4.1.6 Ensure that 'Auditing' Retention is 'greater than 90 days'"
  description   = "SQL Server Audit Retention should be configured to be greater than 90 days."
  query         = query.sql_server_auditing_retention_period_90
  documentation = file("./cis_v150/docs/cis_v150_4_1_6.md")

  tags = merge(local.cis_v150_4_1_common_tags, {
    cis_item_id = "4.1.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

benchmark "cis_v150_4_2" {
  title         = "4.2 SQL Server - Microsoft Defender for SQL"
  documentation = file("./cis_v150/docs/cis_v150_4_2.md")
  children = [
    control.cis_v150_4_2_1,
    control.cis_v150_4_2_2,
    control.cis_v150_4_2_3,
    control.cis_v150_4_2_4,
    control.cis_v150_4_2_5
  ]

  tags = merge(local.cis_v150_4_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v150_4_2_1" {
  title         = "4.2.1 Ensure that Microsoft Defender for SQL is set to 'On' for critical SQL Servers"
  description   = "Enable \"Azure Defender for SQL\" on critical SQL Servers."
  query         = query.sql_server_atp_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_2_1.md")

  tags = merge(local.cis_v150_4_2_common_tags, {
    "cis_item_id" = "4.2.1"
    "cis_level"   = "2"
    "cis_type"    = "automated"
    service       = "Azure/SQL"
  })
}

control "cis_v150_4_2_2" {
  title         = "4.2.2 Ensure that Vulnerability Assessment (VA) is enabled on a SQL server by setting a Storage Account"
  description   = "Enable Vulnerability Assessment (VA) service scans for critical SQL servers and corresponding SQL databases."
  query         = query.sql_server_and_databases_va_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_2_2.md")

  tags = merge(local.cis_v150_4_2_common_tags, {
    cis_item_id = "4.2.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_2_3" {
  title         = "4.2.3 Ensure that Vulnerability Assessment (VA) setting 'Periodic recurring scans' is set to 'on' for each SQL server"
  description   = "Enable Vulnerability Assessment (VA) Periodic recurring scans for critical SQL servers and corresponding SQL databases."
  query         = query.sql_server_va_setting_periodic_scan_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_2_3.md")

  tags = merge(local.cis_v150_4_2_common_tags, {
    cis_item_id = "4.2.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_2_4" {
  title         = "4.2.4 Ensure that Vulnerability Assessment (VA) setting 'Send scan reports to' is configured for a SQL server"
  description   = "Configure 'Send scan reports to' with email ids of concerned data owners/stakeholders for a critical SQL servers."
  query         = query.sql_server_va_setting_scan_reports_configured
  documentation = file("./cis_v150/docs/cis_v150_4_2_4.md")

  tags = merge(local.cis_v150_4_2_common_tags, {
    cis_item_id = "4.2.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_2_5" {
  title         = "4.2.5 Ensure that Vulnerability Assessment (VA) setting 'Also send email notifications to admins and subscription owners' is set for each SQL Server"
  description   = "Enable Vulnerability Assessment (VA) setting 'Also send email notifications to admins and subscription owners'."
  query         = query.sql_server_va_setting_reports_notify_admins
  documentation = file("./cis_v150/docs/cis_v150_4_2_5.md")

  tags = merge(local.cis_v150_4_2_common_tags, {
    cis_item_id = "4.2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

benchmark "cis_v150_4_3" {
  title         = "4.3 PostgreSQL Database Server"
  documentation = file("./cis_v150/docs/cis_v150_4_3.md")
  children = [
    control.cis_v150_4_3_1,
    control.cis_v150_4_3_2,
    control.cis_v150_4_3_3,
    control.cis_v150_4_3_4,
    control.cis_v150_4_3_5,
    control.cis_v150_4_3_6,
    control.cis_v150_4_3_7,
    control.cis_v150_4_3_8
  ]

  tags = merge(local.cis_v150_4_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v150_4_3_1" {
  title         = "4.3.1 Ensure 'Enforce SSL connection' is set to 'ENABLED' for PostgreSQL Database Server"
  description   = "Enable SSL connection on PostgreSQL Servers."
  query         = query.postgres_sql_ssl_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_3_1.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_2" {
  title         = "4.3.2 Ensure Server Parameter 'log_checkpoints' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable log_checkpoints on PostgreSQL Servers."
  query         = query.postgres_db_server_log_checkpoints_on
  documentation = file("./cis_v150/docs/cis_v150_4_3_2.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_3" {
  title         = "4.3.3 Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable log_connections on PostgreSQL Servers."
  query         = query.postgres_db_server_log_connections_on
  documentation = file("./cis_v150/docs/cis_v150_4_3_3.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_4" {
  title         = "4.3.4 Ensure server parameter 'log_disconnections' is set to 'ON' for PostgreSQL Database Server "
  description   = "Enable log_disconnections on PostgreSQL Servers."
  query         = query.postgres_db_server_log_disconnections_on
  documentation = file("./cis_v150/docs/cis_v150_4_3_4.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_5" {
  title         = "4.3.5 Ensure server parameter 'connection_throttling' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable connection_throttling on PostgreSQL Servers."
  query         = query.postgres_db_server_connection_throttling_on
  documentation = file("./cis_v150/docs/cis_v150_4_3_5.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_6" {
  title         = "4.3.6 Ensure Server Parameter 'log_retention_days' is greater than 3 days for PostgreSQL Database Server "
  description   = "Enable log_retention_days on PostgreSQL Servers."
  query         = query.postgres_db_server_log_retention_days_3
  documentation = file("./cis_v150/docs/cis_v150_4_3_6.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_7" {
  title         = "4.3.7 Ensure 'Allow access to Azure services' for PostgreSQL Database Server is disabled"
  description   = "Disable access from Azure services to PostgreSQL Database Server."
  query         = query.manual_control
  documentation = file("./cis_v150/docs/cis_v150_4_3_7.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v150_4_3_8" {
  title         = "4.3.8 Ensure 'Infrastructure double encryption' for PostgreSQL Database Server is 'Enabled'"
  description   = "Enable encryption at rest for PostgreSQL Databases."
  query         = query.postgresql_server_infrastructure_encryption_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_3_8.md")

  tags = merge(local.cis_v150_4_3_common_tags, {
    cis_item_id = "4.3.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

benchmark "cis_v150_4_4" {
  title         = "4.4 MySQL Database"
  documentation = file("./cis_v150/docs/cis_v150_4_4.md")
  children = [
    control.cis_v150_4_4_1,
    control.cis_v150_4_4_2,
    control.cis_v150_4_4_3,
    control.cis_v150_4_4_4
  ]

  tags = merge(local.cis_v150_4_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v150_4_4_1" {
  title         = "4.4.1 Ensure 'Enforce SSL connection' is set to 'Enabled' for Standard MySQL Database Server"
  description   = "Enable SSL connection on MySQL Servers."
  query         = query.mysql_ssl_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_4_1.md")

  tags = merge(local.cis_v150_4_4_common_tags, {
    cis_item_id = "4.4.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v150_4_4_2" {
  title         = "4.4.2 Ensure 'TLS Version' is set to 'TLSV1.2' for MySQL flexible Database Server"
  description   = "Ensure TLS version on MySQL flexible servers is set to the default value."
  query         = query.mysql_server_min_tls_1_2
  documentation = file("./cis_v150/docs/cis_v150_4_4_2.md")

  tags = merge(local.cis_v150_4_4_common_tags, {
    cis_item_id = "4.4.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v150_4_4_3" {
  title         = "4.4.3 Ensure server parameter 'audit_log_enabled' is set to 'ON' for MySQL Database Server"
  description   = "Enable audit_log_enabled on MySQL Servers."
  query         = query.mysql_server_audit_logging_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_4_3.md")

  tags = merge(local.cis_v150_4_4_common_tags, {
    cis_item_id = "4.4.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/MySQL"
  })
}

control "cis_v150_4_4_4" {
  title         = "4.4.4 Ensure server parameter 'audit_log_events' has 'CONNECTION' set for MySQL Database Server"
  description   = "Set audit_log_enabled to include CONNECTION on MySQL Servers."
  query         = query.mysql_server_audit_logging_events_connection_set
  documentation = file("./cis_v150/docs/cis_v150_4_4_4.md")

  tags = merge(local.cis_v150_4_4_common_tags, {
    cis_item_id = "4.4.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/MySQL"
  })
}

benchmark "cis_v150_4_5" {
  title         = "4.5 Cosmos DB"
  documentation = file("./cis_v150/docs/cis_v150_4_5.md")
  children = [
    control.cis_v150_4_5_1,
    control.cis_v150_4_5_2
  ]

  tags = merge(local.cis_v150_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v150_4_5_1" {
  title         = "4.5.1 Ensure That 'Firewalls & Networks' Is Limited to Use Selected Networks Instead of All Networks"
  query         = query.cosmosdb_account_virtual_network_filter_enabled
  documentation = file("./cis_v150/docs/cis_v150_4_5_1.md")

  tags = merge(local.cis_v150_4_5_common_tags, {
    cis_item_id = "4.5.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SQL"
  })
}

control "cis_v150_4_5_2" {
  title         = "4.5.2 Ensure That Private Endpoints Are Used Where Possible"
  description   = "Based on business needs or criticality of data/databases hosted a SQL server, it is recommended that the TDE protector is encrypted by a key that is managed by the data owner (Customer-managed key)."
  query         = query.cosmosdb_account_uses_private_link
  documentation = file("./cis_v150/docs/cis_v150_4_5_2.md")

  tags = merge(local.cis_v150_4_5_common_tags, {
    cis_item_id = "4.5.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SQL"
  })
}
