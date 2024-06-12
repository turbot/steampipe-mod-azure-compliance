locals {
  fedramp_high_common_tags = merge(local.azure_compliance_common_tags, {
    fedramp_high = "true"
    type         = "Benchmark"
  })
}

benchmark "fedramp_high" {
  title = "FedRAMP High Regulatory Compliance"
  description = "This benchmark ensures that the Azure resources are compliant with the FedRAMP High regulatory standard."
  // documentation = ("")

  children = [
    benchmark.fedramp_high_access_control,
    benchmark.fedramp_high_audit_and_accountability,
    benchmark.fedramp_high_configuration_management,
    benchmark.fedramp_high_contingency_planning,
    benchmark.fedramp_high_risk_assessment,
    benchmark.fedramp_high_incident_response,
    benchmark.fedramp_high_identication_and_authentication,
    benchmark.fedramp_high_system_and_communication_protection,
  ]

  tags = local.fedramp_high_common_tags
}