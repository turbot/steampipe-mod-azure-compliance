locals {
  cis_v140_4_common_tags = merge(local.cis_v140_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_v140_4_1_common_tags = merge(local.cis_v140_4_common_tags, {
    cis_section_id = "4.1"
  })
  cis_v140_4_2_common_tags = merge(local.cis_v140_4_common_tags, {
    cis_section_id = "4.2"
  })
  cis_v140_4_3_common_tags = merge(local.cis_v140_4_common_tags, {
    cis_section_id = "4.3"
  })
  cis_v140_4_4_common_tags = merge(local.cis_v140_4_common_tags, {
    cis_section_id = "4.4"
  })
}


benchmark "cis_v140_4" {
  title         = "4 Database Services"
  documentation = file("./cis_v140/docs/cis_v140_4.md")
  children = [
    benchmark.cis_v140_4_1,
    benchmark.cis_v140_4_2,
    benchmark.cis_v140_4_3,
    benchmark.cis_v140_4_4,
    control.cis_v140_4_5,
    control.cis_v140_4_6,
  ]

  tags = merge(local.cis_v140_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v140_4_1" {
  title         = "4.1 SQL Server - Auditing"
  documentation = file("./cis_v140/docs/cis_v140_4_1.md")
  children = [
    control.cis_v140_4_1_1,
    control.cis_v140_4_1_2,
    control.cis_v140_4_1_3,
  ]

  tags = merge(local.cis_v140_4_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

benchmark "cis_v140_4_2" {
  title         = "4.2 SQL Server - Azure Defender for SQL"
  documentation = file("./cis_v140/docs/cis_v140_4_2.md")
  children = [
    control.cis_v140_4_2_1,
    control.cis_v140_4_2_2,
    control.cis_v140_4_2_3,
    control.cis_v140_4_2_4,
    control.cis_v140_4_2_5
  ]

  tags = merge(local.cis_v140_4_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

benchmark "cis_v140_4_3" {
  title         = "4.3 PostgreSQL Database Server"
  documentation = file("./cis_v140/docs/cis_v140_4_3.md")
  children = [
    control.cis_v140_4_3_1,
    control.cis_v140_4_3_2,
    control.cis_v140_4_3_3,
    control.cis_v140_4_3_4,
    control.cis_v140_4_3_5,
    control.cis_v140_4_3_6,
    control.cis_v140_4_3_7,
    control.cis_v140_4_3_8
  ]

  tags = merge(local.cis_v140_4_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v140_4_1_1" {
  title         = "4.1.1 Ensure that 'Auditing' is set to 'On'"
  description   = "Enable auditing on SQL Servers."
  sql           = query.sql_server_auditing_on.sql
  documentation = file("./cis_v140/docs/cis_v140_4_1_1.md")

  tags = merge(local.cis_v140_4_1_common_tags, {
    cis_item_id = "4.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_1_2" {
  title         = "4.1.2 Ensure that 'Data encryption' is set to 'On' on a SQL Database"
  sql           = query.sql_server_transparent_data_encryption_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_1_2.md")

  tags = merge(local.cis_v140_4_1_common_tags, {
    cis_item_id = "4.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_1_3" {
  title         = "4.1.3 Ensure that 'Auditing' Retention is 'greater than 90 days'"
  description   = "SQL Server Audit Retention should be configured to be greater than 90 days."
  sql           = query.sql_server_auditing_retention_period_90.sql
  documentation = file("./cis_v140/docs/cis_v140_4_1_3.md")

  tags = merge(local.cis_v140_4_1_common_tags, {
    cis_item_id = "4.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_2_1" {
  title         = "4.2.1 Ensure that Advanced Threat Protection (ATP) on a SQL server is set to 'Enabled'"
  description   = "Enable \"Azure Defender for SQL\" on critical SQL Servers."
  sql           = query.sql_server_atp_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_2_1.md")

  tags = merge(local.cis_v140_4_2_common_tags, {
    "cis_item_id" = "4.2.1"
    "cis_level"   = "2"
    "cis_type"    = "automated"
    service       = "Azure/SQL"
  })
}

control "cis_v140_4_2_2" {
  title         = "4.2.2 Ensure that Vulnerability Assessment (VA) is enabled on a SQL server by setting a Storage Account"
  description   = "Enable Vulnerability Assessment (VA) service scans for critical SQL servers and corresponding SQL databases."
  sql           = query.sql_server_and_databases_va_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_2_2.md")

  tags = merge(local.cis_v140_4_2_common_tags, {
    cis_item_id = "4.2.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_2_3" {
  title         = "4.2.3 Ensure that VA setting Periodic Recurring Scans is enabled on a SQL server"
  description   = "Enable Vulnerability Assessment (VA) Periodic recurring scans for critical SQL servers and corresponding SQL databases."
  sql           = query.sql_server_va_setting_periodic_scan_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_2_3.md")

  tags = merge(local.cis_v140_4_2_common_tags, {
    cis_item_id = "4.2.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_2_4" {
  title         = "4.2.4 Ensure that VA setting 'Send scan reports to' is configured for a SQL server"
  description   = "Configure 'Send scan reports to' with email ids of concerned data owners/stakeholders for a critical SQL servers."
  sql           = query.sql_server_va_setting_scan_reports_configured.sql
  documentation = file("./cis_v140/docs/cis_v140_4_2_4.md")

  tags = merge(local.cis_v140_4_2_common_tags, {
    cis_item_id = "4.2.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_2_5" {
  title         = "4.2.5 Ensure that Vulnerability Assessment (VA) setting 'Also send email notifications to admins and subscription owners' is set for each SQL server"
  description   = "Enable Vulnerability Assessment (VA) setting 'Also send email notifications to admins and subscription owners'."
  sql           = query.sql_server_va_setting_reports_notify_admins.sql
  documentation = file("./cis_v140/docs/cis_v140_4_2_5.md")

  tags = merge(local.cis_v140_4_2_common_tags, {
    cis_item_id = "4.2.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_3_1" {
  title         = "4.3.1 Ensure 'Enforce SSL connection' is set to 'ENABLED' for PostgreSQL Database Server"
  description   = "Enable SSL connection on PostgreSQL Servers."
  sql           = query.postgres_sql_ssl_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_1.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_2" {
  title         = "4.3.2 Ensure server parameter 'log_checkpoints' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable log_checkpoints on PostgreSQL Servers."
  sql           = query.postgres_db_server_log_checkpoints_on.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_2.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_3" {
  title         = "4.3.3 Ensure server parameter 'log_connections' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable log_connections on PostgreSQL Servers."
  sql           = query.postgres_db_server_log_connections_on.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_3.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_4" {
  title         = "4.3.4 Ensure server parameter 'log_disconnections' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable log_disconnections on PostgreSQL Servers."
  sql           = query.postgres_db_server_log_disconnections_on.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_4.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_5" {
  title         = "4.3.5 Ensure server parameter 'connection_throttling' is set to 'ON' for PostgreSQL Database Server"
  description   = "Enable connection_throttling on PostgreSQL Servers."
  sql           = query.postgres_db_server_connection_throttling_on.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_5.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_6" {
  title         = "4.3.6 Ensure server parameter 'log_retention_days' is greater than 3 days for PostgreSQL Database Server"
  description   = "Enable log_retention_days on PostgreSQL Servers."
  sql           = query.postgres_db_server_log_retention_days_3.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_6.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_7" {
  title         = "4.3.7 Ensure 'Allow access to Azure services' for PostgreSQL Database Server is disabled"
  description   = "Disable access from Azure services to PostgreSQL Database Server."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_7.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/PostgreSQL"
  })
}

control "cis_v140_4_3_8" {
  title         = "4.3.8 Ensure 'Infrastructure double encryption' for PostgreSQL Database Server is 'Enabled'"
  description   = "Enable encryption at rest for PostgreSQL Databases."
  sql           = query.postgresql_server_infrastructure_encryption_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_3_8.md")

  tags = merge(local.cis_v140_4_3_common_tags, {
    cis_item_id = "4.3.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/PostgreSQL"
  })
}

benchmark "cis_v140_4_4" {
  title         = "4.1 MySQL Database"
  documentation = file("./cis_v140/docs/cis_v140_4_4.md")
  children = [
    control.cis_v140_4_4_1,
    control.cis_v140_4_4_2
  ]

  tags = merge(local.cis_v140_4_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/SQL"
  })
}

control "cis_v140_4_4_1" {
  title         = "4.4.1 Ensure 'Enforce SSL connection' is set to 'ENABLED' for MySQL Database Server"
  description   = "Enable SSL connection on MYSQL Servers."
  sql           = query.mysql_ssl_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_4_4_1.md")

  tags = merge(local.cis_v140_4_4_common_tags, {
    cis_item_id = "4.4.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v140_4_4_2" {
  title         = "4.4.2 Ensure 'TLS Version' is set to 'TLSV1.2' for MySQL flexible Database Server"
  description   = "Ensure TLS version on MySQL flexible servers is set to the default value."
  sql           = query.mysql_server_min_tls_1_2.sql
  documentation = file("./cis_v140/docs/cis_v140_4_4_2.md")

  tags = merge(local.cis_v140_4_4_common_tags, {
    cis_item_id = "4.4.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/MySQL"
  })
}

control "cis_v140_4_5" {
  title         = "4.5 Ensure that Azure Active Directory Admin is configured"
  description   = "Use Azure Active Directory Authentication for authentication with SQL Database."
  sql           = query.sql_db_active_directory_admin_configured.sql
  documentation = file("./cis_v140/docs/cis_v140_4_5.md")

  tags = merge(local.cis_v140_4_common_tags, {
    cis_item_id = "4.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}

control "cis_v140_4_6" {
  title         = "4.6 Ensure SQL server's TDE protector is encrypted with Customer-managed key"
  description   = "Based on business needs or criticality of data/databases hosted a SQL server, it is recommended that the TDE protector is encrypted by a key that is managed by the data owner (Customer-managed key)"
  sql           = query.sql_server_tde_protector_cmk_encrypted.sql
  documentation = file("./cis_v140/docs/cis_v140_4_6.md")

  tags = merge(local.cis_v140_4_common_tags, {
    cis_item_id = "4.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SQL"
  })
}
