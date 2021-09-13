locals {
  conformance_pack_storage_common_tags = {
    service = "storage"
  }
}

control "storage_account_secure_transfer_required_enabled" {
  title       = "Secure transfer to storage accounts should be enabled"
  description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql         = query.storage_account_secure_transfer_required_enabled.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_default_network_access_rule_denied" {
  title       = "Storage accounts should restrict network access"
  description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  sql         = query.storage_account_default_network_access_rule_denied.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_use_virtual_service_endpoint" {
  title       = "Storage Accounts should use a virtual network service endpoint"
  description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
  sql         = query.storage_account_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "storage_azure_defender_enabled" {
  title       = "Azure Defender for Storage should be enabled"
  description = "Azure Defender for Storage provides detections of unusual and potentially harmful attempts to access or exploit storage accounts."
  sql         = query.storage_azure_defender_enabled.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_uses_private_link" {
  title       = "Storage accounts should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced."
  sql         = query.storage_account_uses_private_link.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_infrastructure_encryption_enabled" {
  title       = "Storage accounts should have infrastructure encryption"
  description = "Enable infrastructure encryption for higher level of assurance that the data is secure. When infrastructure encryption is enabled, data in a storage account is encrypted twice."
  sql         = query.storage_account_infrastructure_encryption_enabled.sql

  tags = merge(local.conformance_pack_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
