locals {
  regulatory_compliance_synapse_common_tags = {
    service = "Azure/SynapseAnalytics"
  }
}

control "synapse_workspace_private_link_used" {
  title       = "Azure Synapse workspaces should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Synapse workspace, data leakage risks are reduced."
  query       = query.synapse_workspace_private_link_used

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "synapse_workspace_vulnerability_assessment_enabled" {
  title       = "Vulnerability assessment should be enabled on your Synapse workspaces"
  description = "Discover, track, and remediate potential vulnerabilities by configuring recurring SQL vulnerability assessment scans on your Synapse workspaces."
  query       = query.synapse_workspace_vulnerability_assessment_enabled

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "synapse_workspace_encryption_at_rest_using_cmk" {
  title       = "Azure Synapse workspaces should use customer-managed keys to encrypt data at rest"
  description = "Use customer-managed keys to control the encryption at rest of the data stored in Azure Synapse workspaces. Customer-managed keys deliver double encryption by adding a second layer of encryption on top of the default encryption with service-managed keys."
  query       = query.synapse_workspace_encryption_at_rest_using_cmk

  tags = merge(local.regulatory_compliance_synapse_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
