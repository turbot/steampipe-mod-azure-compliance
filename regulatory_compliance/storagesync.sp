locals {
  regulatory_compliance_storagesync_common_tags = {
    service = "Azure/FileSync"
  }
}

control "storage_sync_private_link_used" {
  title       = "Azure File Sync should use private link"
  description = "Creating a private endpoint for the indicated Storage Sync Service resource allows you to address your Storage Sync Service resource from within the private IP address space of your organization's network, rather than through the internet-accessible public endpoint. Creating a private endpoint by itself does not disable the public endpoint."
  query       = query.storage_sync_private_link_used

  tags = merge(local.regulatory_compliance_storagesync_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

