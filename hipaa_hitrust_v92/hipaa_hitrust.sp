locals {
  hipaa_hitrust_v92_common_tags = {
    hipaa_hitrust_v92 = "true"
    plugin             = "azure"
  }
}

benchmark "hipaa_hitrust_v92" {
  title       = "HIPAA HITRUST 9.2 Controls"
  description = "The Reserve Bank had prescribed a set of baseline cyber security controls for primary (Urban) cooperative banks (UCBs) in October 2018. On further examination, it has been decided to prescribe a comprehensive cyber security framework for the UCBs, as a graded approach, based on their digital depth and interconnectedness with the payment systems landscape, digital products offered by them and assessment of cyber security risk. The framework would mandate implementation of progressively stronger security measures based on the nature, variety and scale of digital product offerings of banks."
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
    benchmark.hipaa_hitrust_v92_control_of_technical_vulnerabilities
  ]
  tags = local.hipaa_hitrust_v92_common_tags
}