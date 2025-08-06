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

control "storage_account_blob_containers_public_access_disabled" {
  title       = "Ensure that 'Public access level' is set to Private for blob containers"
  description = "Disable anonymous access to blob containers and disallow blob public access on storage account."
  query       = query.storage_account_blob_containers_public_access_disabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_public_access_disabled" {
  title       = "Ensure that 'Allow Blob Anonymous Access' is set to 'Disabled' for storage accounts"
  description = "Disable anonymous access to blob containers and disallow blob public access on storage account."
  query       = query.storage_account_blob_public_access_disabled

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

control "storage_account_containing_vhd_os_disk_cmk_encrypted" {
  title       = "Storage account containing VHD OS disk not encrypted with CMK"
  description = "This policy identifies Azure Storage account containing VHD OS disk which are not encrypted with CMK. VHD's attached to Virtual Machines are stored in Azure storage. By default Azure Storage account is encrypted using Microsoft Managed Keys. It is recommended to use Customer Managed Keys to encrypt data in Azure Storage accounts for better control on the data."
  query       = query.storage_account_containing_vhd_os_disk_cmk_encrypted

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_encryption_at_rest_using_mmk" {
  title       = "Storage accounts should use Microsoft-managed key for encryption"
  description = "Use Microsoft-managed key to encrypt your storage account. Microsoft-managed key is the default and simplest option for encryption at rest."
  query       = query.storage_account_encryption_at_rest_using_mmk

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_versioning_enabled" {
  title       = "Blob versioning should be enabled for storage accounts"
  description = "Ensure that blob versioning is enabled to allow automatic retention of previous versions of objects, which helps recover data in case of accidental deletion or overwrite."
  query       = query.storage_account_blob_versioning_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_file_share_soft_delete_enabled" {
  title       = "Soft delete for Azure File Shares should be enabled"
  description = "Enable soft delete for Azure File Shares to allow recovery of data that is mistakenly deleted by an application or user."
  query       = query.storage_account_file_share_soft_delete_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_soft_delete_enabled" {
  title       = "Soft delete for blobs should be enabled"
  description = "Enable soft delete for blobs to protect against accidental or malicious deletion of blob data."
  query       = query.storage_account_blob_soft_delete_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_public_network_access_disabled" {
  title       = "Public network access should be disabled for storage accounts"
  description = "Disabling public network access for a storage account helps prevent unauthorized access from the public internet."
  query       = query.storage_account_public_network_access_disabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_default_network_access_deny" {
  title       = "Default network access rule for storage accounts should be set to deny"
  description = "Restricting default network access provides an additional layer of security by only allowing connections from explicitly allowed networks."
  query       = query.storage_account_default_network_access_deny

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_default_to_oauth_authentication" {
  title       = "Default to Microsoft Entra authorization should be enabled for storage accounts"
  description = "Enable default Microsoft Entra (Azure AD) authorization for storage accounts to improve identity and access management."
  query       = query.storage_account_default_to_oauth_authentication

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_cross_tenant_replication_disabled" {
  title       = "Cross tenant replication should be disabled for storage accounts"
  description = "Disabling cross tenant replication helps prevent data from being replicated across multiple Azure tenants, reducing the risk of data leakage."
  query       = query.storage_account_cross_tenant_replication_disabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_shared_key_access_disabled" {
  title       = "Shared key access should be disabled for storage accounts"
  description = "Disabling shared key access ensures that only Azure AD identities can access storage accounts, improving security."
  query       = query.storage_account_shared_key_access_disabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_service_classic_logging_enabled" {
  title       = "Ensure classic logging is enabled for Azure Blob service"
  description = "This control verifies that classic logging is enabled for the Azure Blob service. Classic logging captures read, write, and delete operations and stores them in a storage account for auditing and troubleshooting. While Azure Monitor diagnostic settings are the recommended approach for newer resources, some legacy environments may still rely on classic logging for operational visibility."
  query       = query.storage_account_blob_service_classic_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_table_service_classic_logging_enabled" {
  title       = "Ensure classic logging is enabled for Azure Table service"
  description = "This control checks that classic logging is enabled for the Azure Table service. Classic logging provides auditing for read, write, and delete actions by recording them in the associated storage logs. This is important in legacy scenarios where diagnostic settings are not yet in place."
  query       = query.storage_account_table_service_classic_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_queue_service_classic_logging_enabled" {
  title       = "Ensure classic logging is enabled for Azure Queue service"
  description = "This control ensures that classic logging is enabled for the Azure Queue service. It validates whether operations such as enqueue, dequeue, and delete are being captured via the legacy storage logging mechanism. This is especially relevant for older deployments where diagnostic settings are not configured."
  query       = query.storage_account_queue_service_classic_logging_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_key_rotation_reminder_enabled" {
  title         = "Ensure that 'Enable key rotation reminders' is enabled for each Storage Account"
  description   = "Access Keys authenticate application access requests to data contained in Storage Accounts. A periodic rotation of these keys is recommended to ensure that potentially compromised keys cannot result in a long-term exploitable credential. The 'Rotation Reminder' is an automatic reminder feature for a manual procedure, the default vaule id 90 days."
  query         = query.storage_account_key_rotation_reminder_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_blob_and_container_soft_delete_enabled" {
  title         = "Ensure Soft Delete is Enabled for Azure Containers and Blob Storage"
  description   = "The Azure Storage blobs contain data like ePHI or Financial, which can be secret or personal."
  query         = query.storage_account_blob_and_container_soft_delete_enabled

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_file_share_smb_protocol_version_3_1_1" {
  title         = "Ensure 'SMB protocol version' is set to 'SMB 3.1.1' or higher for SMB file shares"
  description   = "Ensure that SMB file shares are configured to use the latest supported SMB protocol version."
  query         = query.storage_account_file_share_smb_protocol_version_3_1_1

  tags = local.regulatory_compliance_storage_common_tags
}

control "storage_account_file_share_smb_channel_encryption_aes_256_gcm" {
  title         = "Ensure 'SMB channel encryption' is set to 'AES-256-GCM' or higher for SMB file shares"
  description   = "Implement SMB channel encryption with AES-256-GCM for SMB file shares to ensure data confidentiality and integrity in transit."
  query         = query.storage_account_file_share_smb_channel_encryption_aes_256_gcm

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
        a.id,
        a.name,
        count(*) as total_connections,
        count(case when connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' = 'Approved' then 1 end) as approved_connections,
        count(case when connection -> 'properties' -> 'privateLinkServiceConnectionState' ->> 'status' != 'Approved' then 1 end) as non_approved_connections
      from
        azure_storage_account as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        private_endpoint_connections is not null
        and jsonb_array_length(private_endpoint_connections) > 0
      group by
        a.id, a.name
    )
    select
      distinct a.id as resource,
      case
        when jsonb_array_length(private_endpoint_connections) = 0 then 'alarm'
        when s.approved_connections > 0 and s.non_approved_connections = 0 then 'ok'
        when s.non_approved_connections > 0 then 'alarm'
      end as status,
      case
        when jsonb_array_length(private_endpoint_connections) = 0 then a.name || ' not uses private link.'
        when s.approved_connections > 0 and s.non_approved_connections = 0 then a.name || ' uses approved private link(s).'
        else a.name || ' has non approved private link(s).'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as a
      left join storage_account_connection as s on a.id = s.id
      left join azure_subscription as sub on sub.subscription_id = a.subscription_id;
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
        else sa.name || ' publicly accessible.'
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

query "storage_account_encryption_at_rest_using_mmk" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when sa.encryption_key_source = 'Microsoft.Storage' then 'ok'
        else 'alarm'
      end as status,
      case
        when sa.encryption_key_source = 'Microsoft.Storage' then sa.name || ' encrypted with MMK.'
        else sa.name || ' not encrypted with MMK.'
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

query "storage_account_blob_containers_public_access_disabled" {
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

query "storage_account_blob_public_access_disabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when not sa.allow_blob_public_access then 'ok'
        else 'alarm'
      end as status,
      case
        when not sa.allow_blob_public_access then sa.name || ' blob public access disabled.'
        else sa.name || ' blob public access enabled.'
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

query "storage_account_blob_service_logging_enabled" {
  sql = <<-EOQ
    with blob_logs as (
      select
        a.id,
        a.name,
        log ->> 'category' as category,
        (log ->> 'enabled')::boolean as enabled
      from
        azure_storage_account a,
        jsonb_array_elements(a.default_blob_diagnostic_settings) as b,
        jsonb_array_elements(b -> 'properties' -> 'logs') as log
      where
        log ->> 'category' in ('StorageRead', 'StorageWrite', 'StorageDelete')
    ),
    log_status as (
      select
        id,
        name,
        max(case when category = 'StorageRead' then (enabled::int) else 0 end) = 1 as read_enabled,
        max(case when category = 'StorageWrite' then (enabled::int) else 0 end) = 1 as write_enabled,
        max(case when category = 'StorageDelete' then (enabled::int) else 0 end) = 1 as delete_enabled
      from blob_logs
      group by id, name
    )
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' and kind in ('StorageV2', 'FileStorage') then 'skip'
        when default_blob_diagnostic_settings is null then 'alarm'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sku_tier) = 'premium' and kind in ('StorageV2', 'FileStorage') then sa.name || ' is premium ' || kind || ' storage account.'
        when default_blob_diagnostic_settings is null then sa.name || ' blob service logging disabled for read, write, delete requests.'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then sa.name || ' blob service logging enabled for read, write, delete requests.'
        else sa.name || ' blob service logging missing for: ' ||
          trim(both ', ' from
            case when not ls.read_enabled then 'read, ' else '' end ||
            case when not ls.write_enabled then 'write, ' else '' end ||
            case when not ls.delete_enabled then 'delete, ' else '' end
          ) || ' requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa
      left join log_status as ls on ls.id = sa.id
      left join azure_subscription sub on sub.subscription_id = sa.subscription_id
  EOQ
}

query "storage_account_table_service_logging_enabled" {
  sql = <<-EOQ
    with table_logs as (
      select
        a.id,
        a.name,
        log ->> 'category' as category,
        (log ->> 'enabled')::boolean as enabled
      from
        azure_storage_account a,
        jsonb_array_elements(a.default_table_diagnostic_settings) as b,
        jsonb_array_elements(b -> 'properties' -> 'logs') as log
      where
        log ->> 'category' in ('StorageRead', 'StorageWrite', 'StorageDelete')
    ),
    log_status as (
      select
        id,
        name,
        max(case when category = 'StorageRead' then (enabled::int) else 0 end) = 1 as read_enabled,
        max(case when category = 'StorageWrite' then (enabled::int) else 0 end) = 1 as write_enabled,
        max(case when category = 'StorageDelete' then (enabled::int) else 0 end) = 1 as delete_enabled
      from table_logs
      group by id, name
    )
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' then 'skip'
        when default_table_diagnostic_settings is null then 'alarm'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sku_tier) = 'premium' then sa.name || ' is premium ' || kind || ' storage account.'
        when default_table_diagnostic_settings is null then sa.name || ' table service logging disabled for read, write, delete requests.'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then sa.name || ' table service logging enabled for read, write, delete requests.'
        else sa.name || ' table service logging missing for: ' ||
          trim(both ', ' from
            case when not ls.read_enabled then 'read, ' else '' end ||
            case when not ls.write_enabled then 'write, ' else '' end ||
            case when not ls.delete_enabled then 'delete, ' else '' end
          ) || ' requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa
      left join log_status as ls on ls.id = sa.id
      left join azure_subscription sub on sub.subscription_id = sa.subscription_id
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
    with queue_logs as (
      select
        a.id,
        a.name,
        log ->> 'category' as category,
        (log ->> 'enabled')::boolean as enabled
      from
        azure_storage_account a,
        jsonb_array_elements(a.default_queue_diagnostic_settings) as b,
        jsonb_array_elements(b -> 'properties' -> 'logs') as log
      where
        log ->> 'category' in ('StorageRead', 'StorageWrite', 'StorageDelete')
    ),
    log_status as (
      select
        id,
        name,
        max(case when category = 'StorageRead' then (enabled::int) else 0 end) = 1 as read_enabled,
        max(case when category = 'StorageWrite' then (enabled::int) else 0 end) = 1 as write_enabled,
        max(case when category = 'StorageDelete' then (enabled::int) else 0 end) = 1 as delete_enabled
      from queue_logs
      group by id, name
    )
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' then 'skip'
        when default_queue_diagnostic_settings is null then 'alarm'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sku_tier) = 'premium' then sa.name || ' is premium ' || kind || ' storage account.'
        when default_queue_diagnostic_settings is null then sa.name || ' queue service logging disabled for read, write, delete requests.'
        when ls.read_enabled and ls.write_enabled and ls.delete_enabled then sa.name || ' queue service logging enabled for read, write, delete requests.'
        else sa.name || ' queue service logging missing for: ' ||
          trim(both ', ' from
            case when not ls.read_enabled then 'read, ' else '' end ||
            case when not ls.write_enabled then 'write, ' else '' end ||
            case when not ls.delete_enabled then 'delete, ' else '' end
          ) || ' requests.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account sa
      left join log_status as ls on ls.id = sa.id
      left join azure_subscription sub on sub.subscription_id = sa.subscription_id
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

query "storage_account_blob_versioning_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when bs.is_versioning_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when bs.is_versioning_enabled then sa.name || ' has blob versioning enabled.'
        else sa.name || ' has blob versioning disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as sa
      left join azure_storage_blob_service as bs on sa.name = bs.storage_account_name
      left join azure_subscription sub on sub.subscription_id = sa.subscription_id
  EOQ
}

