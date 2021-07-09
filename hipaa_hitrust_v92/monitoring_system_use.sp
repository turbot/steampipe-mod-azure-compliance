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
    control.hipaa_hitrust_v92_1213_09ab2system_128_09_ab_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1213_09ab2system_128_09_ab_1" {
  title         = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  description   = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
  sql           = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1220_09ab3system_56_09_ab" {
  title         = "1220.09ab3System.56 - 09.ab"
  description   = "Monitoring includes inbound and outbound communications and file integrity monitoring."
  children = [
    control.hipaa_hitrust_v92_1220_09ab3system_56_09_ab_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1220_09ab3system_56_09_ab_1" {
  title         = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  description   = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
  sql           = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}