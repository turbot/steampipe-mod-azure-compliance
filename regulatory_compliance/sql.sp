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

query "sql_database_long_term_geo_redundant_backup_enabled" {
  sql = <<-EOQ
    select
      s.database_id resource,
      case
        when retention_policy_property ->> 'monthlyRetention' <> 'PT0S'
          or retention_policy_property ->> 'weeklyRetention' <> 'PT0S'
          or retention_policy_property ->> 'yearlyRetention' <> 'PT0S'
          then 'ok'
          else 'alarm'
      end as status,
      case
        when retention_policy_property ->> 'monthlyRetention' <> 'PT0S'
          or retention_policy_property ->> 'weeklyRetention' <> 'PT0S'
          or retention_policy_property ->> 'yearlyRetention' <> 'PT0S'
          then s.title || ' long-term geo-redundant backup enabled.'
          else s.title || ' long-term geo-redundant backup disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_database s,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id
      and s.name <> 'master';
  EOQ
}

query "sql_database_vulnerability_findings_resolved" {
  sql = <<-EOQ
    with vulnerability_findings as (
      select
        db.id as database_id,
        scan ->> 'endTime' latest_scan_end_time,
        scan ->> 'numberOfFailedSecurityChecks' no_of_failed_sec_checks
      from
        azure_sql_database as db,
        jsonb_array_elements(vulnerability_assessment_scan_records) as scan
      where
        (scan ->> 'numberOfFailedSecurityChecks')::int = 0
      order by scan ->> 'endTime' desc nulls last
      limit 1
    )
    select
      distinct a.id as resource,
      case
        when s.database_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.database_id is not null then a.name || ' vulnerability findings resolved.'
        else a.title || ' vulnerability findings not resolved.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_database as a
      left join vulnerability_findings as s on a.id = s.database_id,
      azure_subscription as sub
    where
      a.name <> 'master'
      and sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_database_server_azure_defender_enabled" {
  sql = <<-EOQ
    select
      pricing.id as resource,
      case
        when name = 'SqlServers' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'SqlServers' and pricing_tier = 'Standard' then 'SqlServers azure defender enabled.'
        else name || 'SqlServers azure defender disabled.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'SqlServers';
  EOQ
}

query "sql_database_transparent_data_encryption_enabled" {
  sql = <<-EOQ
    select
      s.database_id resource,
      case
        when transparent_data_encryption ->> 'status' = 'Enabled' or transparent_data_encryption ->> 'state' = 'Enabled' then 'ok'
          else 'alarm'
      end as status,
      case
        when transparent_data_encryption ->> 'status' = 'Enabled' or transparent_data_encryption ->> 'state' = 'Enabled' then s.title || ' transparent data encryption enabled.'
          else s.title || ' transparent data encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_database as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id
      and s.name <> 'master';
  EOQ
}

query "sql_server_vm_azure_defender_enabled" {
  sql = <<-EOQ
    select
      pricing.id as resource,
      case
        when name = 'SqlServerVirtualMachines' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'SqlServerVirtualMachines' and pricing_tier = 'Standard' then 'SqlServerVirtualMachines azure defender enabled.'
        else name || 'SqlServerVirtualMachines azure defender disabled.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'SqlServerVirtualMachines';
  EOQ
}

