locals {
  conformance_pack_sql_common_tags = {
    service = "sql"
  }
}

control "sql_server_and_databases_va_enabled" {
  title       = "SQL databases should have vulnerability findings resolved"
  description = "Monitor vulnerability assessment scan results and recommendations for how to remediate database vulnerabilities."
  sql         = query.sql_server_and_databases_va_enabled.sql

  tags = merge(local.conformance_pack_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_server_transparent_data_encryption_enabled" {
  title       = "Transparent Data Encryption on SQL databases should be enabled"
  description = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements."
  sql         = query.sql_server_transparent_data_encryption_enabled.sql

  tags = merge(local.conformance_pack_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_server_auditing_on" {
  title       = "Auditing on SQL server should be enabled"
  description = "Auditing on your SQL Server should be enabled to track database activities across all databases on the server and save them in an audit log."
  sql         = query.sql_server_auditing_on.sql

  tags = merge(local.conformance_pack_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

