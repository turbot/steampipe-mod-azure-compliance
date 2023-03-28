locals {
  regulatory_compliance_sql_common_tags = {
    service = "Azure/SQL"
  }
}

control "sql_server_and_databases_va_enabled" {
  title       = "Vulnerability assessment should be enabled on your SQL servers"
  description = "Audit Azure SQL servers which do not have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  query       = query.sql_server_and_databases_va_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_server_transparent_data_encryption_enabled" {
  title       = "Transparent Data Encryption on SQL databases should be enabled"
  description = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements."
  query       = query.sql_server_transparent_data_encryption_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_server_auditing_on" {
  title       = "Auditing on SQL server should be enabled"
  description = "Auditing on your SQL Server should be enabled to track database activities across all databases on the server and save them in an audit log."
  query       = query.sql_server_auditing_on

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "sql_server_use_virtual_service_endpoint" {
  title       = "SQL Server should use a virtual network service endpoint"
  description = "This policy audits any SQL Server not configured to use a virtual network service endpoint."
  query       = query.sql_server_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_server_tde_protector_cmk_encrypted" {
  title       = "SQL servers should use customer-managed keys to encrypt data at rest"
  description = "Implementing Transparent Data Encryption (TDE) with your own key provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
  query       = query.sql_server_tde_protector_cmk_encrypted

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "sql_database_long_term_geo_redundant_backup_enabled" {
  title       = "Long-term geo-redundant backup should be enabled for Azure SQL Databases"
  description = "This policy audits any Azure SQL Database with long-term geo-redundant backup not enabled."
  query       = query.sql_database_long_term_geo_redundant_backup_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_database_vulnerability_findings_resolved" {
  title       = "SQL databases should have vulnerability findings resolved"
  description = "Monitor vulnerability assessment scan results and recommendations for how to remediate database vulnerabilities."
  query       = query.sql_database_vulnerability_findings_resolved

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "sql_database_server_azure_defender_enabled" {
  title       = "Azure Defender for Azure SQL Database servers should be enabled"
  description = "Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data."
  query       = query.sql_database_server_azure_defender_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_database_transparent_data_encryption_enabled" {
  title       = "Azure Defender for Azure SQL Database servers should be enabled"
  description = "Transparent data encryption should be enabled to protect data-at-rest and meet compliance requirements."
  query       = query.sql_database_transparent_data_encryption_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "sql_server_vm_azure_defender_enabled" {
  title       = "Azure Defender for SQL servers on machines should be enabled"
  description = "Azure Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data."
  query       = query.sql_server_vm_azure_defender_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_server_azure_defender_enabled" {
  title       = "Azure Defender for SQL should be enabled for unprotected Azure SQL servers"
  description = "Audit SQL servers without Advanced Data Security."
  query       = query.sql_server_azure_defender_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_server_azure_ad_authentication_enabled" {
  title       = "An Azure Active Directory administrator should be provisioned for SQL servers"
  description = "Audit provisioning of an Azure Active Directory administrator for your SQL server to enable Azure AD authentication. Azure AD authentication enables simplified permission management and centralized identity management of database users and other Microsoft services."
  query       = query.sql_server_azure_ad_authentication_enabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "sql_db_public_network_access_disabled" {
  title       = "Public network access on Azure SQL Database should be disabled"
  description = "Disabling the public network access property improves security by ensuring your Azure SQL Database can only be accessed from a private endpoint. This configuration denies all logins that match IP or virtual network based firewall rules."
  query       = query.sql_db_public_network_access_disabled

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_server_uses_private_link" {
  title       = "Private endpoint connections on Azure SQL Database should be enabled"
  description = "Private endpoint connections enforce secure communication by enabling private connectivity to Azure SQL Database."
  query       = query.sql_server_uses_private_link

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "sql_server_auditing_storage_account_destination_retention_90_days" {
  title       = "SQL servers with auditing to storage account destination should be configured with 90 days retention or higher"
  description = "For incident investigation purposes, we recommend setting the data retention for your SQL Server' auditing to storage account destination to at least 90 days. Confirm that you are meeting the necessary retention rules for the regions in which you are operating. This is sometimes required for compliance with regulatory standards."
  query       = query.sql_server_auditing_storage_account_destination_retention_90_days

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

query "sql_server_and_databases_va_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when security -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when security -> 'properties' ->> 'state' = 'Disabled' then s.name || ' VA setting disabled.'
        else s.name || ' VA setting enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      jsonb_array_elements(server_security_alert_policy) security,
      jsonb_array_elements(server_vulnerability_assessment) assessment,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_server_transparent_data_encryption_enabled" {
  sql = <<-EOQ
    select
      db.id as resource,
      case
        when transparent_data_encryption ->> 'status' = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when transparent_data_encryption ->> 'status' = 'Disabled' then db.name || ' transparent data encryption off.'
        else db.name || ' transparent data encryption on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "db.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_database db,
      azure_subscription sub
    where
      sub.subscription_id = db.subscription_id;
  EOQ
}

query "sql_server_auditing_on" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when audit -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when audit -> 'properties' ->> 'state' = 'Disabled' then name || ' auditing disabled.'
        else name || ' auditing enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      jsonb_array_elements(server_audit_policy) audit,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_server_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with sql_server_subnet as (
      select
        distinct a.name,
        rule -> 'properties' -> 'virtualNetworkSubnetId' as subnet_id
      from
        azure_sql_server as a,
        jsonb_array_elements(virtual_network_rules) as rule
    )
    select
      distinct a.name as resource,
      case
        when s.name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when s.name is null then a.name || ' not configured with virtual service endpoint.'
        else a.name || ' configured with virtual service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}      
    from
      azure_sql_server as a
      left join sql_server_subnet as s on a.name = s.name,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_server_tde_protector_cmk_encrypted" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when encryption ->> 'kind' = 'servicemanaged' then 'alarm'
        else 'ok'
      end as status,
      case
        when encryption ->> 'kind' = 'servicemanaged' then s.name || ' TDE protector not encrypted with CMK.'
        else s.name || ' TDE protector encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}      
    from
      azure_sql_server s,
      jsonb_array_elements(encryption_protector) encryption,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}