query "sql_server_azure_defender_enabled" {
  sql = <<-EOQ
    with sql_server_policy as (
      select
        distinct a.name
      from
        azure_sql_server as a,
        jsonb_array_elements(server_security_alert_policy) as policy
      where
        policy ->> 'name' = 'Default'
        and policy -> 'properties' ->> 'state' = 'Enabled'
    )
    select
      distinct a.name as resource,
      case
        when kind like '%analytics%' then 'skip'
        when s.name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kind like '%analytics%' then a.name || ' azure defender not applicable.'
        when s.name is null then a.name || 'sql azure defender disabled.'
        else a.name || ' sql azure defender enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server as a
      left join sql_server_policy as s on a.name = s.name,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_server_azure_ad_authentication_enabled" {
  sql = <<-EOQ
    with sever_with_ad_admin as (
      select
        distinct a.id
      from
        azure_sql_server as a,
        jsonb_array_elements(server_azure_ad_administrator) as ad_admin
      where
        ad_admin ->> 'type' = 'Microsoft.Sql/servers/administrators'
    )
    select
      a.id as resource,
      case
        when s.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.id is not null then a.name || ' azure AD authentication enabled.'
        else a.name || ' azure AD authentication disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server as a
      left join sever_with_ad_admin as s on a.id = s.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_db_public_network_access_disabled" {
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
      azure_sql_server as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_server_uses_private_link" {
  sql = <<-EOQ
    with sql_server_private_connection as (
      select
        distinct a.id
      from
        azure_sql_server as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection ->> 'PrivateLinkServiceConnectionStateStatus' = 'Approved'
    )
    select
      a.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server as a
      left join sql_server_private_connection as c on c.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_server_auditing_storage_account_destination_retention_90_days" {
  sql = <<-EOQ
    with sql_server as(
      select
        id,
        name,
        subscription_id,
        resource_group,
        p -> 'properties' ->> 'retentionDays' as retentionDays
      from
        azure_sql_server,
        jsonb_array_elements(server_audit_policy) as p
      where
      p -> 'properties' ->> 'state' = 'Enabled'
      and p -> 'properties' ->> 'storageEndpoint' is not null
    )
    select
      a.id as resource,
      case
        when s.id is null then 'skip'
        -- The value in days of the retention period (0 is an indication for unlimited retention).
        when s.retentionDays::Integer = 0 then 'ok'
        when s.retentionDays::Integer >= 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when s.id is null then a.name || ' auditing to storage account destination not enabled.'
        when s.retentionDays::Integer = 0 then a.name || ' auditing to storage account destination configured with unlimited retention days.'
        when s.retentionDays::Integer >= 90 then a.name || ' auditing to storage account destination configured with 90 days retention or higher.'
        else a.name || ' auditing to storage account destination not configured with 90 days retention or higher.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server as a
      left join sql_server as s on s.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "sql_database_allow_internet_access" {
  sql = <<-EOQ
    select
      s.id resource,
      case
        when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
        or firewall_rules @> '[{"properties":{"endIpAddress":"255.255.255.255","startIpAddress":"0.0.0.0"}}]'
          then 'alarm'
          else 'ok'
      end as status,
      case
        when firewall_rules @> '[{"properties":{"endIpAddress":"0.0.0.0","startIpAddress":"0.0.0.0"}}]'
        or firewall_rules @> '[{"properties":{"endIpAddress":"255.255.255.255","startIpAddress":"0.0.0.0"}}]'
          then s.title || ' allows ingress 0.0.0.0/0 or any ip over internet.'
          else s.title || ' not allows ingress 0.0.0.0/0 or any ip over internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_db_active_directory_admin_configured" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when server_azure_ad_administrator is null then 'alarm'
        else 'ok'
      end as status,
      case
        when server_azure_ad_administrator is null then name || ' Azure AD authentication not configured.'
        else name || ' Azure AD authentication configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_server_atp_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when security -> 'properties' ->> 'state' = 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when security -> 'properties' ->> 'state' = 'Disabled' then s.name || ' Azure defender disabled.'
        else s.name || ' Azure defender enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      jsonb_array_elements(server_security_alert_policy) security,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "sql_server_auditing_retention_period_90" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when (audit -> 'properties' ->> 'retentionDays')::integer = 0 then 'ok'
        when (audit -> 'properties' ->> 'retentionDays')::integer >= 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when (audit -> 'properties' ->> 'retentionDays')::integer = 0 then name || ' audit retention set to unlimited days.'
        when (audit -> 'properties' ->> 'retentionDays')::integer >= 90 then name || ' audit retention greater than 90 days.'
        else  name || ' audit retention less than 90 days.'
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

query "sql_server_va_setting_periodic_scan_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'isEnabled' = 'false'
          )
          then 'alarm'
        else 'ok'
      end as status,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'isEnabled' = 'false'
          )
          then s.name || ' VA setting periodic recurring scans disabled.'
        else s.name || ' VA setting periodic recurring scans enabled.'
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

query "sql_server_va_setting_reports_notify_admins" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'emailSubscriptionAdmins' = 'false'
          )
          then 'alarm'
        else 'ok'
      end as status,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'emailSubscriptionAdmins' = 'false'
          )
          then s.name || ' VA setting not configured to send email notifications to subscription admins and owners.'
        else s.name || ' VA setting configured to send email notifications to subscription admins and owners.'
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

query "sql_server_va_setting_scan_reports_configured" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'emails' = '[]'
          )
          then 'alarm'
        else 'ok'
      end as status,
      case
        when
          security -> 'properties' ->> 'state' = 'Disabled'
          or
          (
            security -> 'properties' ->> 'state' = 'Enabled'
            and assessment -> 'properties' ->> 'storageContainerPath' is not null
            and assessment -> 'properties' -> 'recurringScans' ->> 'emails' = '[]'
          )
        then s.name || ' VA scan reports and alerts not configured send email.'
        else s.name || ' VA scan reports and alerts configured to send email.'
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
