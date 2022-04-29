locals {
  regulatory_compliance_machinelearning_common_tags = {
    service = "Azure/MachineLearning"
  }
}

control "machine_learning_workspace_encrypted_with_cmk" {
  title       = "Azure Machine Learning workspaces should be encrypted with a customer-managed key"
  description = "Manage encryption at rest of Azure Machine Learning workspace data with customer-managed keys. By default, customer data is encrypted with service-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
  sql         = query.machine_learning_workspace_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_machinelearning_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

