locals {
  cis_v210_2_common_tags = merge(local.cis_v210_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v210_2_1_common_tags = merge(local.cis_v210_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v210_2_2_common_tags = merge(local.cis_v210_2_common_tags, {
    cis_section_id = "2.2"
  })
}

benchmark "cis_v210_2" {
  title         = "2 Microsoft Defender"
  documentation = file("./cis_v210/docs/cis_v210_2.md")
  children = [
    benchmark.cis_v210_2_1,
    benchmark.cis_v210_2_2
  ]

  tags = merge(local.cis_v210_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

benchmark "cis_v210_2_1" {
  title         = "2.1 Microsoft Defender for Cloud"
  documentation = file("./cis_v210/docs/cis_v210_2_1.md")
  children = [
    control.cis_v210_2_1_1,
    control.cis_v210_2_1_2,
    control.cis_v210_2_1_3,
    control.cis_v210_2_1_4,
    control.cis_v210_2_1_5,
    control.cis_v210_2_1_6,
    control.cis_v210_2_1_7,
    control.cis_v210_2_1_8,
    control.cis_v210_2_1_9,
    control.cis_v210_2_1_10,
    control.cis_v210_2_1_11,
    control.cis_v210_2_1_12,
    control.cis_v210_2_1_13,
    control.cis_v210_2_1_14,
    control.cis_v210_2_1_15,
    control.cis_v210_2_1_16,
    control.cis_v210_2_1_17,
    control.cis_v210_2_1_18,
    control.cis_v210_2_1_19,
    control.cis_v210_2_1_20,
    control.cis_v210_2_1_21,
    control.cis_v210_2_1_22
  ]

  tags = merge(local.cis_v210_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_1" {
  title         = "2.1.1 Ensure That Microsoft Defender for Servers Is Set to 'On'"
  description   = "Turning on Microsoft Defender for Servers enables threat detection for Servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_server
  documentation = file("./cis_v210/docs/cis_v210_2_1_1.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_2" {
  title         = "2.1.2 Ensure That Microsoft Defender for App Services Is Set To 'On'"
  description   = "Turning on Microsoft Defender for App Service enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_appservice
  documentation = file("./cis_v210/docs/cis_v210_2_1_2.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_3" {
  title         = "2.1.3 Ensure That Microsoft Defender for (Managed Instance) Azure SQL Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Azure SQL Databases enables threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqldb
  documentation = file("./cis_v210/docs/cis_v210_2_1_3.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_4" {
  title         = "2.1.4 Ensure That Microsoft Defender for SQL Servers on Machines Is Set To 'On'"
  description   = "Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqlservervm
  documentation = file("./cis_v210/docs/cis_v210_2_1_4.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_5" {
  title         = "2.1.5 Ensure That Microsoft Defender for Open-Source Relational Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_opensource_relational_db
  documentation = file("./cis_v210/docs/cis_v210_2_1_5.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_6" {
  title         = "2.1.6 Ensure That Microsoft Defender for Azure Cosmos DB Is Set To 'On'"
  description   = "Microsoft Defender for Azure Cosmos DB scans all incoming network requests for threats to your Azure Cosmos DB resources."
  query         = query.securitycenter_azure_defender_on_for_cosmosdb
  documentation = file("./cis_v210/docs/cis_v210_2_1_6.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.6"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_7" {
  title         = "2.1.7 Ensure That Microsoft Defender for Storage Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Storage enables threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_storage
  documentation = file("./cis_v210/docs/cis_v210_2_1_7.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.7"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_8" {
  title         = "2.1.8 Ensure That Microsoft Defender for Containers Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Containers enables threat detection for Container Registries including Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_containerregistry
  documentation = file("./cis_v210/docs/cis_v210_2_1_8.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.8"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_9" {
  title         = "2.1.9 Ensure That Microsoft Defender for Key Vault Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Key Vault enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_keyvault
  documentation = file("./cis_v210/docs/cis_v210_2_1_9.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.9"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_10" {
  title         = "2.1.10 [LEGACY] Ensure That Microsoft Defender for DNS Is Set To 'On'"
  description   = "Microsoft Defender for DNS scans all network traffic exiting from within a subscription."
  query         = query.securitycenter_azure_defender_on_for_dns
  documentation = file("./cis_v210/docs/cis_v210_2_1_10.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.10"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_11" {
  title         = "2.1.11 Ensure That Microsoft Defender for Resource Manager Is Set To 'On'"
  description   = "Microsoft Defender for Resource Manager scans incoming administrative requests to change your infrastructure from both CLI and the Azure portal."
  query         = query.securitycenter_azure_defender_on_for_resource_manager
  documentation = file("./cis_v210/docs/cis_v210_2_1_11.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.11"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_12" {
  title         = "2.1.12 Ensure that Microsoft Defender Recommendation for 'Apply system updates' status is 'Completed'"
  description   = "Ensure that the latest OS patches for all virtual machines are applied."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_2_1_12.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.12"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_13" {
  title         = "2.1.13 Ensure that Microsoft Cloud Security Benchmark policies are not set to 'Disabled'"
  description   = "The Microsoft Cloud Security Benchmark (or 'MCSB') is an Azure Policy Initiative containing many security policies to evaluate resource configuration against best practice recommendations. If a policy in the MCSB is set with effect type Disabled, it is not evaluated and may prevent administrators from being informed of valuable security recommendations."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_2_1_13.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.13"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_14" {
  title         = "2.1.14 Ensure that Auto provisioning of 'Log Analytics agent for Azure VMs' is Set to 'On'"
  description   = "Enable automatic provisioning of the monitoring agent to collect security data."
  query         = query.securitycenter_automatic_provisioning_monitoring_agent_on
  documentation = file("./cis_v210/docs/cis_v210_2_1_14.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.14"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_15" {
  title         = "2.1.15 Ensure that Auto provisioning of 'Vulnerability assessment for machines' is Set to 'On'"
  description   = "Enable automatic provisioning of vulnerability assessment for machines on both Azure and hybrid (Arc enabled) machines."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_2_1_15.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.15"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_16" {
  title         = "2.1.16 Ensure that Auto provisioning of 'Microsoft Defender for Containers components' is Set to 'On'"
  description   = "Enable automatic provisioning of the Microsoft Defender for Containers components."
  query         = query.securitycenter_azure_defender_on_for_containers
  documentation = file("./cis_v210/docs/cis_v210_2_1_16.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.16"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_17" {
  title         = "2.1.17 Ensure That 'All users with the following roles' is set to 'Owner'"
  description   = "Enable security alert emails to subscription owners."
  query         = query.securitycenter_security_alerts_to_owner_enabled
  documentation = file("./cis_v210/docs/cis_v210_2_1_17.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.17"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_18" {
  title         = "2.1.18 Ensure 'Additional email addresses' is Configured with a Security Contact Email"
  description   = "Microsoft Defender for Cloud emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  query         = query.securitycenter_additional_email_configured
  documentation = file("./cis_v210/docs/cis_v210_2_1_18.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.18"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_19" {
  title         = "2.1.19 Ensure That 'Notify about alerts with the following severity' is Set to 'High'"
  description   = "Enables emailing security alerts to the subscription owner or other designated security contact."
  query         = query.securitycenter_notify_alerts_configured
  documentation = file("./cis_v210/docs/cis_v210_2_1_19.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.19"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_20" {
  title         = "2.1.20 Ensure that Microsoft Defender for Cloud Apps integration with Microsoft Defender for Cloud is Selected"
  description   = "This integration setting enables Microsoft Defender for Cloud Apps (formerly 'Microsoft Cloud App Security' or 'MCAS' - see additional info) to communicate with Microsoft Defender for Cloud."
  query         = query.securitycenter_mcas_integration
  documentation = file("./cis_v210/docs/cis_v210_2_1_20.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.20"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_21" {
  title         = "2.1.21 Ensure that Microsoft Defender for Endpoint integration with Microsoft Defender for Cloud is selected"
  description   = "This integration setting enables Microsoft Defender for Endpoint (formerly 'Advanced Threat Protection' or 'ATP' or 'WDATP' - see additional info) to communicate with Microsoft Defender for Cloud."
  query         = query.securitycenter_wdatp_integration
  documentation = file("./cis_v210/docs/cis_v210_2_1_21.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.21"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_1_22" {
  title         = "2.1.22 Ensure that Microsoft Defender External Attack Surface Monitoring (EASM) is enabled"
  description   = "An organization's attack surface is the collection of assets with a public network identifier or URI that an external threat actor can see or access from outside your cloud. It is the set of points on the boundary of a system, a system element, system component, or an environment where an attacker can try to enter, cause an effect on, or extract data from, that system, system element, system component, or environment. The larger the attack surface, the harder it is to protect."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_2_1_22.md")

  tags = merge(local.cis_v210_2_1_common_tags, {
    cis_item_id = "2.1.22"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v210_2_2" {
  title         = "2.2 Microsoft Defender for IoT"
  documentation = file("./cis_v210/docs/cis_v210_2_2.md")
  children = [
    control.cis_v210_2_2_1
  ]

  tags = merge(local.cis_v210_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v210_2_2_1" {
  title         = "2.2.1 Ensure That Microsoft Defender for IoT Hub Is Set To 'On'"
  description   = "Microsoft Defender for IoT acts as a central security hub for IoT devices within your organization."
  query         = query.manual_control
  documentation = file("./cis_v210/docs/cis_v210_2_2_1.md")

  tags = merge(local.cis_v210_2_2_common_tags, {
    cis_item_id = "2.2.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}
