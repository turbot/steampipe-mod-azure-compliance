locals {
  regulatory_compliance_securitycenter_common_tags = {
    service = "securitycenter"
  }
}

control "securitycenter_automatic_provisioning_monitoring_agent_on" {
  title       = "Auto provisioning of the Log Analytics agent should be enabled on your subscription"
  description = "To monitor for security vulnerabilities and threats, Azure Security Center collects data from your Azure virtual machines. Data is collected by the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. We recommend enabling auto provisioning to automatically deploy the agent to all supported Azure VMs and any new ones that are created."
  sql         = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_notify_alerts_configured" {
  title       = "Email notification for high severity alerts should be enabled"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, enable email notifications for high severity alerts in Security Center."
  sql         = query.securitycenter_notify_alerts_configured.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_security_alerts_to_owner_enabled" {
  title       = "Email notification to subscription owner for high severity alerts should be enabled"
  description = "To ensure your subscription owners are notified when there is a potential security breach in their subscription, set email notifications to subscription owners for high severity alerts in Security Center."
  sql         = query.securitycenter_security_alerts_to_owner_enabled.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "securitycenter_email_configured" {
  title       = "Subscriptions should have a contact email address for security issues"
  description = "To ensure the relevant people in your organization are notified when there is a potential security breach in one of your subscriptions, set a security contact to receive email notifications from Security Center."
  sql         = query.securitycenter_email_configured.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

