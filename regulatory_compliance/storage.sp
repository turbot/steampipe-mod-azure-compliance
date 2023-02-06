locals {
  regulatory_compliance_storage_common_tags = {
    service = "Azure/Storage"
  }
}

control "storage_account_secure_transfer_required_enabled" {
  title       = "Secure transfer to storage accounts should be enabled"
  description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
  sql         = query.storage_account_secure_transfer_required_enabled.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_default_network_access_rule_denied" {
  title       = "Storage accounts should restrict network access"
  description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  sql         = query.storage_account_default_network_access_rule_denied.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321 = "true"
  })
}

control "storage_account_use_virtual_service_endpoint" {
  title       = "Storage Accounts should use a virtual network service endpoint"
  description = "This policy audits any Storage Account not configured to use a virtual network service endpoint."
  sql         = query.storage_account_use_virtual_service_endpoint.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "storage_azure_defender_enabled" {
  title       = "Azure Defender for Storage should be enabled"
  description = "Azure Defender for Storage provides detections of unusual and potentially harmful attempts to access or exploit storage accounts."
  sql         = query.storage_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_uses_private_link" {
  title       = "Storage accounts should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced."
  sql         = query.storage_account_uses_private_link.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_infrastructure_encryption_enabled" {
  title       = "Storage accounts should have infrastructure encryption"
  description = "Enable infrastructure encryption for higher level of assurance that the data is secure. When infrastructure encryption is enabled, data in a storage account is encrypted twice."
  sql         = query.storage_account_infrastructure_encryption_enabled.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_block_public_access" {
  title       = "Storage account public access should be disallowed"
  description = "Anonymous public read access to containers and blobs in Azure Storage is a convenient way to share data but might present security risks. To prevent data breaches caused by undesired anonymous access, Microsoft recommends preventing public access to a storage account unless your scenario requires it."
  sql         = query.storage_account_block_public_access.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}


control "storage_account_restrict_network_access" {
  title       = "Storage accounts should restrict network access using virtual network rules"
  description = "Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts."
  sql         = query.storage_account_restrict_network_access.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "storage_account_geo_redundant_enabled" {
  title       = "Geo-redundant storage should be enabled for Storage Accounts"
  description = "Use geo-redundancy to create highly available applications."
  sql         = query.storage_account_geo_redundant_enabled.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_encryption_at_rest_using_cmk" {
  title       = "Storage accounts should use customer-managed key for encryption"
  description = "Secure your storage account with greater flexibility using customer-managed keys. When you specify a customer-managed key, that key is used to protect and control access to the key that encrypts your data. Using customer-managed keys provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
  sql         = query.storage_account_encryption_at_rest_using_cmk.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_uses_azure_resource_manager" {
  title       = "Storage accounts should be migrated to new Azure Resource Manager resources"
  description = "Use new Azure Resource Manager for your storage accounts to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management."
  sql         = query.storage_account_uses_azure_resource_manager.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "storage_account_encryption_scopes_encrypted_at_rest_with_cmk" {
  title       = "Storage account encryption scopes should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to manage the encryption at rest of your storage account encryption scopes. Customer-managed keys enable the data to be encrypted with an Azure key-vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.storage_account_encryption_scopes_encrypted_at_rest_with_cmk.sql

  tags = merge(local.regulatory_compliance_storage_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}




