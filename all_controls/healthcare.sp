locals {
  all_controls_healthcare_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/HealthcareAPIs"
  })
}

benchmark "all_controls_healthcare" {
  title       = "HealthcareAPIs"
  description = "This section contains recommendations for configuring HealthcareAPIs resources."
  children = [
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.healthcare_fhir_uses_private_link
  ]

  tags = merge(local.all_controls_healthcare_common_tags, {
    type = "Benchmark"
  })
}
