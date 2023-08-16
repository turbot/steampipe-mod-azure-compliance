locals {
  fundamental_security_synapse_common_tags = {
    service = "Azure/SynapseAnalytics"
  }
}

benchmark "fundamental_security_synapse" {
  title       = "SynapseAnalytics"
  description = "This section contains recommendations for configuring SynapseAnalytics resources."
  children = [
    control.synapse_workspace_data_exfiltration_protection_enabled,
    control.synapse_workspace_encryption_at_rest_using_cmk,
    control.synapse_workspace_private_link_used,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]
}
