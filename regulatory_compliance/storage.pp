locals {
  regulatory_compliance_storage_common_tags = {
    service = "Azure/Storage"
  }
}

control "storage_account_secure_transfer_required_enabled" {
  title       = "Secure transfer to storage accounts should be enabled"
  description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  query       = query.storage_account_secure_transfer_required_enabled

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "storage_account_default_network_access_rule_denied" {
  title       = "Storage accounts should restrict network access"
  description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  query       = query.storage_account_default_network_access_rule_denied

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "storage_account_use_virtual_service_endpoint" {
  title       = "Storage Accounts should use a virtual network service endpoint"
  description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
  query       = query.storage_account_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "storage_account_uses_private_link" {
  title       = "Storage accounts should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced."
  query       = query.storage_account_uses_private_link

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "storage_account_infrastructure_encryption_enabled" {
  title       = "Storage accounts should have infrastructure encryption"
  description = "Enable infrastructure encryption for higher level of assurance that the data is secure. When infrastructure encryption is enabled, data in a storage account is encrypted twice."
  query       = query.storage_account_infrastructure_encryption_enabled

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "storage_account_block_public_access" {
  title       = "Storage account public access should be disallowed"
  description = "Anonymous public read access to containers and blobs in Azure Storage is a convenient way to share data but might present security risks. To prevent data breaches caused by undesired anonymous access, Microsoft recommends preventing public access to a storage account unless your scenario requires it."
  query       = query.storage_account_block_public_access

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "storage_account_restrict_network_access" {
  title       = "Storage accounts should restrict network access using virtual network rules"
  description = "Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts."
  query       = query.storage_account_restrict_network_access

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "storage_account_geo_redundant_enabled" {
  title       = "Geo-redundant storage should be enabled for Storage Accounts"
  description = "Use geo-redundancy to create highly available applications."
  query       = query.storage_account_geo_redundant_enabled

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high         = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_encryption_at_rest_using_cmk" {
  title       = "Storage accounts should use customer-managed key for encryption"
  description = "Secure your storage account with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
  query       = query.storage_account_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "storage_account_uses_azure_resource_manager" {
  title       = "Storage accounts should be migrated to new Azure Resource Manager resources"
  description = "Use new Azure Resource Manager for your storage accounts to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management."
  query       = query.storage_account_uses_azure_resource_manager

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "storage_account_encryption_scopes_encrypted_at_rest_with_cmk" {
  title       = "Storage account encryption scopes should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your storage account encryption scopes. Customer-managed keys enable the data to be encrypted with an Azure key-vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.storage_account_encryption_scopes_encrypted_at_rest_with_cmk

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    fedramp_high          = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "storage_account_blob_containers_public_access_private" {
  title       = "Ensure that 'Public access level' is set to Private for blob containers"
  description = "Disable anonymous access to blob containers and disallow blob public access on storage account."
  query       = query.storage_account_blob_containers_public_access_private

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_service_logging_enabled" {
  title       = "Ensure Storage logging is enabled for Blob service for read, write, and delete requests"
  description = "The Storage Blob service provides scalable, cost-efficient objective storage in the cloud. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the blobs. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details, concurrency information, and the sizes of the request and response messages."
  query       = query.storage_account_blob_service_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_table_service_logging_enabled" {
  title       = "Ensure Storage Logging is Enabled for Table Service for 'Read', 'Write', and 'Delete' requests"
  description = "Azure Table storage is a service that stores structured NoSQL data in the cloud, providing a key/attribute store with a schema-less design. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the tables. Storage Logging log entries contain the following information about individual requests: timing information such as start time, end-to-end latency, and server latency; authentication details; concurrency information; and the sizes of the request and response messages."
  query       = query.storage_account_table_service_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_min_tls_1_2" {
  title       = "Ensure the 'Minimum TLS version' for storage accounts is set to 'Version 1.2'"
  description = "In some cases, Azure Storage sets the minimum TLS version to be version 1.0 by default. TLS 1.0 is a legacy version and has known vulnerabilities. This minimum TLS version can be configured to be later protocols such as TLS 1.2."
  query       = query.storage_account_min_tls_1_2

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_queue_services_logging_enabled" {
  title       = "Ensure Storage logging is enabled for Queue service for read, write, and delete requests"
  description = "The Storage Queue service stores messages that may be read by any client who has access to the storage account. A queue can contain an unlimited number of messages, each of which can be up to 64KB in size using version 2011-08-18 or newer. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the queues. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details, concurrency information, and the sizes of the request and response messages."
  query       = query.storage_account_queue_services_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_soft_delete_enabled" {
  title       = "Ensure soft delete is enabled for Azure Storage"
  description = "The Azure Storage blobs contain data like ePHI, Financial, secret or personal. Erroneously modified or deleted accidentally by an application or other storage account user cause data loss or data unavailability. It is recommended the Azure Storage be made recoverable by enabling soft delete configuration. This is to save and recover data when blobs or blob snapshots are deleted."
  query       = query.storage_account_soft_delete_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_trusted_microsoft_services_enabled" {
  title       = "Ensure 'Allow Azure services on the trusted services list to access this storage account' is Enabled for Storage Account Access"
  description = "Some Azure services that interact with storage accounts operate from networks that can't be granted access through network rules. To help this type of service work as intended, allow the set of trusted Azure services to bypass the network rules. These services will then use strong authentication to access the storage account."
  query       = query.storage_account_trusted_microsoft_services_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blobs_logging_enabled" {
  title       = "Storage account logging (Classic Diagnostic Setting) for blobs should be enabled"
  description = "Storage Logging records details of requests (read, write, and delete operations) against your Azure blobs. This policy identifies Azure storage accounts that do not have logging enabled for blobs. As a best practice, enable logging for read, write, and delete request types on blobs."
  query       = query.storage_account_blobs_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_tables_logging_enabled" {
  title       = "Storage account logging (Classic Diagnostic Setting) for tables should be enabled"
  description = "Storage Logging records details of requests (read, write, and delete operations) against your Azure tables. This policy identifies Azure storage accounts that do not have logging enabled for tables. As a best practice, enable logging for read, write, and delete request types on tables."
  query       = query.storage_account_tables_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_queues_logging_enabled" {
  title       = "Storage account logging (Classic Diagnostic Setting) for queues should be enabled"
  description = "Storage Logging records details of requests (read, write, and delete operations) against your Azure queues. This policy identifies Azure storage accounts that do not have logging enabled for queues. As a best practice, enable logging for read, write, and delete request types on queues."
  query       = query.storage_account_queues_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_containing_vhd_os_disk_cmk_encrypted" {
  title       = "Storage account containing VHD OS disk not encrypted with CMK"
  description = "This policy identifies Azure Storage account containing VHD OS disk which are not encrypted with CMK. VHD's attached to Virtual Machines are stored in Azure storage. By default Azure Storage account is encrypted using Microsoft Managed Keys. It is recommended to use Customer Managed Keys to encrypt data in Azure Storage accounts for better control on the data."
  query       = query.storage_account_containing_vhd_os_disk_cmk_encrypted

  tags = local.regulatory_compliance_storage_common_tags
}

query "storage_account_secure_transfer_required_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when not enable_https_traffic_only then 'alarm'
        else 'ok'
      end as status,
      case
        when not enable_https_traffic_only then sa.name || ' encryption in transit not enabled.'
        else sa.name || ' encryption in transit enabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_default_network_access_rule_denied" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when sa.network_rule_default_action = 'Allow' then 'alarm'
        else 'ok'
      end as status,
      case
        when sa.network_rule_default_action = 'Allow' then name || ' allows traffic from all networks.'
        else name || ' allows traffic from specific networks.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_use_virtual_service_endpoint" {
  sql = <<-EOQ
    with storage_account_subnet as (
      select
        distinct a.id as storage_account_id,
        rule ->> 'id' as id
      from
        azure_storage_account as a,
        jsonb_array_elements(virtual_network_rules) as rule,
        azure_subnet as subnet,
        jsonb_array_elements(service_endpoints) as endpoints
      where
        endpoints ->> 'service' like '%Microsoft.Storage%'
    )
    select
      distinct a.id as resource,
      case
        when network_rule_default_action <> 'Deny' then 'alarm'
        when s.storage_account_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when network_rule_default_action <> 'Deny' then a.name || ' not configured with virtual service endpoint.'
        when s.storage_account_id is null then a.name || ' not configured with virtual service endpoint.'
        else a.name || ' configured with virtual service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as a
      left join storage_account_subnet as s on a.id = s.storage_account_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "storage_account_uses_private_link" {
  sql = <<-EOQ
    with storage_account_connection as (
      select
        distinct a.id
      from
        azure_storage_account as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved'
    )
    select
      distinct a.id as resource,
      case
        when s.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when s.id is null then a.name || ' not uses private link.'
        else a.name || ' uses private link.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as a
      left join storage_account_connection as s on a.id = s.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "storage_account_infrastructure_encryption_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when require_infrastructure_encryption then 'ok'
        else 'alarm'
      end as status,
      case
        when require_infrastructure_encryption then name || ' infrastructure encryption enabled.'
        else name || ' infrastructure encryption disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "storage_account_block_public_access" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sa.public_network_access) = 'disabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sa.public_network_access) = 'disabled' then sa.name || ' not publicly accessible.'
        else sa.name || ' publicy accessible.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_restrict_network_access" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when network_rule_default_action = 'Deny' then 'ok'
        else 'alarm'
      end as status,
      case
        when network_rule_default_action = 'Deny' then sa.name || ' blocks network access.'
        else sa.name || ' allows network access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_geo_redundant_enabled" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when sku_name = any(ARRAY ['Standard_GRS', 'Standard_RAGRS', 'Standard_GZRS', 'Standard_RAGZRS']) then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name = any(ARRAY ['Standard_GRS', 'Standard_RAGRS', 'Standard_GZRS', 'Standard_RAGZRS']) then name || ' geo-redundant enabled.'
        else name || ' geo-redundant disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "storage_account_encryption_at_rest_using_cmk" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when sa.encryption_key_source = 'Microsoft.Storage' then 'alarm'
        else 'ok'
      end as status,
      case
        when sa.encryption_key_source = 'Microsoft.Storage' then sa.name || ' not encrypted with CMK.'
        else sa.name || ' encrypted with CMK.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_uses_azure_resource_manager" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when resource_group is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when resource_group is not null then s.title || ' uses azure resource manager.'
        else s.title || ' not uses azure resource manager.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "storage_account_encryption_scopes_encrypted_at_rest_with_cmk" {
  sql = <<-EOQ
    with storage_account_encryption_scope as(
      select
        e ->> 'Id' as id,
        e ->> 'Name' as name,
        e ->> 'Source' as source,
        subscription_id,
        _ctx,
        region,
        resource_group
      from
        azure_storage_account,
        jsonb_array_elements(encryption_scope) as e
    )
    select
      s.id as resource,
      case
        when source = 'Microsoft.Keyvault' then 'ok'
        else 'alarm'
      end as status,
      case
        when source = 'Microsoft.Keyvault' then s.name || ' uses customer-managed keys to encrypt data at rest.'
        else s.name || ' not uses customer-managed keys to encrypt data at rest.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      storage_account_encryption_scope as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "storage_account_blob_containers_public_access_private" {
  sql = <<-EOQ
    select
      container.id as resource,
      case
        when not account.allow_blob_public_access and container.public_access = 'None' then 'ok'
        else 'alarm'
      end as status,
      case
        when not account.allow_blob_public_access and container.public_access = 'None'
          then account.name || ' container ' || container.name || ' doesn''t allow anonymous access.'
        else account.name || ' container ' || container.name || ' allows anonymous access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "account.")}
      ${replace(local.common_dimensions_global_qualifier_sql, "__QUALIFIER__", "container.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_container container
      join azure_storage_account account on container.account_name = account.name
      join azure_subscription sub on sub.subscription_id = account.subscription_id;
  EOQ
}

query "storage_account_blob_service_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when not (sa.blob_service_logging ->> 'Read') :: boolean
        or not (sa.blob_service_logging ->> 'Write') :: boolean
        or not (sa.blob_service_logging ->> 'Delete') :: boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when not (sa.blob_service_logging ->> 'Read') :: boolean
        or not (sa.blob_service_logging ->> 'Write') :: boolean
        or not (sa.blob_service_logging ->> 'Delete') :: boolean then name || ' blob service logging not enabled for ' ||
          concat_ws(', ',
            case when not (sa.blob_service_logging ->> 'Write') :: boolean then 'write' end,
            case when not (sa.blob_service_logging ->> 'Read') :: boolean then 'read' end,
            case when not (sa.blob_service_logging ->> 'Delete') :: boolean then 'delete' end
          ) || ' requests.'
        else name || ' blob service logging enabled for read, write, delete requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_table_service_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when table_logging_write and table_logging_read and table_logging_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when table_logging_write and table_logging_read and table_logging_delete
          then sa.name || ' table service logging enabled for read, write, delete requests.'
        else sa.name || ' table service logging not enabled for: ' ||
          concat_ws(', ',
            case when not table_logging_write then 'write' end,
            case when not table_logging_read then 'read' end,
            case when not table_logging_delete then 'delete' end
          ) || ' requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as sa,
      azure_subscription as sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_min_tls_1_2" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when minimum_tls_version = 'TLSEnforcementDisabled' then 'alarm'
        when minimum_tls_version = 'TLS1_2' then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_tls_version = 'TLSEnforcementDisabled' then sa.name || ' TLS enforcement is disabled.'
        when minimum_tls_version = 'TLS1_2' then sa.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
        else sa.name || ' minimum TLS version set to ' || minimum_tls_version || '.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_queue_services_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when queue_logging_read and queue_logging_write and queue_logging_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when queue_logging_read and queue_logging_write and queue_logging_delete
          then sa.name || ' queue service logging enabled for read, write, delete requests.'
        else sa.name || ' queue service logging not enabled for: ' ||
          concat_ws(', ',
            case when not queue_logging_write then 'write' end,
            case when not queue_logging_read then 'read' end,
            case when not queue_logging_delete then 'delete' end
          ) || ' requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_soft_delete_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when not blob_soft_delete_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not blob_soft_delete_enabled then sa.name || ' blobs soft delete disabled.'
        else sa.name || ' blobs soft delete enabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_trusted_microsoft_services_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when network_rule_bypass not like '%AzureServices%' then 'alarm'
        else 'ok'
      end as status,
      case
        when network_rule_bypass not like '%AzureServices%' then sa.name || ' trusted Microsoft services not enabled.'
        else sa.name || ' trusted Microsoft services enabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_blobs_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sa.sku_tier) = 'standard'
        and (not (sa.blob_service_logging ->> 'Read') :: boolean
        or not (sa.blob_service_logging ->> 'Write') :: boolean
        or not (sa.blob_service_logging ->> 'Delete') :: boolean) then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(sa.sku_tier) = 'standard'
        and (not (sa.blob_service_logging ->> 'Read') :: boolean
        or not (sa.blob_service_logging ->> 'Write') :: boolean
        or not (sa.blob_service_logging ->> 'Delete') :: boolean) then name || ' storage account logging for blobs is disabled for' ||
          concat_ws(', ',
            case when not (sa.blob_service_logging ->> 'Write') :: boolean then 'write' end,
            case when not (sa.blob_service_logging ->> 'Read') :: boolean then 'read' end,
            case when not (sa.blob_service_logging ->> 'Delete') :: boolean then 'delete' end
          ) || ' requests.'
        else name || ' storage account logging for blobs is enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_tables_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sa.sku_tier) = 'standard'
        and (table_logging_write and table_logging_read and table_logging_delete) then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sa.sku_tier) = 'standard'
        and (table_logging_write and table_logging_read and table_logging_delete)
          then sa.name || ' storage account logging for tables is enabled.'
        else sa.name || ' storage account logging for tables is disabled for ' ||
          concat_ws(', ',
            case when not table_logging_write then 'write' end,
            case when not table_logging_read then 'read' end,
            case when not table_logging_delete then 'delete' end
          ) || ' requests.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_queues_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sa.sku_tier) = 'standard'
        and (queue_logging_write and queue_logging_read and queue_logging_delete) then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sa.sku_tier) = 'standard'
        and (queue_logging_write and queue_logging_read and queue_logging_delete)
          then sa.name || ' storage account logging for queues is enabled.'
        else sa.name || ' storage account logging for queues is disabled for ' ||
          concat_ws(', ',
            case when not queue_logging_write then 'write' end,
            case when not queue_logging_read then 'read' end,
            case when not queue_logging_delete then 'delete' end
          ) || ' requests.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_containing_vhd_os_disk_cmk_encrypted" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when sa.encryption_key_source = 'Microsoft.Storage'
        and vm.os_disk_vhd_uri is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when sa.encryption_key_source = 'Microsoft.Storage'
        and vm.os_disk_vhd_uri is not null then sa.name || ' storage account containing VHD OS disk not encrypted with CMK.'
        else sa.name || ' storage account containing VHD OS disk encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa,
      azure_compute_virtual_machine vm,
      azure_subscription sub
    where
      sub.subscription_id = sa.subscription_id
      and vm.os_disk_vhd_uri like '%' || sa.name || '%';
  EOQ
}
