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
    soc_2                = "true"
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
    nist_sp_800_53_rev_5 = "true",
    soc_2_cc_2           = "true"
  })
}

control "securitycenter_additional_email_configured" {
  title       = "Ensure 'Additional email addresses' is configured with a security contact email."
  description = "Security Center emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  sql         = query.securitycenter_additional_email_configured.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_sqlservervm" {
  title       = "Azure Defender for SQL should be enabled for unprotected SQL Managed Instances"
  description = "Audit each SQL Managed Instance without advanced data security."
  sql         = query.securitycenter_azure_defender_on_for_sqlservervm.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    soc_2                = "true"
  })
}

control "securitycenter_azure_defender_on_for_containerregistry" {
  title       = "Ensure that Azure Defender is set to On for Container Registries."
  description = "Enabling Azure Defender threat detection for Container Registries, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC)."
  sql         = query.securitycenter_azure_defender_on_for_containerregistry.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_k8s" {
  title       = "Ensure that Azure Defender is set to On for Kubernetes."
  description = "Enabling Azure Defender threat detection for Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC)."
  sql         = query.securitycenter_azure_defender_on_for_k8s.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_keyvault" {
  title       = "Ensure that Azure Defender is set to On for Key Vault."
  description = "Enabling Azure Defender threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC)."
  sql         = query.securitycenter_azure_defender_on_for_keyvault.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_server" {
  title       = "Ensure that Azure Defender is set to On for Servers"
  description = "Enabling Azure Defender threat detection for Server, provides threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql         = query.securitycenter_azure_defender_on_for_server.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_sqldb" {
  title       = "Ensure that Azure Defender is set to On for Azure SQL database servers."
  description = "Enabling Azure Defender threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in- depth, with threat detection provided by the Microsoft Security Response Center (MSRC)."
  sql         = query.securitycenter_azure_defender_on_for_sqldb.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_azure_defender_on_for_storage" {
  title       = "Ensure that Azure Defender is set to On for Storage."
  description = "Enabling Azure Defender threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center. It also allows for greater defense-in-depth, with threat detection provided by the Microsoft Security Response Center (MSRC)."
  sql         = query.securitycenter_azure_defender_on_for_storage.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_asc_default_setting_not_disabled" {
  title       = "Ensure any of the ASC Default policy setting is not set to 'Disabled'."
  description = "None of the settings offered by ASC Default policy should be set to effect Disabled."
  sql         = query.securitycenter_asc_default_setting_not_disabled.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_mcas_integration" {
  title       = "Ensure that Microsoft Cloud App Security (MCAS) integration with Security Center is selected."
  description = "By analyzing the Azure Resource Manager records, Security Center detects unusual or potentially harmful operations in the Azure subscription environment. Several of the preceding analytics are powered by Microsoft Cloud App Security. To benefit from these analytics, subscription must have a Cloud App Security license. MCAS works only with Standard Tier subscriptions."
  sql         = query.securitycenter_mcas_integration.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}

control "securitycenter_wdatp_integration" {
  title       = "Ensure that Windows Defender ATP (WDATP) integration with Security Center is selected."
  description = "This setting enables Windows Defender ATP (WDATP) integration with Security Center. WDATP integration brings comprehensive Endpoint Detection and Response (EDR) capabilities within security center. This integration helps to spot abnormalities, detect and respond to advanced attacks on Windows server endpoints monitored by Azure Security Center."
  sql         = query.securitycenter_wdatp_integration.sql

  tags = merge(local.regulatory_compliance_securitycenter_common_tags, {
    soc_2 = "true"
  })
}