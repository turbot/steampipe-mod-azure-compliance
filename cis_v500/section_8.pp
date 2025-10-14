locals {
  cis_v500_8_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "8"
  })
}

locals {
  cis_v500_8_1_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1"
  })
  cis_v500_8_1_1_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.1"
  })
  cis_v500_8_1_2_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.2"
  })
  cis_v500_8_1_3_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.3"
  })
  cis_v500_8_1_4_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.4"
  })
  cis_v500_8_1_5_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.5"
  })
  cis_v500_8_1_6_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.6"
  })
  cis_v500_8_1_7_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.7"
  })
  cis_v500_8_1_8_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.8"
  })
  cis_v500_8_1_9_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.1.9"
  })
  cis_v500_8_2_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.2"
  })
  cis_v500_8_3_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.3"
  })
  cis_v500_8_4_common_tags = merge(local.cis_v500_8_common_tags, {
    cis_section_id = "8.4"
  })
}

benchmark "cis_v500_8" {
  title         = "8 Security Services"
  documentation = file("./cis_v500/docs/cis_v500_8.md")
  children = [
    benchmark.cis_v500_8_1,
    benchmark.cis_v500_8_2,
    benchmark.cis_v500_8_3,
    benchmark.cis_v500_8_4,
    control.cis_v500_8_5
  ]

  tags = merge(local.cis_v500_8_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v500_8_1" {
  title         = "8.1 Microsoft Defender for Cloud"
  documentation = file("./cis_v500/docs/cis_v500_8_1.md")
  children = [
    benchmark.cis_v500_8_1_1,
    benchmark.cis_v500_8_1_2,
    benchmark.cis_v500_8_1_3,
    benchmark.cis_v500_8_1_4,
    benchmark.cis_v500_8_1_5,
    benchmark.cis_v500_8_1_6,
    benchmark.cis_v500_8_1_7,
    benchmark.cis_v500_8_1_8,
    benchmark.cis_v500_8_1_9,
    control.cis_v500_8_1_10,
    control.cis_v500_8_1_11,
    control.cis_v500_8_1_12,
    control.cis_v500_8_1_13,
    control.cis_v500_8_1_14,
    control.cis_v500_8_1_15,
    control.cis_v500_8_1_16
  ]

  tags = merge(local.cis_v500_8_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_1" {
  title         = "8.1.1 Microsoft Cloud Security Posture Management (CSPM)"
  documentation = file("./cis_v500/docs/cis_v500_8_1_1.md")
  children = [
    control.cis_v500_8_1_1_1
  ]

  tags = merge(local.cis_v500_8_1_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_1_1" {
  title         = "8.1.1.1 Ensure Microsoft Defender CSPM is set to 'On'"
  description   = "Enable Microsoft Defender CSPM to continuously assess cloud resources for security misconfigurations, compliance risks, and exposure to threats."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_1_1.md")

  tags = merge(local.cis_v500_8_1_1_common_tags, {
    cis_item_id = "8.1.1.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_2" {
  title         = "8.1.2 Defender Plan: APIs"
  documentation = file("./cis_v500/docs/cis_v500_8_1_2.md")
  children = [
    control.cis_v500_8_1_2_1
  ]

  tags = merge(local.cis_v500_8_1_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_2_1" {
  title         = "8.1.2.1 Ensure Microsoft Defender for APIs is set to 'On'"
  description   = "Microsoft Defender for APIs offers full lifecycle protection, detection, and response coverage for APIs."
  query         = query.security_center_defender_for_api_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_1_2_1.md")

  tags = merge(local.cis_v500_8_1_2_common_tags, {
    cis_item_id = "8.1.2.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_3" {
  title         = "8.1.3 Defender Plan: Servers"
  documentation = file("./cis_v500/docs/cis_v500_8_1_3.md")
  children = [
    control.cis_v500_8_1_3_1,
    control.cis_v500_8_1_3_2,
    control.cis_v500_8_1_3_3,
    control.cis_v500_8_1_3_4,
    control.cis_v500_8_1_3_5
  ]

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_3_1" {
  title         = "8.1.3.1 Ensure that Defender for Servers is set to 'On'"
  description   = "The Defender for Servers plan in Microsoft Defender for Cloud reduces security risk by providing actionable recommendations to improve and remediate machine security posture. Defender for Servers also helps to protect machines against real-time security threats and attacks."
  query         = query.security_center_defender_for_servers_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_1_3_1.md")

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    cis_item_id = "8.1.3.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_3_2" {
  title         = "8.1.3.2 Ensure that 'Vulnerability assessment for machines' component status is set to 'On'"
  description   = "Enable vulnerability assessment for machines on both Azure and hybrid (Arc enabled) machines."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_3_2.md")

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    cis_item_id = "8.1.3.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_3_3" {
  title         = "8.1.3.3 Ensure that 'Endpoint protection' component status is set to 'On'"
  description   = "The Endpoint protection component enables Microsoft Defender for Endpoint (formerly 'Advanced Threat Protection' or 'ATP' or 'WDATP' - see additional info) to communicate with Microsoft Defender for Cloud."
  query         = query.securitycenter_wdatp_integration
  documentation = file("./cis_v500/docs/cis_v500_8_1_3_3.md")

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    cis_item_id = "8.1.3.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_3_4" {
  title         = "8.1.3.4 Ensure that 'Agentless scanning for machines' component status is set to 'On'"
  description   = "Using disk snapshots, the agentless scanner scans for installed software, vulnerabilities, and plain text secrets."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_3_4.md")

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    cis_item_id = "8.1.3.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_3_5" {
  title         = "8.1.3.5 Ensure that 'File Integrity Monitoring' component status is set to 'On'"
  description   = "File Integrity Monitoring (FIM) is a feature that monitors critical system files in Windows or Linux for potential signs of attack or compromise."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_3_5.md")

  tags = merge(local.cis_v500_8_1_3_common_tags, {
    cis_item_id = "8.1.3.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_4" {
  title         = "8.1.4 Defender Plan: Containers"
  documentation = file("./cis_v500/docs/cis_v500_8_1_4.md")
  children = [
    control.cis_v500_8_1_4_1
  ]

  tags = merge(local.cis_v500_8_1_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_4_1" {
  title         = "8.1.4.1 Ensure That Microsoft Defender for Containers Is Set To 'On'"
  description   = "Microsoft Defender for Containers helps improve, monitor, and maintain the security of containerized assets—including Kubernetes clusters, nodes, workloads, container registries, and images—across multi-cloud and on-premises environments."
  query         = query.securitycenter_azure_defender_on_for_containerregistry
  documentation = file("./cis_v500/docs/cis_v500_8_1_4_1.md")

  tags = merge(local.cis_v500_8_1_4_common_tags, {
    cis_item_id = "8.1.4.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_5" {
  title         = "8.1.5 Defender Plan: Storage"
  documentation = file("./cis_v500/docs/cis_v500_8_1_5.md")
  children = [
    control.cis_v500_8_1_5_1,
    control.cis_v500_8_1_5_2
  ]

  tags = merge(local.cis_v500_8_1_5_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_5_1" {
  title         = "8.1.5.1 Ensure That Microsoft Defender for Storage Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Storage enables threat detection for Storage, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_storage
  documentation = file("./cis_v500/docs/cis_v500_8_1_5_1.md")

  tags = merge(local.cis_v500_8_1_5_common_tags, {
    cis_item_id = "8.1.5.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_5_2" {
  title         = "8.1.5.2 Ensure Advanced Threat Protection Alerts for Storage Accounts Are Monitored"
  description   = "After enabling Microsoft Defender for Storage, configure an alert monitoring and response process to ensure that alerts are actioned in a timely manner. Integrate with SIEM solutions like Microsoft Sentinel, or configure email/webhook notifications to security teams."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_5_2.md")

  tags = merge(local.cis_v500_8_1_5_common_tags, {
    cis_item_id = "8.1.5.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_6" {
  title         = "8.1.6 Defender Plan: App Service"
  documentation = file("./cis_v500/docs/cis_v500_8_1_6.md")
  children = [
    control.cis_v500_8_1_6_1
  ]

  tags = merge(local.cis_v500_8_1_6_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_6_1" {
  title         = "8.1.6.1 Ensure That Microsoft Defender for App Services Is Set To 'On'"
  description   = "Turning on Microsoft Defender for App Service enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_appservice
  documentation = file("./cis_v500/docs/cis_v500_8_1_6_1.md")

  tags = merge(local.cis_v500_8_1_6_common_tags, {
    cis_item_id = "8.1.6.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_7" {
  title         = "8.1.7 Defender Plan: Databases"
  documentation = file("./cis_v500/docs/cis_v500_8_1_7.md")
  children = [
    control.cis_v500_8_1_7_1,
    control.cis_v500_8_1_7_2,
    control.cis_v500_8_1_7_3,
    control.cis_v500_8_1_7_4
  ]

  tags = merge(local.cis_v500_8_1_7_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_7_1" {
  title         = "8.1.7.1 Ensure That Microsoft Defender for Azure Cosmos DB Is Set To 'On'"
  description   = "Microsoft Defender for Azure Cosmos DB scans all incoming network requests for threats to your Azure Cosmos DB resources."
  query         = query.securitycenter_azure_defender_on_for_cosmosdb
  documentation = file("./cis_v500/docs/cis_v500_8_1_7_1.md")

  tags = merge(local.cis_v500_8_1_7_common_tags, {
    cis_item_id = "8.1.7.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_7_2" {
  title         = "8.1.7.2 Ensure That Microsoft Defender for Open-Source Relational Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Open-source relational databases enables threat detection for Open-source relational databases, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_opensource_relational_db
  documentation = file("./cis_v500/docs/cis_v500_8_1_7_2.md")

  tags = merge(local.cis_v500_8_1_7_common_tags, {
    cis_item_id = "8.1.7.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_7_3" {
  title         = "8.1.7.3 Ensure That Microsoft Defender for (Managed Instance) Azure SQL Databases Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Azure SQL Databases enables threat detection for Managed Instance Azure SQL databases, providing threat intelligence, anomaly detection, and behavior analytics in Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqldb
  documentation = file("./cis_v500/docs/cis_v500_8_1_7_3.md")

  tags = merge(local.cis_v500_8_1_7_common_tags, {
    cis_item_id = "8.1.7.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_7_4" {
  title         = "8.1.7.4 Ensure That Microsoft Defender for SQL Servers on Machines Is Set To 'On'"
  description   = "Turning on Microsoft Defender for SQL servers on machines enables threat detection for SQL servers on machines, providing threat intelligence, anomaly detection, and behavior analytics in Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_sqlservervm
  documentation = file("./cis_v500/docs/cis_v500_8_1_7_4.md")

  tags = merge(local.cis_v500_8_1_7_common_tags, {
    cis_item_id = "8.1.7.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_8" {
  title         = "8.1.8 Defender Plan: Key Vault"
  documentation = file("./cis_v500/docs/cis_v500_8_1_8.md")
  children = [
    control.cis_v500_8_1_8_1
  ]

  tags = merge(local.cis_v500_8_1_8_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_8_1" {
  title         = "8.1.8.1 Ensure That Microsoft Defender for Key Vault Is Set To 'On'"
  description   = "Turning on Microsoft Defender for Key Vault enables threat detection for Key Vault, providing threat intelligence, anomaly detection, and behavior analytics in the Microsoft Defender for Cloud."
  query         = query.securitycenter_azure_defender_on_for_keyvault
  documentation = file("./cis_v500/docs/cis_v500_8_1_8_1.md")

  tags = merge(local.cis_v500_8_1_8_common_tags, {
    cis_item_id = "8.1.8.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_1_9" {
  title         = "8.1.9 Defender Plan: Resource Manager"
  documentation = file("./cis_v500/docs/cis_v500_8_1_9.md")
  children = [
    control.cis_v500_8_1_9_1
  ]

  tags = merge(local.cis_v500_8_1_9_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_9_1" {
  title         = "8.1.9.1 Ensure That Microsoft Defender for Resource Manager Is Set To 'On'"
  description   = "Microsoft Defender for Resource Manager scans incoming administrative requests to change your infrastructure from both CLI and the Azure portal."
  query         = query.securitycenter_azure_defender_on_for_resource_manager
  documentation = file("./cis_v500/docs/cis_v500_8_1_9_1.md")

  tags = merge(local.cis_v500_8_1_9_common_tags, {
    cis_item_id = "8.1.9.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_10" {
  title         = "8.1.10 Ensure that Microsoft Defender for Cloud is configured to check VM operating systems for updates"
  description   = "Ensure that the latest OS patches for all virtual machines are applied."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_10.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_11" {
  title         = "8.1.11 Ensure that Microsoft Cloud Security Benchmark policies are not set to 'Disabled'"
  description   = "The Microsoft Cloud Security Benchmark (or "MCSB") is an Azure Policy Initiative containing many security policies to evaluate resource configuration against best practice recommendations. If a policy in the MCSB is set with effect type Disabled, it is not evaluated and may prevent administrators from being informed of valuable security recommendations."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_11.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_12" {
  title         = "8.1.12 Ensure That 'All users with the following roles' is set to 'Owner'"
  description   = "Enable security alert emails to subscription owners."
  query         = query.securitycenter_security_alerts_to_owner_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_1_12.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.12"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_13" {
  title         = "8.1.13 Ensure 'Additional email addresses' is Configured with a Security Contact Email"
  description   = "Microsoft Defender for Cloud emails the subscription owners whenever a high-severity alert is triggered for their subscription. You should provide a security contact email address as an additional email address."
  query         = query.securitycenter_additional_email_configured
  documentation = file("./cis_v500/docs/cis_v500_8_1_13.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.13"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_14" {
  title         = "8.1.14 Ensure that 'Notify about alerts with the following severity (or higher)' is enabled"
  description   = "Enables emailing security alerts to the subscription owner or other designated security contact."
  query         = query.securitycenter_notify_alerts_configured
  documentation = file("./cis_v500/docs/cis_v500_8_1_14.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.14"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_15" {
  title         = "8.1.15 Ensure that 'Notify about attack paths with the following risk level (or higher)' is enabled"
  description   = "Enables emailing attack paths to the subscription owner or other designated security contact."
  query         = query.security_center_attack_path_alerts_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_1_15.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.15"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_1_16" {
  title         = "8.1.16 Ensure that Microsoft Defender External Attack Surface Monitoring (EASM) is enabled"
  description   = "An organization's attack surface is the collection of assets with a public network identifier or URI that an external threat actor can see or access from outside your cloud. It is the set of points on the boundary of a system, a system element, system component, or an environment where an attacker can try to enter, cause an effect on, or extract data from, that system, system element, system component, or environment. The larger the attack surface, the harder it is to protect."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_1_16.md")

  tags = merge(local.cis_v500_8_1_common_tags, {
    cis_item_id = "8.1.16"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_2" {
  title         = "8.2 Microsoft Defender for IoT"
  documentation = file("./cis_v500/docs/cis_v500_8_2.md")
  children = [
    control.cis_v500_8_2_1
  ]

  tags = merge(local.cis_v500_8_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v500_8_2_1" {
  title         = "8.2.1 Ensure That Microsoft Defender for IoT Hub Is Set To 'On'"
  description   = "Microsoft Defender for IoT acts as a central security hub for IoT devices within your organization."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_2_1.md")

  tags = merge(local.cis_v500_8_2_common_tags, {
    cis_item_id = "8.2.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v500_8_3" {
  title         = "8.3 Key Vault"
  documentation = file("./cis_v500/docs/cis_v500_8_3.md")
  children = [
    control.cis_v500_8_3_1,
    control.cis_v500_8_3_2,
    control.cis_v500_8_3_3,
    control.cis_v500_8_3_4,
    control.cis_v500_8_3_5,
    control.cis_v500_8_3_6,
    control.cis_v500_8_3_7,
    control.cis_v500_8_3_8,
    control.cis_v500_8_3_9,
    control.cis_v500_8_3_10,
    control.cis_v500_8_3_11
  ]

  tags = merge(local.cis_v500_8_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_1" {
  title         = "8.3.1 Ensure that the Expiration Date is set for all Keys in RBAC Key Vaults"
  description   = "Ensure that all Keys in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_rbac_key_expiration_set
  documentation = file("./cis_v500/docs/cis_v500_8_3_1.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_2" {
  title         = "8.3.2 Ensure that the Expiration Date is set for all Keys in Non-RBAC Key Vaults"
  description   = "Ensure that all Keys in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_non_rbac_key_expiration_set
  documentation = file("./cis_v500/docs/cis_v500_8_3_2.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_3" {
  title         = "8.3.3 Ensure that the Expiration Date is set for all Secrets in RBAC Key Vaults"
  description   = "Ensure that all Secrets in Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_rbac_secret_expiration_set
  documentation = file("./cis_v500/docs/cis_v500_8_3_3.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_4" {
  title         = "8.3.4 Ensure that the Expiration Date is set for all Secrets in Non-RBAC Key Vaults"
  description   = "Ensure that all Secrets in Non Role Based Access Control (RBAC) Azure Key Vaults have an expiration date set."
  query         = query.keyvault_with_non_rbac_secret_expiration_set
  documentation = file("./cis_v500/docs/cis_v500_8_3_4.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_5" {
  title         = "8.3.5 Ensure 'Purge protection' is set to 'Enabled'"
  description   = "Key vaults contain object keys, secrets, and certificates. Deletion of a key vault can cause immediate data loss or loss of security functions (authentication, validation, verification, non-repudiation, etc.) supported by the key vault objects."
  query         = query.keyvault_purge_protection_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_3_5.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_6" {
  title         = "8.3.6 Ensure that Role Based Access Control for Azure Key Vault is enabled"
  description   = "The recommended way to access Key Vaults is to use the Azure Role-Based Access Control (RBAC) permissions model."
  query         = query.keyvault_rbac_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_3_6.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_7" {
  title         = "8.3.7 Ensure Public Network Access is Disabled"
  description   = "Disable public network access to prevent exposure to the internet and reduce the risk of unauthorized access. Use private endpoints to securely manage access within trusted networks."
  query         = query.keyvault_vault_public_network_access_disabled
  documentation = file("./cis_v500/docs/cis_v500_8_3_7.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_8" {
  title         = "8.3.8 Ensure Private Endpoints are used to access Azure Key Vault"
  description   = "Use private endpoints to allow clients and services to securely access data located over a network via an encrypted Private Link. To do this, the private endpoint uses an IP address from the VNet for each service. Network traffic between disparate services securely traverses encrypted over the VNet. This VNet can also link addressing space, extending your network and accessing resources on it. Similarly, it can be a tunnel through public networks to connect remote infrastructures together. This creates further security through segmenting network traffic and preventing outside sources from accessing it."
  query         = query.keyvault_vault_private_link_used
  documentation = file("./cis_v500/docs/cis_v500_8_3_8.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.8"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_9" {
  title         = "8.3.9 Ensure automatic key rotation is enabled within Azure Key Vault"
  description   = "Automated cryptographic key rotation in Key Vault allows users to configure Key Vault to automatically generate a new key version at a specified frequency. A key rotation policy can be defined for each individual key."
  query         = query.keyvault_key_automatic_rotation_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_3_9.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.9"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_10" {
  title         = "8.3.10 Ensure that Azure Key Vault Managed HSM is used when required"
  description   = "Azure Key Vault Managed HSM is a fully managed, highly available, single-tenant cloud service that safeguards cryptographic keys using FIPS 140-2 Level 3 validated HSMs."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_8_3_10.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/KeyVault"
  })
}

control "cis_v500_8_3_11" {
  title         = "8.3.11 Ensure certificate 'Validity Period (in months)' is less than or equal to '12'"
  description   = "Restrict the validity period of certificates stored in Azure Key Vault to 12 months or less."
  query         = query.keyvault_certificate_validity_period_less_equal_12_months
  documentation = file("./cis_v500/docs/cis_v500_8_3_11.md")

  tags = merge(local.cis_v500_8_3_common_tags, {
    cis_item_id = "8.3.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

benchmark "cis_v500_8_4" {
  title         = "8.4 Azure Bastion"
  documentation = file("./cis_v500/docs/cis_v500_8_4.md")
  children = [
    control.cis_v500_8_4_1
  ]

  tags = merge(local.cis_v500_8_4_common_tags, {
    type    = "Benchmark"
    service = "Azure/Network"
  })
}

control "cis_v500_8_4_1" {
  title         = "8.4.1 Ensure an Azure Bastion Host Exists"
  description   = "The Azure Bastion service allows secure remote access to Azure Virtual Machines over the Internet without exposing remote access protocol ports and services directly to the Internet. The Azure Bastion service provides this access using TLS over 443/TCP, and subscribes to hardened configurations within an organization's Azure Active Directory service."
  query         = query.network_bastion_host_min_1
  documentation = file("./cis_v500/docs/cis_v500_8_4_1.md")

  tags = merge(local.cis_v500_8_4_common_tags, {
    cis_item_id = "8.4.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}

control "cis_v500_8_5" {
  title         = "8.5 Ensure Azure DDoS Network Protection is enabled on virtual networks"
  description   = "Azure DDoS Network Protection defends resources in virtual networks against distributed denial-of-service (DDoS) attacks."
  query         = query.network_ddos_enabled
  documentation = file("./cis_v500/docs/cis_v500_8_5.md")

  tags = merge(local.cis_v500_8_common_tags, {
    cis_item_id = "8.5"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Network"
  })
}
