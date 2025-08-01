locals {
  cis_v400_10_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "10"
  })
}

locals {
  cis_v400_10_1_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.1"
  })
  cis_v400_10_2_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.2"
  })
  cis_v400_10_3_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.3"
  })
  cis_v400_10_3_1_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.3.1"
  })
  cis_v400_10_3_2_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.3.2"
  })
  cis_v400_10_3_3_common_tags = merge(local.cis_v400_10_common_tags, {
    cis_section_id = "10.3.3"
  })
}

benchmark "cis_v400_10" {
  title         = "10 Storage Services"
  documentation = file("./cis_v400/docs/cis_v400_10.md")
  children = [
    benchmark.cis_v400_10_1,
    benchmark.cis_v400_10_2,
    benchmark.cis_v400_10_3
  ]

  tags = merge(local.cis_v400_10_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

benchmark "cis_v400_10_1" {
  title         = "10.1 Azure Files"
  documentation = file("./cis_v400/docs/cis_v400_10_1.md")
  children = [
    control.cis_v400_10_1_1,
    control.cis_v400_10_1_2,
    control.cis_v400_10_1_3
  ]

  tags = merge(local.cis_v400_10_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_10_1_1" {
  title         = "10.1.1 Ensure soft delete for Azure File Shares is Enabled"
  description   = "Azure Files offers soft delete for file shares, allowing you to easily recover your data when it is mistakenly deleted by an application or another storage account user."
  query         = query.storage_account_file_share_soft_delete_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_1_1.md")

  tags = merge(local.cis_v400_10_1_common_tags, {
    cis_item_id = "10.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_1_2" {
  title         = "10.1.2 Ensure 'SMB protocol version' is set to 'SMB 3.1.1' or higher for SMB file shares"
  description   = "Ensure that SMB file shares are configured to use the latest supported SMB protocol version."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_10_1_2.md")

  tags = merge(local.cis_v400_10_1_common_tags, {
    cis_item_id = "10.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_1_3" {
  title         = "10.1.3 Ensure 'SMB channel encryption' is set to 'AES-256-GCM' or higher for SMB file shares"
  description   = "Implement SMB channel encryption with AES-256-GCM for SMB file shares to ensure data confidentiality and integrity in transit."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_10_1_3.md")

  tags = merge(local.cis_v400_10_1_common_tags, {
    cis_item_id = "10.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v400_10_2" {
  title         = "10.2 Azure Blob Storage"
  documentation = file("./cis_v400/docs/cis_v400_10_2.md")
  children = [
    control.cis_v400_10_2_1,
    control.cis_v400_10_2_2
  ]

  tags = merge(local.cis_v400_10_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v400_10_2_1" {
  title         = "10.2.1 Ensure that soft delete for blobs on Azure Blob Storage storage accounts is Enabled"
  description   = "Blobs in Azure storage accounts may contain sensitive or personal data, such as ePHI or financial information."
  query         = query.storage_account_blob_soft_delete_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_2_1.md")

  tags = merge(local.cis_v400_10_2_common_tags, {
    cis_item_id = "10.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_2_2" {
  title         = "10.2.2 Ensure 'Versioning' is set to 'Enabled' on Azure Blob Storage storage accounts"
  description   = "Enabling blob versioning allows for the automatic retention of previous versions of objects."
  query         = query.storage_account_blob_versioning_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_2_2.md")

  tags = merge(local.cis_v400_10_2_common_tags, {
    cis_item_id = "10.2.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v400_10_3" {
  title         = "10.3 Storage Accounts"
  documentation = file("./cis_v400/docs/cis_v400_10_3.md")
  children = [
    benchmark.cis_v400_10_3_1,
    benchmark.cis_v400_10_3_2,
    benchmark.cis_v400_10_3_3,
    control.cis_v400_10_3_4,
    control.cis_v400_10_3_5,
    control.cis_v400_10_3_6,
    control.cis_v400_10_3_7,
    control.cis_v400_10_3_8,
    control.cis_v400_10_3_9,
    control.cis_v400_10_3_10,
    control.cis_v400_10_3_11,
    control.cis_v400_10_3_12
  ]

  tags = merge(local.cis_v400_10_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

benchmark "cis_v400_10_3_1" {
  title         = "10.3.1 Secrets and Keys"
  documentation = file("./cis_v400/docs/cis_v400_10_3_1.md")
  children = [
    control.cis_v400_10_3_1_1,
    control.cis_v400_10_3_1_2,
    control.cis_v400_10_3_1_3
  ]

  tags = merge(local.cis_v400_10_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/General"
  })
}

control "cis_v400_10_3_1_1" {
  title         = "10.3.1.1 Ensure that 'Enable key rotation reminders' is enabled for each Storage Account"
  description   = "Access Keys authenticate application access requests to data contained in Storage Accounts."
  query         = query.storage_account_key_rotation_reminder_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_1_1.md")

  tags = merge(local.cis_v400_10_3_1_common_tags, {
    cis_item_id = "10.3.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_10_3_1_2" {
  title         = "10.3.1.2 Ensure that Storage Account access keys are periodically regenerated"
  description   = "For increased security, regenerate storage account access keys periodically."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_10_3_1_2.md")

  tags = merge(local.cis_v400_10_3_1_common_tags, {
    cis_item_id = "10.3.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/General"
  })
}

control "cis_v400_10_3_1_3" {
  title         = "10.3.1.3 Ensure 'Allow storage account key access' for Azure Storage Accounts is 'Disabled'"
  description   = "Every secure request to an Azure Storage account must be authorized."
  query         = query.storage_account_shared_key_access_disabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_1_3.md")

  tags = merge(local.cis_v400_10_3_1_common_tags, {
    cis_item_id = "10.3.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

benchmark "cis_v400_10_3_2" {
  title         = "10.3.2 Networking"
  documentation = file("./cis_v400/docs/cis_v400_10_3_2.md")
  children = [
    control.cis_v400_10_3_2_1,
    control.cis_v400_10_3_2_2,
    control.cis_v400_10_3_2_3
  ]

  tags = merge(local.cis_v400_10_3_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/VPC"
  })
}

control "cis_v400_10_3_2_1" {
  title         = "10.3.2.1 Ensure Private Endpoints are used to access Storage Accounts"
  description   = "Use private endpoints for your Azure Storage accounts to allow clients and services to securely access data located over a network via an encrypted Private Link."
  query         = query.storage_account_private_endpoint_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_2_1.md")

  tags = merge(local.cis_v400_10_3_2_common_tags, {
    cis_item_id = "10.3.2.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_2_2" {
  title         = "10.3.2.2 Ensure that 'Public Network Access' is 'Disabled' for storage accounts"
  description   = "Disallowing public network access for a storage account overrides the public access settings for individual containers in that storage account for Azure Resource Manager Deployment Model storage accounts."
  query         = query.storage_account_public_network_access_disabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_2_2.md")

  tags = merge(local.cis_v400_10_3_2_common_tags, {
    cis_item_id = "10.3.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

control "cis_v400_10_3_2_3" {
  title         = "10.3.2.3 Ensure default network access rule for storage accounts is set to deny"
  description   = "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network."
  query         = query.storage_account_default_network_access_deny
  documentation = file("./cis_v400/docs/cis_v400_10_3_2_3.md")

  tags = merge(local.cis_v400_10_3_2_common_tags, {
    cis_item_id = "10.3.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/VPC"
  })
}

benchmark "cis_v400_10_3_3" {
  title         = "10.3.3 Identity and Access Management"
  documentation = file("./cis_v400/docs/cis_v400_10_3_3.md")
  children = [
    control.cis_v400_10_3_3_1
  ]

  tags = merge(local.cis_v400_10_3_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/IAM"
  })
}

control "cis_v400_10_3_3_1" {
  title         = "10.3.3.1 Ensure that 'Default to Microsoft Entra authorization in the Azure portal' is set to 'Enabled'"
  description   = "When this property is enabled, the Azure portal authorizes requests to blobs, files, queues, and tables with Microsoft Entra ID by default."
  query         = query.storage_account_default_to_oauth_authentication
  documentation = file("./cis_v400/docs/cis_v400_10_3_3_1.md")

  tags = merge(local.cis_v400_10_3_3_common_tags, {
    cis_item_id = "10.3.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/IAM"
  })
}

control "cis_v400_10_3_4" {
  title         = "10.3.4 Ensure that 'Secure transfer required' is set to 'Enabled'"
  description   = "Enable data encryption in transit."
  query         = query.storage_account_secure_transfer_required_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_4.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_5" {
  title         = "10.3.5 Ensure 'Allow Azure services on the trusted services list to access this storage account' is Enabled for Storage Account Access"
  description   = "This recommendation assumes that the `Public network access` parameter is set to `Enabled from selected virtual networks and IP addresses`."
  query         = query.storage_account_trusted_microsoft_services_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_5.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_6" {
  title         = "10.3.6 Ensure Soft Delete is Enabled for Azure Containers and Blob Storage"
  description   = "The Azure Storage blobs contain data like ePHI or Financial, which can be secret or personal."
  query         = query.storage_account_soft_delete_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_6.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_7" {
  title         = "10.3.7 Ensure the 'Minimum TLS version' for storage accounts is set to 'Version 1.2'"
  description   = "In some cases, Azure Storage sets the minimum TLS version to be version 1."
  query         = query.storage_account_min_tls_1_2
  documentation = file("./cis_v400/docs/cis_v400_10_3_7.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_8" {
  title         = "10.3.8 Ensure 'Cross Tenant Replication' is not enabled"
  description   = "Cross Tenant Replication in Azure allows data to be replicated across multiple Azure tenants."
  query         = query.storage_account_cross_tenant_replication_disabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_8.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_9" {
  title         = "10.3.9 Ensure that 'Allow Blob Anonymous Access' is set to 'Disabled'"
  description   = "The Azure Storage setting 'Allow Blob Anonymous Access' (aka \"allowBlobPublicAccess\") controls whether anonymous access is allowed for blob data in a storage account."
  query         = query.storage_account_blob_public_access_disabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_9.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_10" {
  title         = "10.3.10 Ensure Azure Resource Manager Delete locks are applied to Azure Storage Accounts"
  description   = "Azure Resource Manager _CannotDelete (Delete)_ locks can prevent users from accidentally or maliciously deleting a storage account."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_10_3_10.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_11" {
  title         = "10.3.11 Ensure Azure Resource Manager ReadOnly locks are considered for Azure Storage Accounts"
  description   = "Adding an Azure Resource Manager `ReadOnly` lock can prevent users from accidentally or maliciously deleting a storage account, modifying its properties and containers, or creating access assignments."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_10_3_11.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v400_10_3_12" {
  title         = "10.3.12 Ensure Redundancy is set to 'geo-redundant storage (GRS)' on critical Azure Storage Accounts"
  description   = "Geo-redundant storage (GRS) in Azure replicates data three times within the primary region using locally redundant storage (LRS) and asynchronously copies it to a secondary region hundreds of miles away."
  query         = query.storage_account_geo_redundant_enabled
  documentation = file("./cis_v400/docs/cis_v400_10_3_12.md")

  tags = merge(local.cis_v400_10_3_common_tags, {
    cis_item_id = "10.3.12"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

