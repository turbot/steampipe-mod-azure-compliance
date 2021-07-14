benchmark "hipaa_hitrust_v92_monitoring_system_use" {
  title         = "Monitoring System Use"
  children = [
    benchmark.hipaa_hitrust_v92_1213_09ab2system_128_09_ab,
    benchmark.hipaa_hitrust_v92_1220_09ab3system_56_09_ab
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1213_09ab2system_128_09_ab" {
  title         = "1213.09ab2System.128 - 09.ab"
  description   = "Automated systems deployed throughout the organization's environment are used to monitor key events and anomalous activity, and analyze system logs, the results of which are reviewed regularly."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1220_09ab3system_56_09_ab" {
  title         = "1220.09ab3System.56 - 09.ab"
  description   = "Monitoring includes inbound and outbound communications and file integrity monitoring."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}