query "storage_account_file_share_soft_delete_enabled" {
  sql = <<-EOQ
    with storage_account_with_file_share as (
      select
        distinct storage_account_name,
        subscription_id,
        resource_group
      from
        azure_storage_share_file
    )
    select
        sa.id as resource,
        case
          when fs.storage_account_name is null then 'skip'
          when file_soft_delete_enabled and file_soft_delete_retention_days between 1 and 365 then 'ok'
          else 'alarm'
        end as status,
        case
          when fs.storage_account_name is null then name || ' does not have file share.'
          when not file_soft_delete_enabled then name || ' file share soft delete disabled.'
          when file_soft_delete_retention_days < 1 or file_soft_delete_retention_days > 365
            then name || ' file share soft delete retention days (' || file_soft_delete_retention_days || ') not between 1 and 365.'
          else name || ' file share soft delete enabled with ' || file_soft_delete_retention_days || ' days retention.'
        end as reason
        ${local.tag_dimensions_sql}
        ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_storage_account sa
        left join storage_account_with_file_share as fs on sa.name = fs.storage_account_name and sa.subscription_id = fs.subscription_id and sa.resource_group = fs.resource_group
        left join azure_subscription sub on  sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_blob_soft_delete_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when blob_soft_delete_enabled and blob_soft_delete_retention_days between 7 and 365 then 'ok'
        else 'alarm'
      end as status,
      case
        when not blob_soft_delete_enabled then name || ' blob soft delete disabled.'
        when blob_soft_delete_retention_days < 7 or blob_soft_delete_retention_days > 365
          then name || ' blob soft delete retention days (' || blob_soft_delete_retention_days || ') not between 7 and 365.'
        else name || ' blob soft delete enabled with ' || blob_soft_delete_retention_days || ' days retention.'
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

query "storage_account_public_network_access_disabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when public_network_access = 'Disabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when public_network_access = 'Disabled' then sa.name || ' public network access is disabled.'
        else sa.name || ' public network access is enabled.'
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

query "storage_account_default_network_access_deny" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when network_rule_default_action = 'Deny' then 'ok'
        else 'alarm'
      end as status,
      case
        when network_rule_default_action = 'Deny' then sa.name || ' default network access rule set to deny.'
        else sa.name || ' default network access rule not set to deny.'
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

query "storage_account_default_to_oauth_authentication" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when default_to_oauth_authentication then 'ok'
        else 'alarm'
      end as status,
      case
        when default_to_oauth_authentication then sa.name || ' default to Microsoft Entra authorization is enabled.'
        else sa.name || ' default to Microsoft Entra authorization is disabled.'
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

query "storage_account_cross_tenant_replication_disabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when allow_cross_tenant_replication then 'alarm'
        else 'ok'
      end as status,
      case
        when allow_cross_tenant_replication then sa.name || ' cross tenant replication is enabled.'
        else sa.name || ' cross tenant replication is disabled.'
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

query "storage_account_shared_key_access_disabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when allow_shared_key_access then 'alarm'
        else 'ok'
      end as status,
      case
        when allow_shared_key_access then sa.name || ' shared key access is enabled.'
        else sa.name || ' shared key access is disabled.'
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

query "storage_account_blob_service_classic_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' and kind in ('StorageV2', 'FileStorage') then 'skip'
        when not (sa.blob_service_logging ->> 'Read') :: boolean
        or not (sa.blob_service_logging ->> 'Write') :: boolean
        or not (sa.blob_service_logging ->> 'Delete') :: boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when lower(sku_tier) = 'premium' and kind in ('StorageV2', 'FileStorage') then sa.name || ' is premium ' || kind || ' storage account.'
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

query "storage_account_table_service_classic_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' then 'skip'
        when table_logging_write and table_logging_read and table_logging_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sku_tier) = 'premium' then sa.name || ' is premium ' || kind || ' storage account.'
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

