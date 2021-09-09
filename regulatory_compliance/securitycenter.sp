locals {
  conformance_pack_securitycenter_common_tags = {
    service = "securitycenter"
  }
}

control "securitycenter_automatic_provisioning_monitoring_agent_on" {
  title       = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  description = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
  sql         = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql

  tags = merge(local.conformance_pack_securitycenter_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}
