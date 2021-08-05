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

control "sql_server_use_virtual_service_endpoint" {
  title       = "SQL Server should use a virtual network service endpoint"
  description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
  sql         = query.sql_server_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_server_tde_protector_cmk_encrypted" {
  title       = "SQL servers should use customer-managed keys to encrypt data at rest"
  description = "Implementing Transparent Data Encryption (TDE) with your own key provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
  sql         = query.sql_server_tde_protector_cmk_encrypted.sql

  tags = merge(local.conformance_pack_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}
