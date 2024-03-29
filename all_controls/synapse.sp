locals {
  all_controls_synapse_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/SynapseAnalytics"
  })
}

benchmark "all_controls_synapse" {
  title       = "Synapse Analytics"
  description = "This section contains recommendations for configuring Synapse Analytics resources."
  children = [
    control.synapse_workspace_data_exfiltration_protection_enabled,
    control.synapse_workspace_encryption_at_rest_using_cmk,
    control.synapse_workspace_private_link_used,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]

  tags = merge(local.all_controls_synapse_common_tags, {
    type = "Benchmark"
  })
}