query "storage_account_queue_service_classic_logging_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when lower(sku_tier) = 'premium' then 'skip'
        when queue_logging_read and queue_logging_write and queue_logging_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(sku_tier) = 'premium' then sa.name || ' is premium ' || kind || ' storage account.'
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

query "storage_account_key_rotation_reminder_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when key_policy is null then 'alarm'
        when key_policy ->> 'keyExpirationPeriodInDays' = '90' then 'ok'
        else 'alarm'
      end as status,
      case
        when key_policy is null then sa.name || ' key rotation reminder disabled.'
        else sa.name || ' key rotation reminder enabled for ' || (key_policy ->> 'keyExpirationPeriodInDays') || ' days.'
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

query "storage_account_blob_and_container_soft_delete_enabled" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when
          blob_soft_delete_enabled and blob_container_soft_delete_enabled
          and blob_soft_delete_retention_days between 7 and 365
          and blob_container_soft_delete_retention_days between 7 and 365 then 'ok'
        else 'alarm'
      end as status,
      case
        when
          blob_soft_delete_enabled and blob_container_soft_delete_enabled
          and blob_soft_delete_retention_days between 7 and 365
          and blob_container_soft_delete_retention_days between 7 and 365 then
          sa.name || ' soft delete is enabled for azure containers and blob storage with retention days: blob=' || blob_soft_delete_retention_days || ', container=' || blob_container_soft_delete_retention_days || '.'
        when
          (not blob_soft_delete_enabled or blob_soft_delete_enabled is null) and (not blob_container_soft_delete_enabled or  blob_container_soft_delete_enabled is null) then sa.name || ' blob and azure container soft delete disabled.'
        when
          (not blob_soft_delete_enabled or blob_soft_delete_enabled is null) then sa.name || ' blob soft delete disabled.'
        when
          (not blob_container_soft_delete_enabled  or blob_container_soft_delete_enabled is null) then sa.name || ' azure container soft delete disabled.'
        when
          blob_soft_delete_retention_days < 7 or blob_soft_delete_retention_days > 365 then sa.name || ' blob soft delete retention days (' || COALESCE(blob_soft_delete_retention_days::text, 'null') || ') is not between 7 and 365 days.'
        when
          blob_container_soft_delete_retention_days < 7 or blob_container_soft_delete_retention_days > 365 then
          sa.name || ' azure container soft delete retention days (' || COALESCE(blob_container_soft_delete_retention_days::text, 'null') || ') is not between 7 and 365 days.'
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

