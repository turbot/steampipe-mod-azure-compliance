locals {
  cis_v300_3_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "3"
  })
}

locals {
  cis_v300_3_1_common_tags = merge(local.cis_v300_3_common_tags, {
    cis_section_id = "3.1"
  })
  cis_v300_3_2_common_tags = merge(local.cis_v300_3_common_tags, {
    cis_section_id = "3.2"
  })
  cis_v300_3_3_common_tags = merge(local.cis_v300_3_common_tags, {
    cis_section_id = "3.3"
  })
}

benchmark "cis_v300_3" {
  title         = "3 Security"
  documentation = file("./cis_v300/docs/cis_v300_3.md")
  children = [
    benchmark.cis_v300_3_1,
    benchmark.cis_v300_3_2,
    benchmark.cis_v300_3_3
  ]

  tags = merge(local.cis_v300_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1" {
  title         = "3.1 Microsoft Defender for Cloud"
  documentation = file("./cis_v300/docs/cis_v300_3_1.md")
  children = [
    benchmark.cis_v300_3_1_1,
    benchmark.cis_v300_3_1_3,
    benchmark.cis_v300_3_1_4,
    benchmark.cis_v300_3_1_5,
    benchmark.cis_v300_3_1_6,
    benchmark.cis_v300_3_1_7,
    benchmark.cis_v300_3_1_8,
    benchmark.cis_v300_3_1_9,
    control.cis_v300_3_1_10,
    control.cis_v300_3_1_11,
    control.cis_v300_3_1_12,
    control.cis_v300_3_1_13,
    control.cis_v300_3_1_14,
    control.cis_v300_3_1_15,
    control.cis_v300_3_1_16
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_1" {
  title         = "3.1.1 Microsoft Cloud Security Posture Management (CSPM)"
  documentation = file("./cis_v300/docs/cis_v300_3_1_1.md")
  children = [
    control.cis_v300_3_1_1_1,
    control.cis_v300_3_1_1_2
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_1_1" {
  title         = "3.1.1.1 Ensure that Auto provisioning of 'Log Analytics agent for Azure VMs' is Set to 'On'"
  description   = "Enable automatic provisioning of the monitoring agent to collect security data."
  query         = query.securitycenter_automatic_provisioning_monitoring_agent_on
  documentation = file("./cis_v300/docs/cis_v300_3_1_1_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.1.1"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_1_2" {
  title         = "3.1.1.2 Ensure that Microsoft Defender for Cloud Apps integration with Microsoft Defender for Cloud is Selected"
  description   = "This integration setting enables Microsoft Defender for Cloud Apps (formerly 'Microsoft Cloud App Security' or 'MCAS' - see additional info) to communicate with Microsoft Defender for Cloud."
  query         = query.securitycenter_mcas_integration
  documentation = file("./cis_v300/docs/cis_v300_3_1_1_2.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.1.2"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_3" {
  title         = "3.1.3 Defender Plan: Servers"
  documentation = file("./cis_v300/docs/cis_v300_3_1_3.md")
  children = [
    control.cis_v300_3_1_3_1,
    control.cis_v300_3_1_3_2,
    control.cis_v300_3_1_3_3,
    control.cis_v300_3_1_3_4,
    control.cis_v300_3_1_3_5
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_3_1" {
  title         = "3.1.3.1 Ensure That Microsoft Defender for Servers Is Set to 'On'"
  description   = "Turning on Microsoft Defender for Servers enables threat detection for Servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_server
  documentation = file("./cis_v300/docs/cis_v300_3_1_3_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.3.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_3_2" {
  title         = "3.1.3.2 Ensure that 'Vulnerability assessment for machines' component status is set to 'On'"
  description   = "Enable vulnerability assessment for machines on both Azure and hybrid (Arc enabled) machines."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_3_2.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.3.2"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_3_3" {
  title         = "3.1.3.3 Ensure that 'Endpoint protection' component status is set to 'On'"
  description   = "The Endpoint protection component enables Microsoft Defender for Endpoint (formerly 'Advanced Threat Protection' or 'ATP' or 'WDATP' - see additional info) to communicate with Microsoft Defender for Cloud."
  query         = query.securitycenter_wdatp_integration
  documentation = file("./cis_v300/docs/cis_v300_3_1_3_3.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.3.3"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_3_4" {
  title         = "3.1.3.4 Ensure that 'Agentless scanning for machines' component status is set to 'On'"
  description   = "Using disk snapshots, the agentless scanner scans for installed software, vulnerabilities, and plain text secrets."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_3_4.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.3.4"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_3_5" {
  title         = "3.1.3.5 Ensure that 'File Integrity Monitoring' component status is set to 'On'"
  description   = "File Integrity Monitoring (FIM) is a feature that monitors critical system files in Windows or Linux for potential signs of attack or compromise."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_3_5.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.3.5"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_4" {
  title         = "3.1.4 Defender Plan: Containers"
  documentation = file("./cis_v300/docs/cis_v300_3_1_4.md")
  children = [
    control.cis_v300_3_1_4_1,
    control.cis_v300_3_1_4_2,
    control.cis_v300_3_1_4_3
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_4_1" {
  title         = "3.1.4.1 Ensure That Microsoft Defender for Containers Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Containers enables threat detection for Container Registries including Kubernetes, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_containerregistry
  documentation = file("./cis_v300/docs/cis_v300_3_1_4_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.4.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_4_2" {
  title         = "3.1.4.2 Ensure that 'Agentless discovery for Kubernetes' component status 'On'"
  description   = "Enable automatic discovery and configuration scanning of the Microsoft Kubernetes clusters."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_4_2.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.4.2"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_4_3" {
  title         = "3.1.4.3 Ensure that 'Agentless container vulnerability assessment' component status is 'On'"
  description   = "Enable automatic vulnerability management for images stored in ACR or running in AKS clusters."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_4_3.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.4.3"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_5" {
  title         = "3.1.5 Defender Plan: Storage"
  documentation = file("./cis_v300/docs/cis_v300_3_1_5.md")
  children = [
    control.cis_v300_3_1_5_1
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_5_1" {
  title         = "3.1.5.1 Ensure That Microsoft Defender for Storage Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Storage enables threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_storage
  documentation = file("./cis_v300/docs/cis_v300_3_1_5_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.5.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_6" {
  title         = "3.1.6 Defender Plan: App Service"
  documentation = file("./cis_v300/docs/cis_v300_3_1_6.md")
  children = [
    control.cis_v300_3_1_6_1
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_6_1" {
  title         = "3.1.6.1 Ensure That Microsoft Defender for App Services Is Set To 'On'"
  description   = "Turning on Microsoft Defender for App Service enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_appservice
  documentation = file("./cis_v300/docs/cis_v300_3_1_6_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.6."
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_7" {
  title         = "3.1.7 Defender Plan: Databases"
  documentation = file("./cis_v300/docs/cis_v300_3_1_7.md")
  children = [
    control.cis_v300_3_1_7_1,
    control.cis_v300_3_1_7_2,
    control.cis_v300_3_1_7_3,
    control.cis_v300_3_1_7_4
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_7_1" {
  title         = "3.1.7.1 Ensure That Microsoft Defender for Azure Cosmos DB Is Set To 'On'"
  description   = "Microsoft Defender for Azure Cosmos DB scans all incoming network requests for threats to your Azure Cosmos DB resources."
  query         = query.securitycenter_azure_defender_on_for_cosmosdb
  documentation = file("./cis_v300/docs/cis_v300_3_1_7_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.7.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_7_2" {
  title         = "3.1.7.2 Ensure That Microsoft Defender for Open-Source Relational Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_opensource_relational_db
  documentation = file("./cis_v300/docs/cis_v300_3_1_7_2.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.7.2"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_7_3" {
  title         = "3.1.7.3 Ensure That Microsoft Defender for (Managed Instance) Azure SQL Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Azure SQL Databases enables threat detection for Azure SQL database servers, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqldb
  documentation = file("./cis_v300/docs/cis_v300_3_1_7_3.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.7.3"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_7_4" {
  title         = "3.1.7.4 Ensure That Microsoft Defender for SQL Servers on Machines Is Set To 'On'"
  description   = "Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqlservervm
  documentation = file("./cis_v300/docs/cis_v300_3_1_7_4.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.7.4"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_8" {
  title         = "3.1.8 Defender Plan: Key Vault"
  documentation = file("./cis_v300/docs/cis_v300_3_1_8.md")
  children = [
    control.cis_v300_3_1_8_1
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_8_1" {
  title         = "3.1.8.1 Ensure That Microsoft Defender for Key Vault Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Key Vault enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_keyvault
  documentation = file("./cis_v300/docs/cis_v300_3_1_8_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.8.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_1_9" {
  title         = "3.1.9 Defender Plan: Resource Manager"
  documentation = file("./cis_v300/docs/cis_v300_3_1_9.md")
  children = [
    control.cis_v300_3_1_9_1
  ]

  tags = merge(local.cis_v300_3_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_9_1" {
  title         = "3.1.9.1 Ensure That Microsoft Defender for Resource Manager Is Set To 'On'"
  description   = "Microsoft Defender for Resource Manager scans incoming administrative requests to change your infrastructure from both CLI and the Azure portal."
  query         = query.securitycenter_azure_defender_on_for_resource_manager
  documentation = file("./cis_v300/docs/cis_v300_3_1_9_1.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.9.1"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_10" {
  title         = "3.1.10 Ensure that Microsoft Defender Recommendation for 'Apply system updates' status is 'Completed'"
  description   = "Ensure that the latest OS patches for all virtual machines are applied."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_10.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.10"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_11" {
  title         = "3.1.11 Ensure that Microsoft Cloud Security Benchmark policies are not set to 'Disabled'"
  description   = "The Microsoft Cloud Security Benchmark (or 'MCSB') is an Azure Policy Initiative containing many security policies to evaluate resource configuration against best practice recommendations. If a policy in the MCSB is set with effect type Disabled, it is not evaluated and may prevent administrators from being informed of valuable security recommendations."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_11.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.11"
    cis_type    = "manual"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_12" {
  title         = "3.1.12 Ensure That 'All users with the following roles' is set to 'Owner'"
  description   = "Enable security alert emails to subscription owners."
  query         = query.securitycenter_security_alerts_to_owner_enabled
  documentation = file("./cis_v300/docs/cis_v300_3_1_12.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.12"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_13" {
  title         = "3.1.13 Ensure 'Additional email addresses' is Configured with a Security Contact Email"
  description   = "Microsoft Defender for Cloud emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  query         = query.securitycenter_additional_email_configured
  documentation = file("./cis_v300/docs/cis_v300_3_1_13.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.13"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_14" {
  title         = "3.1.14 Ensure That 'Notify about alerts with the following severity' is Set to 'High'"
  description   = "Enables emailing security alerts to the subscription owner or other designated security contact."
  query         = query.securitycenter_notify_alerts_configured
  documentation = file("./cis_v300/docs/cis_v300_3_1_14.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.14"
    cis_type    = "automated"
    cis_level   = "1"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_15" {
  title         = "3.1.15 Ensure that Microsoft Defender External Attack Surface Monitoring (EASM) is enabled"
  description   = "An organization's attack surface is the collection of assets with a public network identifier or URI that an external threat actor can see or access from outside your cloud. It is the set of points on the boundary of a system, a system element, system component, or an environment where an attacker can try to enter, cause an effect on, or extract data from, that system, system element, system component, or environment. The larger the attack surface, the harder it is to protect."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_1_15.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.15"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_1_16" {
  title         = "3.1.16 [LEGACY] Ensure That Microsoft Defender for DNS Is Set To 'On'"
  description   = "Microsoft Defender for DNS scans all network traffic exiting from within a subscription."
  query         = query.securitycenter_azure_defender_on_for_dns
  documentation = file("./cis_v300/docs/cis_v300_3_1_16.md")

  tags = merge(local.cis_v300_3_1_common_tags, {
    cis_item_id = "3.1.16"
    cis_type    = "automated"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_2" {
  title         = "3.2 Microsoft Defender for IoT"
  documentation = file("./cis_v300/docs/cis_v300_3_2.md")
  children = [
    control.cis_v300_3_2_1
  ]

  tags = merge(local.cis_v300_3_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v300_3_2_1" {
  title         = "3.2.1 Ensure That Microsoft Defender for IoT Hub Is Set To 'On'"
  description   = "Microsoft Defender for IoT acts as a central security hub for IoT devices within your organization."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_2_1.md")

  tags = merge(local.cis_v300_3_2_common_tags, {
    cis_item_id = "3.2.1"
    cis_type    = "manual"
    cis_level   = "2"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v300_3_3" {
  title         = "3.3 Key Vault"
  documentation = file("./cis_v300/docs/cis_v300_3_3.md")
  children = [
    control.cis_v300_3_3_1,
    control.cis_v300_3_3_2,
    control.cis_v300_3_3_3,
    control.cis_v300_3_3_4,
    control.cis_v300_3_3_5,
    control.cis_v300_3_3_6,
    control.cis_v300_3_3_7,
    control.cis_v300_3_3_8
  ]

  tags = merge(local.cis_v300_3_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v300_3_3_1" {
  title         = "3.3.1 Ensure that the Expiration Date is set for all Keys in RBAC Key Vaults"
  description   = "Ensure that all Keys in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_rbac_key_expiration_set
  documentation = file("./cis_v300/docs/cis_v300_3_3_1.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_2" {
  title         = "3.3.2 Ensure that the Expiration Date is set for all Keys in Non-RBAC Key Vaults"
  description   = "Ensure that all Keys in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_non_rbac_key_expiration_set
  documentation = file("./cis_v300/docs/cis_v300_3_3_2.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_3" {
  title         = "3.3.3 Ensure that the Expiration Date is set for all Secrets in RBAC Key Vaults"
  description   = "Ensure that all Secrets in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_rbac_secret_expiration_set
  documentation = file("./cis_v300/docs/cis_v300_3_3_3.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_4" {
  title         = "3.3.4 Ensure that the Expiration Date is set for all Secrets in Non-RBAC Key Vaults"
  description   = "Ensure that all Secrets in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_non_rbac_secret_expiration_set
  documentation = file("./cis_v300/docs/cis_v300_3_3_4.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_5" {
  title         = "3.3.5 Ensure the Key Vault is Recoverable"
  description   = "The key vault contains object keys, secrets and certificates. Accidental unavailability of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects. It is recommended the key vault be made recoverable by enabling the \"Do Not Purge\" and \"Soft Delete\" functions."
  query         = query.keyvault_vault_recoverable
  documentation = file("./cis_v300/docs/cis_v300_3_3_5.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_6" {
  title         = "3.3.6 Enable Role Based Access Control for Azure Key Vault"
  description   = "Role assignments disappear when a Key Vault has been deleted (soft-delete) and recovered. Afterwards it will be required to recreate all role assignments. This is a limitation of the soft-delete feature across all Azure services."
  query         = query.keyvault_rbac_enabled
  documentation = file("./cis_v300/docs/cis_v300_3_3_6.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_7" {
  title         = "3.3.7 Ensure that Private Endpoints are Used for Azure Key Vault"
  description   = "Private endpoints will secure network traffic from Azure Key Vault to the resources requesting secrets and keys."
  query         = query.keyvault_vault_private_link_used
  documentation = file("./cis_v300/docs/cis_v300_3_3_7.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

control "cis_v300_3_3_8" {
  title         = "3.3.8 Ensure Automatic Key Rotation is Enabled Within Azure Key Vault for the Supported Services"
  description   = "Automatic Key Rotation is available in Public Preview. The currently supported applications are Key Vault, Managed Disks, and Storage accounts accessing keys within Key Vault. The number of supported applications will incrementally increased."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_3_3_8.md")

  tags = merge(local.cis_v300_3_3_common_tags, {
    cis_item_id = "3.3.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}
