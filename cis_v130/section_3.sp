locals {
  cis_v130_3_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_v130_3" {
  title         = "3 Storage Accounts"
  documentation = file("./cis_v130/docs/cis_v130_3.md")
  children = [
    control.cis_v130_3_1,
    control.cis_v130_3_2,
    control.cis_v130_3_3,
    control.cis_v130_3_4,
    control.cis_v130_3_5,
    control.cis_v130_3_6,
    control.cis_v130_3_7,
    control.cis_v130_3_8,
    control.cis_v130_3_9,
    control.cis_v130_3_10,
    control.cis_v130_3_11
  ]

  tags = merge(local.cis_v130_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v130_3_1" {
  title         = "3.1 Ensure that 'Secure transfer required' is set to 'Enabled'"
  description   = "Enable data encryption in transit."
  sql           = query.storage_account_secure_transfer_required_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_3_1.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_2" {
  title         = "3.2 Ensure that storage account access keys are periodically regenerated"
  description   = "Regenerate storage account access keys periodically."
  sql           = query.manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_3_2.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_3" {
  title         = "3.3 Ensure Storage logging is enabled for Queue service for read, write, and delete requests"
  description   = "The Storage Queue service stores messages that may be read by any client who has access to the storage account. A queue can contain an unlimited number of messages, each of which can be up to 64KB in size using version 2011-08-18 or newer. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the queues. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details , concurrency information and the sizes of the request and response messages."
  sql           = query.storage_account_queue_services_logging_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_3_3.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_4" {
  title         = "3.4 Ensure that shared access signature tokens expire within an hour"
  description   = "A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. A shared access signature can be provided to clients who should not be trusted with the storage account key but for whom it may be necessary to delegate access to certain storage account resources. Providing a shared access signature URI to these clients allows them access to a resource for a specified period of time. This time should be set as low as possible and preferably no longer than an hour."
  sql           = query.manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_3_4.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_5" {
  title         = "3.5 Ensure that 'Public access level' is set to Private for blob containers"
  description   = "Disable anonymous access to blob containers and disallow blob public access on storage account."
  sql           = query.storage_account_blob_containers_public_access_private.sql
  documentation = file("./cis_v130/docs/cis_v130_3_5.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_6" {
  title         = "3.6 Ensure default network access rule for Storage Accounts is set to deny"
  description   = "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network. To limit access to selected networks, the default action must be changed."
  sql           = query.storage_account_default_network_access_rule_denied.sql
  documentation = file("./cis_v130/docs/cis_v130_3_6.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_7" {
  title         = "3.7 Ensure 'Trusted Microsoft Services' is enabled for Storage Account access"
  description   = "Some Microsoft services that interact with storage accounts operate from networks that can't be granted access through network rules. To help this type of service work as intended, allow the set of trusted Microsoft services to bypass the network rules. These services will then use strong authentication to access the storage account. If the Allow trusted Microsoft services exception is enabled, the following services: Azure Backup, Azure Site Recovery, Azure DevTest Labs, Azure Event Grid, Azure Event Hubs, Azure Networking, Azure Monitor and Azure SQL Data Warehouse (when registered in the subscription), are granted access to the storage account."
  sql           = query.storage_account_trusted_microsoft_services_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_3_7.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_8" {
  title         = "3.8 Ensure soft delete is enabled for Azure Storage"
  description   = "The Azure Storage blobs contain data like ePHI, Financial, secret or personal. Erroneously modified or deleted accidentally by an application or other storage account user cause data loss or data unavailability. It is recommended the Azure Storage be made recoverable by enabling soft delete configuration. This is to save and recover data when blobs or blob snapshots are deleted."
  sql           = query.storage_account_soft_delete_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_3_8.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_9" {
  title         = "3.9 Ensure storage for critical data are encrypted with Customer Managed Key"
  description   = "Enable sensitive data encryption at rest using Customer Managed Keys rather than Microsoft Managed keys"
  sql           = query.storage_account_encryption_at_rest_using_cmk.sql
  documentation = file("./cis_v130/docs/cis_v130_3_9.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.9"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/StorageM"
  })
}

control "cis_v130_3_10" {
  title         = "3.10 Ensure Storage logging is enabled for Blob service for read, write, and delete requests"
  description   = "The Storage Blob service provides scalable, cost-efficient objective storage in the cloud. Storage Logging happens server-side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the blobs. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details , concurrency information and the sizes of the request and response messages."
  sql           = query.storage_account_blob_service_logging_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_3_10.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}

control "cis_v130_3_11" {
  title         = "3.11 Ensure Storage logging is enabled for Table service for read, write, and delete requests"
  description   = "The Storage Table storage is a service that stores structure NoSQL data in the cloud, providing a key/attribute store with a schema less design. Storage Logging happens server- side and allows details for both successful and failed requests to be recorded in the storage account. These logs allow users to see the details of read, write, and delete operations against the tables. Storage Logging log entries contain the following information about individual requests: Timing information such as start time, end-to-end latency, and server latency, authentication details , concurrency information and the sizes of the request and response messages."
  sql           = query.manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_3_11.md")

  tags = merge(local.cis_v130_3_common_tags, {
    cis_item_id = "3.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Storage"
  })
}
