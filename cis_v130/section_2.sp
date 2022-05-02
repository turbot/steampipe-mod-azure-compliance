locals {
  cis_v130_2_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "2"
  })
}

benchmark "cis_v130_2" {
  title         = "2 Security Center"
  documentation = file("./cis_v130/docs/cis_v130_2.md")
  children = [
    control.cis_v130_2_1,
    control.cis_v130_2_2,
    control.cis_v130_2_3,
    control.cis_v130_2_4,
    control.cis_v130_2_5,
    control.cis_v130_2_6,
    control.cis_v130_2_7,
    control.cis_v130_2_8,
    control.cis_v130_2_9,
    control.cis_v130_2_10,
    control.cis_v130_2_11,
    control.cis_v130_2_12,
    control.cis_v130_2_13,
    control.cis_v130_2_14,
    control.cis_v130_2_15
  ]

  tags = merge(local.cis_v130_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_1" {
  title         = "2.1 Ensure that Azure Defender is set to On for Servers"
  description   = "Turning on Azure Defender enables threat detection for Server, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_server.sql
  documentation = file("./cis_v130/docs/cis_v130_2_1.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_2" {
  title         = "2.2 Ensure that Azure Defender is set to On for App Service"
  description   = "Turning on Azure Defender enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_appservice.sql
  documentation = file("./cis_v130/docs/cis_v130_2_2.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.2"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_3" {
  title         = "2.3 Ensure that Azure Defender is set to On for Azure SQL database servers"
  description   = "Turning on Azure Defender enables threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_sqldb.sql
  documentation = file("./cis_v130/docs/cis_v130_2_3.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.3"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_4" {
  title         = "2.4 Ensure that Azure Defender is set to On for SQL servers on machines"
  description   = "Turning on Azure Defender enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_sqlservervm.sql
  documentation = file("./cis_v130/docs/cis_v130_2_4.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.4"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_5" {
  title         = "2.5 Ensure that Azure Defender is set to On for Storage"
  description   = "Turning on Azure Defender enables threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_storage.sql
  documentation = file("./cis_v130/docs/cis_v130_2_5.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.5"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_6" {
  title         = "2.6 Ensure that Azure Defender is set to On for Kubernetes"
  description   = "Turning on Azure Defender enables threat detection for Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_k8s.sql
  documentation = file("./cis_v130/docs/cis_v130_2_6.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.6"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_7" {
  title         = "2.7 Ensure that Azure Defender is set to On for Container Registries"
  description   = "Turning on Azure Defender enables threat detection for Container Registries, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_containerregistry.sql
  documentation = file("./cis_v130/docs/cis_v130_2_7.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.7"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_8" {
  title         = "2.8 Ensure that Azure Defender is set to On for Key Vault"
  description   = "Turning on Azure Defender enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql           = query.securitycenter_azure_defender_on_for_keyvault.sql
  documentation = file("./cis_v130/docs/cis_v130_2_8.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.8"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_9" {
  title         = "2.9 Ensure that Windows Defender ATP (WDATP) integration with Security Center is selected"
  description   = "This setting enables Windows Defender ATP (WDATP) integration with Security Center."
  sql           = query.securitycenter_wdatp_integration.sql
  documentation = file("./cis_v130/docs/cis_v130_2_9.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.9"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_10" {
  title         = "2.10 Ensure that Microsoft Cloud App Security (MCAS) integration with Security Center is selected"
  description   = "This setting enables Microsoft Cloud App Security (MCAS) integration with Security Center."
  sql           = query.securitycenter_mcas_integration.sql
  documentation = file("./cis_v130/docs/cis_v130_2_10.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.10"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_11" {
  title         = "2.11 Ensure that 'Automatic provisioning of monitoring agent' is set to 'On'"
  description   = "Enable automatic provisioning of the monitoring agent to collect security data."
  sql           = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql
  documentation = file("./cis_v130/docs/cis_v130_2_11.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.11"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_12" {
  title         = "2.12 Ensure any of the ASC Default policy setting is not set to \"Disabled\""
  description   = "None of the settings offered by ASC Default policy should be set to effect \"Disabled\"."
  sql           = query.securitycenter_asc_default_setting_not_disabled.sql
  documentation = file("./cis_v130/docs/cis_v130_2_12.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.12"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_13" {
  title         = "2.13 Ensure 'Additional email addresses' is configured with a security contact email"
  description   = "Security Center emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  sql           = query.securitycenter_additional_email_configured.sql
  documentation = file("./cis_v130/docs/cis_v130_2_13.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.13"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_14" {
  title         = "2.14 Ensure that 'Notify about alerts with the following severity' is set to 'High'"
  description   = "Enables emailing security alerts to the subscription owner or other designated security contact."
  sql           = query.securitycenter_notify_alerts_configured.sql
  documentation = file("./cis_v130/docs/cis_v130_2_14.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.14"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v130_2_15" {
  title         = "2.15 Ensure that 'All users with the following roles' is set to 'Owner'"
  description   = "Enable security alert emails to subscription owners."
  sql           = query.securitycenter_security_alerts_to_owner_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_2_15.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id = "2.15"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

