locals {
  fundamental_security_healthcare_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/HealthcareAPIs"
  })
}

benchmark "fundamental_security_healthcare" {
  title       = "HealthcareAPIs"
  description = "This section contains recommendations for configuring HealthcareAPIs resources."
  children = [
    control.healthcare_fhir_azure_api_encrypted_at_rest_with_cmk,
    control.healthcare_fhir_uses_private_link
  ]

  tags = merge(local.fundamental_security_healthcare_common_tags, {
    type = "Benchmark"
  })
}
