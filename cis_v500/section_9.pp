locals {
  cis_v500_9_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "9"
  })
}

locals {
  cis_v500_9_1_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.1"
  })
  cis_v500_9_2_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.2"
  })
  cis_v500_9_3_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.3"
  })
  cis_v500_9_3_1_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.3.1"
  })
  cis_v500_9_3_2_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.3.2"
  })
  cis_v500_9_3_3_common_tags = merge(local.cis_v500_9_common_tags, {
    cis_section_id = "9.3.3"
  })
}

benchmark "cis_v500_9" {
  title         = "9 Storage Services"
  documentation = file("./cis_v500/docs/cis_v500_9.md")
  children = [
    benchmark.cis_v500_9_1,
    benchmark.cis_v500_9_2,
    benchmark.cis_v500_9_3
  ]

  tags = merge(local.cis_v500_9_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

benchmark "cis_v500_9_1" {
  title         = "9.1 Azure Files"
  documentation = file("./cis_v500/docs/cis_v500_9_1.md")
  children = [
    control.cis_v500_9_1_1,
    control.cis_v500_9_1_2,
    control.cis_v500_9_1_3
  ]

  tags = merge(local.cis_v500_9_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v500_9_1_1" {
  title         = "9.1.1 Ensure soft delete for Azure File Shares is Enabled"
  description   = "Azure Files offers soft delete for file shares, allowing you to easily recover your data when it is mistakenly deleted by an application or another storage account user."
  query         = query.storage_account_file_share_soft_delete_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_1_1.md")

  tags = merge(local.cis_v500_9_1_common_tags, {
    cis_item_id = "9.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_1_2" {
  title         = "9.1.2 Ensure 'SMB protocol version' is set to 'SMB 3.1.1' or higher for SMB file shares"
  description   = "Ensure that SMB file shares are configured to use the latest supported SMB protocol version. Keeping the SMB protocol updated helps mitigate risks associated with older SMB versions, which may contain vulnerabilities and lack essential security controls."
  query         = query.storage_account_file_share_smb_protocol_version_3_1_1
  documentation = file("./cis_v500/docs/cis_v500_9_1_2.md")

  tags = merge(local.cis_v500_9_1_common_tags, {
    cis_item_id = "9.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_1_3" {
  title         = "9.1.3 Ensure 'SMB channel encryption' is set to 'AES-256-GCM' or higher for SMB file shares"
  description   = "Implement SMB channel encryption with AES-256-GCM for SMB file shares to ensure data confidentiality and integrity in transit. This method offers strong protection against eavesdropping and man-in-the-middle attacks, safeguarding sensitive information."
  query         = query.storage_account_file_share_smb_channel_encryption_aes_256_gcm
  documentation = file("./cis_v500/docs/cis_v500_9_1_3.md")

  tags = merge(local.cis_v500_9_1_common_tags, {
    cis_item_id = "9.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v500_9_2" {
  title         = "9.2 Azure Blob Storage"
  documentation = file("./cis_v500/docs/cis_v500_9_2.md")
  children = [
    control.cis_v500_9_2_1,
    control.cis_v500_9_2_2,
    control.cis_v500_9_2_3
  ]

  tags = merge(local.cis_v500_9_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v500_9_2_1" {
  title         = "9.2.1 Ensure that soft delete for blobs on Azure Blob Storage storage accounts is Enabled"
  description   = "Blobs in Azure storage accounts may contain sensitive or personal data, such as ePHI or financial information. Data that is erroneously modified or deleted by an application or a user can lead to data loss or unavailability."
  query         = query.storage_account_blob_soft_delete_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_2_1.md")

  tags = merge(local.cis_v500_9_2_common_tags, {
    cis_item_id = "9.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_2_2" {
  title         = "9.2.2 Ensure that soft delete for containers on Azure Blob Storage storage accounts is Enabled"
  description   = Containers in Azure storage accounts may contain sensitive or personal data, such as ePHI or financial information. Data that is erroneously modified or deleted by an application or a user can lead to data loss or unavailability."
  query         = query.storage_account_container_soft_delete_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_2_2.md")

  tags = merge(local.cis_v500_9_2_common_tags, {
    cis_item_id = "9.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_2_3" {
  title         = "9.2.3 Ensure 'Versioning' is set to 'Enabled' on Azure Blob Storage storage accounts"
  description   = "Enabling blob versioning allows for the automatic retention of previous versions of objects. With blob versioning enabled, earlier versions of a blob are accessible for data recovery in the event of modifications or deletions.."
  query         = query.storage_account_blob_versioning_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_2_3.md")

  tags = merge(local.cis_v500_9_2_common_tags, {
    cis_item_id = "9.2.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v500_9_3" {
  title         = "9.3 Storage Accounts"
  documentation = file("./cis_v500/docs/cis_v500_9_3.md")
  children = [
    benchmark.cis_v500_9_3_1,
    benchmark.cis_v500_9_3_2,
    benchmark.cis_v500_9_3_3,
    control.cis_v500_9_3_4,
    control.cis_v500_9_3_5,
    control.cis_v500_9_3_6,
    control.cis_v500_9_3_7,
    control.cis_v500_9_3_8,
    control.cis_v500_9_3_9,
    control.cis_v500_9_3_10,
    control.cis_v500_9_3_11
  ]

  tags = merge(local.cis_v500_9_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

benchmark "cis_v500_9_3_1" {
  title         = "9.3.1 Secrets and Keys"
  documentation = file("./cis_v500/docs/cis_v500_9_3_1.md")
  children = [
    control.cis_v500_9_3_1_1,
    control.cis_v500_9_3_1_2,
    control.cis_v500_9_3_1_3
  ]

  tags = merge(local.cis_v500_9_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v500_9_3_1_1" {
  title         = "9.3.1.1 Ensure that 'Enable key rotation reminders' is enabled for each Storage Account"
  description   = "Access Keys authenticate application access requests to data contained in Storage Accounts. A periodic rotation of these keys is recommended to ensure that potentially compromised keys cannot result in a long-term exploitable credential. The "Rotation Reminder" is an automatic reminder feature for a manual procedure"
  query         = query.storage_account_key_rotation_reminder_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_1_1.md")

  tags = merge(local.cis_v500_9_3_1_common_tags, {
    cis_item_id = "9.3.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_1_2" {
  title         = "9.3.1.2 Ensure that Storage Account access keys are periodically regenerated"
  description   = "For increased security, regenerate storage account access keys periodically."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_9_3_1_2.md")

  tags = merge(local.cis_v500_9_3_1_common_tags, {
    cis_item_id = "9.3.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_1_3" {
  title         = "9.3.1.3 Ensure 'Allow storage account key access' for Azure Storage Accounts is 'Disabled'"
  description   = "Every secure request to an Azure Storage account must be authorized. By default, requests can be authorized with either Microsoft Entra credentials or by using the account access key for Shared Key authorization."
  query         = query.storage_account_shared_key_access_disabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_1_3.md")

  tags = merge(local.cis_v500_9_3_1_common_tags, {
    cis_item_id = "9.3.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v500_9_3_2" {
  title         = "9.3.2 Networking"
  children = [
    control.cis_v500_9_3_2_1,
    control.cis_v500_9_3_2_2,
    control.cis_v500_9_3_2_3
  ]

  tags = merge(local.cis_v500_9_3_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v500_9_3_2_1" {
  title         = "9.3.2.1 Ensure Private Endpoints are used to access Storage Accounts"
  description   = "Use private endpoints for your Azure Storage accounts to allow clients and services to securely access data located over a network via an encrypted Private Link. To do this, the private endpoint uses an IP address from the VNet for each service. Network traffic between disparate services securely traverses encrypted over the VNet. This VNet can also link addressing space, extending your network and accessing resources on it. Similarly, it can be a tunnel through public networks to connect remote infrastructures together. This creates further security through segmenting network traffic and preventing outside sources from accessing it."
  query         = query.storage_account_uses_private_link
  documentation = file("./cis_v500/docs/cis_v500_9_3_2_1.md")

  tags = merge(local.cis_v500_9_3_2_common_tags, {
    cis_item_id = "9.3.2.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_2_2" {
  title         = "9.3.2.2 Ensure that 'Public Network Access' is 'Disabled' for storage accounts"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access. Use private endpoints to securely manage access within trusted networks."
  query         = query.storage_account_public_network_access_disabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_2_2.md")

  tags = merge(local.cis_v500_9_3_2_common_tags, {
    cis_item_id = "9.3.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_2_3" {
  title         = "9.3.2.3 Ensure default network access rule for storage accounts is set to deny"
  description   = "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network. To limit access to selected networks, the default action must be changed."
  query         = query.storage_account_default_network_access_deny
  documentation = file("./cis_v500/docs/cis_v500_9_3_2_3.md")

  tags = merge(local.cis_v500_9_3_2_common_tags, {
    cis_item_id = "9.3.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v500_9_3_3" {
  title         = "9.3.3 Identity and Access Management"
  children = [
    control.cis_v500_9_3_3_1
  ]

  tags = merge(local.cis_v500_9_3_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v500_9_3_3_1" {
  title         = "9.3.3.1 Ensure that 'Default to Microsoft Entra authorization in the Azure portal' is set to 'Enabled'"
  description   = "When this property is enabled, the Azure portal authorizes requests to blobs, files, queues, and tables with Microsoft Entra ID by default."
  query         = query.storage_account_default_to_oauth_authentication
  documentation = file("./cis_v500/docs/cis_v500_9_3_3_1.md")

  tags = merge(local.cis_v500_9_3_3_common_tags, {
    cis_item_id = "9.3.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_4" {
  title         = "9.3.4 Ensure that 'Secure transfer required' is set to 'Enabled'"
  description   = "Enable data encryption in transit."
  query         = query.storage_account_secure_transfer_required_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_4.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_5" {
  title         = "9.3.5  is Enabled for Storage Account Access"
  description   = "This recommendation assumes that the `Public network access` parameter is set to `Enabled from selected virtual networks and IP addresses`."
  query         = query.storage_account_trusted_microsoft_services_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_5.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_6" {
  title         = "9.3.6 Ensure the 'Minimum TLS version' for storage accounts is set to 'Version 1.2'"
  description   = "In some cases, Azure Storage sets the minimum TLS version to be version 1.0 by default. TLS 1.0 is a legacy version and has known vulnerabilities. This minimum TLS version can be configured to be later protocols such as TLS 1.2."
  query         = query.storage_account_min_tls_1_2
  documentation = file("./cis_v500/docs/cis_v500_9_3_6.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_7" {
  title         = "9.3.7 Ensure 'Cross Tenant Replication' is not enabled"
  description   = "Cross Tenant Replication in Azure allows data to be replicated across multiple Azure tenants. While this feature can be beneficial for data sharing and availability, it also poses a significant security risk if not properly managed. Unauthorized data access, data leakage, and compliance violations are potential risks. Disabling Cross Tenant Replication ensures that data is not inadvertently replicated across different tenant boundaries without explicit authorization."
  query         = query.storage_account_cross_tenant_replication_disabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_7.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_8" {
  title         = "9.3.8 Ensure that 'Allow Blob Anonymous Access' is set to 'Disabled'"
  description   = "The Azure Storage setting ‘Allow Blob Anonymous Access’ (aka "allowBlobPublicAccess") controls whether anonymous access is allowed for blob data in a storage account. When this property is set to True, it enables public read access to blob data, which can be convenient for sharing data but may carry security risks. When set to False, it disallows public access to blob data, providing a more secure storage environment."
  query         = query.storage_account_blob_public_access_disabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_8.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_9" {
  title         = "9.3.9 Ensure Azure Resource Manager Delete locks are applied to Azure Storage Accounts"
  description   = "Azure Resource Manager CannotDelete (Delete) locks can prevent users from accidentally or maliciously deleting a storage account. This feature ensures that while the Storage account can still be modified or used, deletion of the Storage account resource requires removal of the lock by a user with appropriate permissions."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_9_3_9.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_10" {
  title         = "9.3.10 Ensure Azure Resource Manager ReadOnly locks are considered for Azure Storage Accounts"
  description   = "Adding an Azure Resource Manager ReadOnly lock can prevent users from accidentally or maliciously deleting a storage account, modifying its properties and containers, or creating access assignments. The lock must be removed before the storage account can be deleted or updated. It provides more protection than a CannotDelete-type of resource manager lock."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_9_3_10.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v500_9_3_11" {
  title         = "9.3.11 Ensure Redundancy is set to 'geo-redundant storage (GRS)' on critical Azure Storage Accounts"
  description   = "Geo-redundant storage (GRS) in Azure replicates data three times within the primary region using locally redundant storage (LRS) and asynchronously copies it to a secondary region hundreds of miles away. This setup ensures high availability and resilience by providing 16 nines (99.99999999999999%) durability over a year, safeguarding data against regional outages."
  query         = query.storage_account_geo_redundant_enabled
  documentation = file("./cis_v500/docs/cis_v500_9_3_11.md")

  tags = merge(local.cis_v500_9_3_common_tags, {
    cis_item_id = "9.3.11"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}
