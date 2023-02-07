locals {
  regulatory_compliance_cognitive_common_tags = {
    service = "Azure/CognitiveServices"
  }
}

control "cognitive_service_local_auth_disabled" {
  title       = "Cognitive Services accounts should have local authentication methods disabled"
  description = "Disabling local authentication methods improves security by ensuring that Cognitive Services accounts require Azure Active Directory identities exclusively for authentication."
  query       = query.cognitive_service_local_auth_disabled

  tags = merge(local.regulatory_compliance_cognitive_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_private_link_used" {
  title       = "Cognitive Services should use private link"
  description = "Azure Private Link lets you connect your virtual networks to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Cognitive Services, you'll reduce the potential for data leakage."
  query       = query.cognitive_account_private_link_used

  tags = merge(local.regulatory_compliance_cognitive_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_public_network_access_disabled" {
  title       = "Cognitive Services accounts should disable public network access"
  description = "Disabling public network access improves security by ensuring that Cognitive Services account isn't exposed on the public internet. Creating private endpoints can limit exposure of Cognitive Services account."
  query       = query.cognitive_account_public_network_access_disabled

  tags = merge(local.regulatory_compliance_cognitive_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_restrict_public_access" {
  title       = "Cognitive Services accounts should restrict network access"
  description = "Network access to Cognitive Services accounts should be restricted. Configure network rules so only applications from allowed networks can access the Cognitive Services account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges."
  query       = query.cognitive_account_restrict_public_access

  tags = merge(local.regulatory_compliance_cognitive_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "cognitive_account_encrypted_with_cmk" {
  title       = "Cognitive Services accounts should enable data encryption with a customer-managed key"
  description = "Customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data stored in Cognitive Services to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  query       = query.cognitive_account_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_cognitive_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

