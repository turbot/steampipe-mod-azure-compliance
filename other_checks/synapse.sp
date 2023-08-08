locals {
  other_synapse_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/SynapseAnalytics"
  })
}

benchmark "other_synapse" {
  title = "Synapse Analytics"
  children = [
    control.synapse_workspace_data_exfil_protection_enabled
  ]

  tags = merge(local.other_synapse_common_tags, {
    type = "Benchmark"
  })
}
