locals {
  cis_v210_3_common_tags = merge(local.cis_v210_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_v210_3" {
  title         = "3 Storage Accounts"
  documentation = file("./cis_v210/docs/cis_v210_3.md")
  children = [
    control.cis_v210_3_1,
    control.cis_v210_3_2,
    control.cis_v210_3_3,
    control.cis_v210_3_4,
    control.cis_v210_3_5,
    control.cis_v210_3_6,
    control.cis_v210_3_7,
    control.cis_v210_3_8,
    control.cis_v210_3_9,
    control.cis_v210_3_10,
    control.cis_v210_3_11,
    control.cis_v210_3_12,
    control.cis_v210_3_13,
    control.cis_v210_3_14,
    control.cis_v210_3_15,
    control.cis_v210_3_16,
    control.cis_v210_3_17
  ]

  tags = merge(local.cis_v210_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/Storage"
  })
}

control "cis_v210_3_1" {
  title         = "3.1 Ensure that 'Secure transfer required' is set to 'Enabled'"
  description   = "Enable data encryption in transit."
  query         = query.storage_account_secure_transfer_required_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_1.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_2" {
  title         = "3.2 Ensure that 'Enable Infrastructure Encryption' for Each Storage Account in Azure Storage is Set to 'enabled'"
  description   = "Enabling encryption at the hardware level on top of the default software encryption for Storage Accounts accessing Azure storage solutions."
  query         = query.storage_account_infrastructure_encryption_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_2.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_3" {
  title         = "3.3 Ensure that 'Enable key rotation reminders' is enabled for each Storage Account"
  description   = "Access Keys authenticate application access requests to data contained in Storage Accounts. A periodic rotation of these keys is recommended to ensure that potentially compromised keys cannot result in a long-term exploitable credential. The 'Rotation Reminder' is an automatic reminder feature for a manual procedure."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_3_3.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_4" {
  title         = "3.4 Ensure that Storage Account Access Keys are Periodically Regenerated"
  description   = "For increased security, regenerate storage account access keys periodically."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_3_4.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_5" {
  title         = "3.5 Ensure Storage Logging is Enabled for Queue Service for 'Read', 'Write', and 'Delete' requests"
  description   = "The Storage Queue service stores messages that may be read by any client who has access to the storage account. A queue can contain an unlimited number of messages, each of which can be up to 64KB in size using version 2011-08-18 or newer. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account."
  query         = query.storage_account_queue_services_logging_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_5.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_6" {
  title         = "3.6 Ensure that Shared Access Signature Tokens Expire Within an Hour"
  description   = "Expire shared access signature tokens within an hour."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_3_6.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_7" {
  title         = "3.7 Ensure that 'Public Network Access' is `Disabled' for storage accounts"
  description   = "Disallowing public network access for a storage account overrides the public access settings for individual containers in that storage account for Azure Resource Manager Deployment Model storage accounts. Azure Storage accounts that use the classic deployment model will be retired on August 31, 2024."
  query         = query.storage_account_block_public_access
  documentation = file("./cis_v210/docs/cis_v210_3_7.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_8" {
  title         = "3.8 Ensure Default Network Access Rule for Storage Accounts is Set to Deny"
  description   = "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network. To limit access to selected networks, the default action must be changed."
  query         = query.storage_account_default_network_access_rule_denied
  documentation = file("./cis_v210/docs/cis_v210_3_8.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_9" {
  title         = "3.9 Ensure 'Allow Azure services on the trusted services list to access this storage account' is Enabled for Storage Account Access"
  description   = "Some Azure services that interact with storage accounts operate from networks that can't be granted access through network rules. To help this type of service work as intended, allow the set of trusted Azure services to bypass the network rules. These services will then use strong authentication to access the storage account."
  query         = query.storage_account_trusted_microsoft_services_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_9.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.9"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_10" {
  title         = "3.10 Ensure Private Endpoints are used to access Storage Accounts"
  description   = "Use private endpoints for your Azure Storage accounts to allow clients and services to securely access data located over a network via an encrypted Private Link. To do this, the private endpoint uses an IP address from the VNet for each service. Network traffic between disparate services securely traverses encrypted over the VNet."
  query         = query.storage_account_uses_private_link
  documentation = file("./cis_v210/docs/cis_v210_3_10.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_11" {
  title         = "3.11 Ensure Soft Delete is Enabled for Azure Containers and Blob Storage"
  description   = "The Azure Storage blobs contain data like ePHI or Financial, which can be secret or personal. Data that is erroneously modified or deleted by an application or other storage account user will cause data loss or unavailability."
  query         = query.storage_account_soft_delete_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_11.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_12" {
  title         = "3.12 Ensure Storage for Critical Data are Encrypted with Customer Managed Keys"
  description   = "Enable sensitive data encryption at rest using Customer Managed Keys rather than Microsoft Managed keys."
  query         = query.storage_account_encryption_at_rest_using_cmk
  documentation = file("./cis_v210/docs/cis_v210_3_12.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.12"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_13" {
  title         = "3.13 Ensure Storage logging is Enabled for Blob Service for 'Read', 'Write', and 'Delete' requests"
  description   = "The Storage Blob service provides scalable, cost-efficient object storage in the cloud. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the blobs. Storage Logging log entries contain the following information about individual requests: timing information such as start time, end-to-end latency, and server latency; authentication details; concurrency information; and the sizes of the request and response messages."
  query         = query.storage_account_blob_service_logging_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_13.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.13"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_14" {
  title         = "3.14 Ensure Storage Logging is Enabled for Table Service for 'Read', 'Write', and 'Delete' Requests"
  description   = "Azure Table storage is a service that stores structured NoSQL data in the cloud, providing a key/attribute store with a schema-less design. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the tables. Storage Logging log entries contain the following information about individual requests: timing information such as start time, end-to-end latency, and server latency; authentication details; concurrency information; and the sizes of the request and response messages."
  query         = query.storage_account_table_service_logging_enabled
  documentation = file("./cis_v210/docs/cis_v210_3_14.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.14"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_15" {
  title         = "3.15 Ensure the 'Minimum TLS version' for storage accounts is set to 'Version 1.2'"
  description   = "In some cases, Azure Storage sets the minimum TLS version to be version 1.0 by default. TLS 1.0 is a legacy version and has known vulnerabilities. This minimum TLS version can be configured to be later protocols such as TLS 1.2."
  query         = query.storage_account_min_tls_1_2
  documentation = file("./cis_v210/docs/cis_v210_3_15.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.15"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_16" {
  title         = "3.16 Ensure 'Cross Tenant Replication' is not enabled"
  description   = "Cross Tenant Replication in Azure allows data to be replicated across multiple Azure tenants. While this feature can be beneficial for data sharing and availability, it also poses a significant security risk if not properly managed. Unauthorized data access, data leakage, and compliance violations are potential risks. Disabling Cross Tenant Replication ensures that data is not inadvertently replicated across different tenant boundaries without explicit authorization."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_3_16.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.16"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v210_3_17" {
  title         = "3.17 Ensure that `Allow Blob Anonymous Access` is set to `Disabled`"
  description   = "The Azure Storage setting 'Allow Blob Anonymous Access' (aka 'allowBlobPublicAccess') controls whether anonymous access is allowed for blob data in a storage account. When this property is set to True, it enables public read access to blob data, which can be convenient for sharing data but may carry security risks. When set to False, it disallows public access to blob data, providing a more secure storage environment."
  query         = query.storage_account_blob_containers_public_access_private
  documentation = file("./cis_v210/docs/cis_v210_3_17.md")

  tags = merge(local.cis_v210_3_common_tags, {
    cis_item_id = "3.17"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}
