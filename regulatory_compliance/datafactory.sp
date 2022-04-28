locals {
  regulatory_compliance_datafactory_common_tags = {
    service = "Azure/DataFactory"
  }
}

control "data_factory_uses_private_link" {
  title       = "Azure Data Factory should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Data Factory, data leakage risks are reduced."
  sql         = query.data_factory_uses_private_link.sql

  tags = merge(local.regulatory_compliance_datafactory_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "data_factory_encrypted_with_cmk" {
  title       = "Azure data factories should be encrypted with a customer-managed key"
  description = "Use customer-managed keys to manage the encryption at rest of your Azure Data Factory. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.data_factory_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_datafactory_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

