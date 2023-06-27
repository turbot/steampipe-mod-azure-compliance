locals {
  hipaa_hitrust_v92_common_tags = merge(local.azure_compliance_common_tags, {
    hipaa_hitrust_v92 = "true"
    type              = "Benchmark"
  })
}

benchmark "hipaa_hitrust_v92" {
  title       = "HIPAA HITRUST 9.2"
  description = "The HIPAA HITRUST 9.2 provides a combined set of predefined compliance and security best-practice checks for Health Insurance Portability and Accountability Act."
  children = [
    benchmark.hipaa_hitrust_v92_privilege_management,
    benchmark.hipaa_hitrust_v92_user_authentication_for_external_connections,
    benchmark.hipaa_hitrust_v92_user_identification_and_authentication,
    benchmark.hipaa_hitrust_v92_endpoint_protection,
    benchmark.hipaa_hitrust_v92_portable_media_security,
    benchmark.hipaa_hitrust_v92_identification_of_risks_related_to_external_parties,
    benchmark.hipaa_hitrust_v92_configuration_management,
    benchmark.hipaa_hitrust_v92_vulnerability_management,
    benchmark.hipaa_hitrust_v92_network_protection,
    benchmark.hipaa_hitrust_v92_back_up,
    benchmark.hipaa_hitrust_v92_network_controls,
    benchmark.hipaa_hitrust_v92_on_line_transactions,
    benchmark.hipaa_hitrust_v92_transmission_protection,
    benchmark.hipaa_hitrust_v92_control_of_operational_software,
    benchmark.hipaa_hitrust_v92_access_control,
    benchmark.hipaa_hitrust_v92_audit_logging_and_monitoring,
    benchmark.hipaa_hitrust_v92_education_training_and_awareness,
    benchmark.hipaa_hitrust_v92_third_party_assurance,
    benchmark.hipaa_hitrust_v92_business_continuity_and_disaster_recovery
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}
