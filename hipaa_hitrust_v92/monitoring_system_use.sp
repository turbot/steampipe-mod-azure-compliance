benchmark "hipaa_hitrust_v92_monitoring_system_use" {
  title    = "Monitoring System Use"
  children = [
    benchmark.hipaa_hitrust_v92_1120_09ab3system_9_09_ab,
    benchmark.hipaa_hitrust_v92_12100_09ab2system_15_09_ab,
    benchmark.hipaa_hitrust_v92_12101_09ab1organizational_3_09_ab,
    benchmark.hipaa_hitrust_v92_1212_09ab1system_1_09_ab,
    benchmark.hipaa_hitrust_v92_1213_09ab2system_128_09_ab,
    benchmark.hipaa_hitrust_v92_1214_09ab2system_3456_09_ab,
    benchmark.hipaa_hitrust_v92_1215_09ab2system_7_09_ab,
    benchmark.hipaa_hitrust_v92_1216_09ab3system_12_09_ab,
    benchmark.hipaa_hitrust_v92_1217_09ab3system_3_09_ab,
    benchmark.hipaa_hitrust_v92_1219_09ab3system_10_09_ab,
    benchmark.hipaa_hitrust_v92_1220_09ab3system_56_09_ab,
    benchmark.hipaa_hitrust_v92_12102_09ab1organizational_4_09_ab
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1213_09ab2system_128_09_ab" {
  title    = "Automated systems deployed throughout the organization's environment are used to monitor key events and anomalous activity, and analyze system logs, the results of which are reviewed regularly"
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1220_09ab3system_56_09_ab" {
  title    = "Monitoring includes inbound and outbound communications and file integrity monitoring"
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1212_09ab1system_1_09_ab" {
  title    = "All applicable legal requirements related to monitoring authorized access and unauthorized access attempts are met"
  children = [
    control.monitor_log_profile_enabled_for_all_categories
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1219_09ab3system_10_09_ab" {
  title    = "The information system is able to automatically process audit records for events of interest based on selectable criteria"
  children = [
    control.monitor_log_profile_enabled_for_all_categories
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_12100_09ab2system_15_09_ab" {
  title    = "The organization monitors the information system to identify irregularities or anomalies that are indicators of a system malfunction or compromise and help confirm the system is functioning in an optimal, resilient and secure state"
  children = [
    control.compute_vm_log_analytics_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1215_09ab2system_7_09_ab" {
  title    = "Auditing and monitoring systems employed by the organization support audit reduction and report generation"
  children = [
    control.compute_vm_log_analytics_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1217_09ab3system_3_09_ab" {
  title    = "Alerts are generated for technical personnel to analyze and investigate suspicious activity or suspected violations"
  children = [
    control.compute_vm_log_analytics_agent_installed_windows
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_12101_09ab1organizational_3_09_ab" {
  title    = "The organization specifies how often audit logs are reviewed, how the reviews are documented, and the specific roles and responsibilities of the personnel conducting the reviews, including the professional certifications or other qualifications required"
  children = [
    control.compute_vm_scale_set_log_analytics_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1216_09ab3system_12_09_ab" {
  title    = "Automated systems are used to review monitoring activities of security systems (e.g., IPS/IDS) and system records on a daily basis, and identify and document anomalies"
  children = [
    control.compute_vm_scale_set_log_analytics_agent_installed
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1120_09ab3system_9_09_ab" {
  title    = "Unauthorized remote connections to the information systems are monitored and reviewed at least quarterly, and appropriate action is taken if an unauthorized connection is discovered"
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1214_09ab2system_3456_09_ab" {
  title    = "Monitoring includes privileged operations, authorized access or unauthorized access attempts, including attempts to access deactivated accounts, and system alerts or failures"
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_12102_09ab1organizational_4_09_ab" {
  title    = "The organization shall periodically test its monitoring and detection processes, remediate deficiencies, and improve its processes"
  children = [
    control.compute_vm_log_analytics_agent_installed_windows
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}