query "storage_account_file_share_smb_protocol_version_3_1_1" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when f -> 'properties' -> 'protocolSettings' -> 'smb' ->> 'versions' = 'SMB3.1.1;' then 'ok'
        else 'alarm'
      end as status,
      case
        when f -> 'properties' -> 'protocolSettings' -> 'smb' ->> 'versions' = 'SMB3.1.1;' then sa.name || ' file share SMB protocol version set to SMB 3.1.1.'
        else sa.name || ' file share SMB protocol version not set to SMB 3.1.1.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as sa,
      jsonb_array_elements(file_services) as f,
      azure_subscription as sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}

query "storage_account_file_share_smb_channel_encryption_aes_256_gcm" {
  sql = <<-EOQ
    select
      sa.id as resource,
      case
        when f -> 'properties' -> 'protocolSettings' -> 'smb' ->> 'channelEncryption' = 'AES-256-GCM;' then 'ok'
        else 'alarm'
      end as status,
      case
        when f -> 'properties' -> 'protocolSettings' -> 'smb' ->> 'channelEncryption' = 'AES-256-GCM;' then sa.name || ' file share SMB channel encryption set to AES-256-GCM.'
        else sa.name || ' file share SMB channel encryption not set to AES-256-GCM.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_storage_account as sa,
      jsonb_array_elements(file_services) as f,
      azure_subscription as sub
    where
      sub.subscription_id = sa.subscription_id;
  EOQ
}
