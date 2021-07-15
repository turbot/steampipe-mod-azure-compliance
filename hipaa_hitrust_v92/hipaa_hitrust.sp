locals {
  hipaa_hitrust_v92_common_tags = {
    hipaa_hitrust_v92 = "true"
    plugin             = "azure"
  }
}

benchmark "hipaa_hitrust_v92" {
  title       = "HIPAA HITRUST 9.2 Controls"
  description = "The "
  children = [
    benchmark.hipaa_hitrust_v92_privilege_management,
    benchmark.hipaa_hitrust_v92_network_connection_control,
    benchmark.hipaa_hitrust_v92_identification_of_risks_related_to_external_parties,
    benchmark.hipaa_hitrust_v92_audit_logging,
    benchmark.hipaa_hitrust_v92_monitoring_system_use,
    benchmark.hipaa_hitrust_v92_segregation_of_duties,
    benchmark.hipaa_hitrust_v92_network_controls,
    benchmark.hipaa_hitrust_v92_security_of_network_services,
    benchmark.hipaa_hitrust_v92_management_of_removable_media,benchmark.hipaa_hitrust_v92_information_exchange_policies_and_procedures,
    benchmark.hipaa_hitrust_v92_on_line_transactions,
    benchmark.hipaa_hitrust_v92_control_of_technical_vulnerabilities,
    benchmark.hipaa_hitrust_v92_remote_diagnostic_and_configuration_port_protection,
    benchmark.hipaa_hitrust_v92_back_up,
    benchmark.hipaa_hitrust_v92_business_continuity_and_risk_assessment,
    benchmark.hipaa_hitrust_v92_user_identification_and_authentication,
    benchmark.hipaa_hitrust_v92_segregation_in_networks,
  ]
  tags = local.hipaa_hitrust_v92_common_tags
}