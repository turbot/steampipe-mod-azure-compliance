locals {
  cis_v150_2_common_tags = merge(local.cis_v150_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v150_2_1_common_tags = merge(local.cis_v150_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v150_2_2_common_tags = merge(local.cis_v150_2_common_tags, {
    cis_section_id = "2.2"
  })
  cis_v150_2_3_common_tags = merge(local.cis_v150_2_common_tags, {
    cis_section_id = "2.3"
  })
}

benchmark "cis_v150_2" {
  title         = "2 Microsoft Defender for Cloud"
  documentation = file("./cis_v150/docs/cis_v150_2.md")
  children = [
    benchmark.cis_v150_2_1,
    benchmark.cis_v150_2_2,
    benchmark.cis_v150_2_3,
    benchmark.cis_v150_2_4,
    control.cis_v150_2_5,
    control.cis_v150_2_6
  ]

  tags = merge(local.cis_v150_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

benchmark "cis_v150_2_1" {
  title         = "2.1 Defender Plans"
  documentation = file("./cis_v150/docs/cis_v150_2_1.md")
  children = [
    control.cis_v150_2_1_1,
    control.cis_v150_2_1_2,
    control.cis_v150_2_1_3,
    control.cis_v150_2_1_4,
    control.cis_v150_2_1_5,
    control.cis_v150_2_1_6,
    control.cis_v150_2_1_7,
    control.cis_v150_2_1_8,
    control.cis_v150_2_1_9,
    control.cis_v150_2_1_10,
    control.cis_v150_2_1_11,
    control.cis_v150_2_1_12,
    control.cis_v150_2_1_13
  ]

  tags = merge(local.cis_v150_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}


control "cis_v150_2_1_1" {
  title         = "2.1.1 Ensure That Microsoft Defender for Servers Is Set to 'On''"
  description   = "Turning on Microsoft Defender for Servers enables threat detection for Servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_server.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_1.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_2" {
  title         = "2.1.2 Ensure That Microsoft Defender for App Services Is Set To 'On'"
  description   = "Turning on Microsoft Defender for App Service enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_appservice.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_2.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_3" {
  title         = "2.1.3 Ensure That Microsoft Defender for Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Databases enables threat detection for the instances running your database software. This provides threat intelligence, anomaly detection, and behavior analytics in the Azure Microsoft Defender for Cloud. Instead of being enabled on services like Platform as a Service (PaaS), this implementation will run within your instances as Infrastructure as a Service (IaaS) on the Operating Systems hosting your databases."
  sql           = query.securitycenter_azure_defender_on_for_database.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_3.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_4" {
  title         = "2.1.4 Ensure That Microsoft Defender for Azure SQL Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Azure SQL Databases enables threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_sqldb.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_4.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_5" {
  title         = "2.1.5 Ensure That Microsoft Defender for SQL Servers on Machines Is Set To 'On'"
  description   = "Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_sqlservervm.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_5.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_6" {
  title         = "2.1.6 Ensure That Microsoft Defender for Open-Source Relational Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_opensource_relational_db.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_6.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.6"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_7" {
  title         = "2.1.7 Ensure That Microsoft Defender for Storage Is Set To 'On' "
  description   = "Turning on Microsoft Defender for Storage enables threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_storage.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_7.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.7"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_8" {
  title         = "2.1.8 Ensure That Microsoft Defender for Containers Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Containers enables threat detection for Container Registries including Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_containerregistry.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_8.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.8"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_9" {
  title         = "2.1.9 Ensure That Microsoft Defender for Cosmos DB Is Set To 'On' "
  description   = "Microsoft Defender for Cosmos DB scans all incoming network requests for changes to your virtual machine."
  sql           = query.securitycenter_azure_defender_on_for_cosmosdb.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_9.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.9"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_10" {
  title         = "2.1.10 Ensure That Microsoft Defender for Key Vault Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Key Vault enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  sql           = query.securitycenter_azure_defender_on_for_keyvault.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_10.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.10"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_11" {
  title         = "2.1.11 Ensure That Microsoft Defender for DNS Is Set To 'On'"
  description   = "Microsoft Defender for DNS scans all network traffic exiting from within a subscription."
  sql           = query.securitycenter_azure_defender_on_for_dns.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_11.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.11"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_12" {
  title         = "2.1.12 Ensure That Microsoft Defender for IoT Is Set To 'On'"
  description   = "Microsoft Defender for IoT acts as a central security hub for IoT devices within your organization."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_12.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.12"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_1_13" {
  title         = "2.1.13 Ensure That Microsoft Defender for Resource Manager Is Set To 'On'"
  description   = "Microsoft Defender for Resource Manager scans incoming administrative requests to change your infrastructure from both CLI and the Azure portal."
  sql           = query.securitycenter_azure_defender_on_for_resource_manager.sql
  documentation = file("./cis_v150/docs/cis_v150_2_1_13.md")

  tags = merge(local.cis_v150_2_1_common_tags, {
    cis_item_id = "2.1.13"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v150_2_2" {
  title         = "2.2 Auto Provisioning"
  documentation = file("./cis_v150/docs/cis_v150_2_2.md")
  children = [
    control.cis_v150_2_2_1,
    control.cis_v150_2_2_2,
    control.cis_v150_2_2_3
  ]

  tags = merge(local.cis_v150_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_2_1" {
  title         = "2.2.1 Ensure that Auto provisioning of 'Log Analytics agent for Azure VMs' is Set to 'On'"
  description   = "Enable automatic provisioning of the monitoring agent to collect security data."
  sql           = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql
  documentation = file("./cis_v150/docs/cis_v150_2_2_1.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.2.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_2_2" {
  title         = "2.2.2 Ensure that Auto provisioning of 'Vulnerability assessment for machines' is Set to 'On'"
  description   = "Enable automatic provisioning of vulnerability assessment for machines on both Azure and hybrid (Arc enabled) machines."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_2_2_2.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.2.2"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_2_3" {
  title         = "2.2.3 Ensure that Auto provisioning of 'Microsoft Defender for Containers components' is Set to 'On'"
  description   = "Enable automatic provisioning of the Microsoft Defender for Containers components."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_2_2_3.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.2.13"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v150_2_3" {
  title         = "2.3 Email notifications"
  documentation = file("./cis_v150/docs/cis_v150_2_3.md")
  children = [
    control.cis_v150_2_3_1,
    control.cis_v150_2_3_2,
    control.cis_v150_2_3_3
  ]

  tags = merge(local.cis_v150_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_3_1" {
  title         = "2.3.1 Ensure That 'All users with the following roles' is set to 'Owner'"
  description   = "Enable security alert emails to subscription owners."
  sql           = query.securitycenter_security_alerts_to_owner_enabled.sql
  documentation = file("./cis_v150/docs/cis_v150_2_3_1.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.3.1"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_3_2" {
  title         = "2.3.2 Ensure 'Additional email addresses' is Configured with a Security Contact Email"
  description   = "Microsoft Defender for Cloud emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  sql           = query.securitycenter_additional_email_configured.sql
  documentation = file("./cis_v150/docs/cis_v150_2_3_2.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.3.2"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_3_3" {
  title         = "2.3.3 Ensure That 'Notify about alerts with the following severity' is Set to 'High'"
  description   = "Enables emailing security alerts to the subscription owner or other designated security contact."
  sql           = query.securitycenter_notify_alerts_configured.sql
  documentation = file("./cis_v150/docs/cis_v150_2_3_3.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.3.3"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v150_2_4" {
  title         = "2.4 Integrations"
  documentation = file("./cis_v150/docs/cis_v150_2_4.md")
  children = [
    control.cis_v150_2_4_1,
    control.cis_v150_2_4_2
  ]

  tags = merge(local.cis_v150_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_4_1" {
  title         = "2.4.1 Ensure that Microsoft Defender for Cloud Apps integration with Microsoft Defender for Cloud is Selected"
  description   = "This integration setting enables Microsoft Defender for Cloud Apps (formerly 'Microsoft Cloud App Security' or 'MCAS' - see additional info) to communicate with Microsoft Defender for Cloud."
  sql           = query.securitycenter_mcas_integration.sql
  documentation = file("./cis_v150/docs/cis_v150_2_4_1.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.4.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_4_2" {
  title         = "2.4.2 Ensure that Microsoft Defender for Endpoint integration with Microsoft Defender for Cloud is selected"
  description   = "This integration setting enables Microsoft Defender for Endpoint (formerly 'Advanced Threat Protection' or 'ATP' or 'WDATP' - see additional info) to communicate with Microsoft Defender for Cloud."
  sql           = query.securitycenter_wdatp_integration.sql
  documentation = file("./cis_v150/docs/cis_v150_2_4_2.md")

  tags = merge(local.cis_v150_2_2_common_tags, {
    cis_item_id = "2.4.2"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_5" {
  title         = "2.5 Ensure that Microsoft Defender Recommendation for 'Apply system updates' status is 'Completed'"
  description   = "Ensure that the latest OS patches for all virtual machines are applied."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_2_5.md")

  tags = merge(local.cis_v150_2_common_tags, {
    cis_item_id = "2.5"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v150_2_6" {
  title         = "2.6 Ensure Any of the ASC Default Policy Settings are Not Set to 'Disabled'"
  description   = "None of the settings offered by ASC Default policy should be set to effect Disabled."
  sql           = query.securitycenter_asc_default_setting_not_disabled.sql
  documentation = file("./cis_v150/docs/cis_v150_2_6.md")

  tags = merge(local.cis_v150_2_common_tags, {
    cis_item_id = "2.6"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}