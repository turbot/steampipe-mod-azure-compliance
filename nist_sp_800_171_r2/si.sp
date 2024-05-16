benchmark "nist_sp_800_171_r2_3_14" {
  title       = "3.14 System and Information Integrity"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."
  children = [
    benchmark.nist_sp_800_171_r2_3_14_1,
    benchmark.nist_sp_800_171_r2_3_14_2,
    benchmark.nist_sp_800_171_r2_3_14_3,
    benchmark.nist_sp_800_171_r2_3_14_4,
    benchmark.nist_sp_800_171_r2_3_14_5,
    benchmark.nist_sp_800_171_r2_3_14_6,
    benchmark.nist_sp_800_171_r2_3_14_7
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_14_1" {
  title       = "3.14.1 Identify, report, and correct system flaws in a timely manner"
  description = "Organizations identify systems that are affected by announced software and firmware flaws including potential vulnerabilities resulting from those flaws and report this information to designated personnel with information security responsibilities. Security-relevant updates include patches, service packs, hot fixes, and anti-virus signatures. Organizations address flaws discovered during security assessments, continuous monitoring, incident response activities, and system error handling. Organizations can take advantage of available resources such as the Common Weakness Enumeration (CWE) database or Common Vulnerabilities and Exposures (CVE) database in remediating flaws discovered in organizational systems. Organization-defined time periods for updating security-relevant software and firmware may vary based on a variety of factors including the criticality of the update (i.e., severity of the vulnerability related to the discovered flaw). Some types of flaw remediation may require more testing than other types of remediation."
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.appservice_web_app_latest_http_version,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.appservice_function_app_latest_http_version,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.compute_vm_endpoint_protection_agent_installed,
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_scale_set_system_updates_installed,
    control.compute_vm_system_updates_installed,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_14_2" {
  title       = "3.14.2 Provide protection from malicious code at designated locations within organizational systems"
  description = "Designated locations include system entry and exit points which may include firewalls, remoteaccess servers, workstations, electronic mail servers, web servers, proxy servers, notebook computers, and mobile devices. Malicious code includes viruses, worms, Trojan horses, and spyware. Malicious code can be encoded in various formats (e.g., UUENCODE, Unicode), contained within compressed or hidden files, or hidden in files using techniques such as steganography. Malicious code can be inserted into systems in a variety of ways including web accesses, electronic mail, electronic mail attachments, and portable storage devices. Malicious code insertions occur through the exploitation of system vulnerabilities. Malicious code protection mechanisms include anti-virus signature definitions and reputationbased technologies. A variety of technologies and methods exist to limit or eliminate the effects of malicious code. Pervasive configuration management and comprehensive software integrity controls may be effective in preventing execution of unauthorized code. In addition to commercial off-the-shelf software, malicious code may also be present in custom-built software. This could include logic bombs, back doors, and other types of cyber-attacks that could affect organizational missions/business functions. Traditional malicious code protection mechanisms cannot always detect such code. In these situations, organizations rely instead on other safeguards including secure coding practices, configuration management and control, trusted procurement processes, and monitoring practices to help ensure that software does not perform functions other than the functions intended."
  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_endpoint_protection_agent_installed,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_14_3" {
  title       = "3.14.3 Monitor system security alerts and advisories and take action in response"
  description = "There are many publicly available sources of system security alerts and advisories. For example, the Department of Homeland Security’s Cybersecurity and Infrastructure Security Agency (CISA) generates security alerts and advisories to maintain situational awareness across the federal government and in nonfederal organizations. Software vendors, subscription services, and industry information sharing and analysis centers (ISACs) may also provide security alerts and advisories. Examples of response actions include notifying relevant external organizations, for example, external mission/business partners, supply chain partners, external service providers, and peer or supporting organizations."
  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.compute_vm_endpoint_protection_agent_installed,
    control.securitycenter_email_configured
  ]
}

benchmark "nist_sp_800_171_r2_3_14_4" {
  title       = "3.14.4 Update malicious code protection mechanisms when new releases are available"
  description = "Malicious code protection mechanisms include anti-virus signature definitions and reputationbased technologies. A variety of technologies and methods exist to limit or eliminate the effects of malicious code. Pervasive configuration management and comprehensive software integrity controls may be effective in preventing execution of unauthorized code. In addition to commercial off-the-shelf software, malicious code may also be present in custom-built software. This could include logic bombs, back doors, and other types of cyber-attacks that could affect organizational missions/business functions. Traditional malicious code protection mechanisms cannot always detect such code. In these situations, organizations rely instead on other safeguards including secure coding practices, configuration management and control, trusted procurement processes, and monitoring practices to help ensure that software does not perform functions other than the functions intended."
  children = [
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_endpoint_protection_agent_installed,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_14_5" {
  title       = "3.14.5 Perform periodic scans of the information system and real-time scans of files from external sources as files are downloaded, opened, or executed"
  description = ""
  children = [
    control.securitycenter_azure_defender_on_for_server,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_endpoint_protection_agent_installed,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]
}

benchmark "nist_sp_800_171_r2_3_14_6" {
  title       = "3.14.6 Monitor organizational systems, including inbound and outbound communications traffic, to detect attacks and indicators of potential attacks"
  description = "System monitoring includes external and internal monitoring. External monitoring includes the observation of events occurring at the system boundary (i.e., part of perimeter defense and boundary protection). Internal monitoring includes the observation of events occurring within the system. Organizations can monitor systems, for example, by observing audit record activities in real time or by observing other system aspects such as access patterns, characteristics of access, and other actions. The monitoring objectives may guide determination of the events. System monitoring capability is achieved through a variety of tools and techniques (e.g., intrusion detection systems, intrusion prevention systems, malicious code protection software, scanning tools, audit record monitoring software, network monitoring software). Strategic locations for monitoring devices include selected perimeter locations and near server farms supporting critical applications, with such devices being employed at managed system interfaces. The granularity of monitoring information collected is based on organizational monitoring objectives and the capability of systems to support such objectives. System monitoring is an integral part of continuous monitoring and incident response programs. Output from system monitoring serves as input to continuous monitoring and incident response programs. A network connection is any connection with a device that communicates through a network (e.g., local area network, Internet). A remote connection is any connection with a device communicating through an external network (e.g., the Internet). Local, network, and remote connections can be either wired or wireless. Unusual or unauthorized activities or conditions related to inbound/outbound communications traffic include internal traffic that indicates the presence of malicious code in systems or propagating among system components, the unauthorized exporting of information, or signaling to external systems. Evidence of malicious code is used to identify potentially compromised systems or system components. System monitoring requirements, including the need for specific types of system monitoring, may be referenced in other requirements."
  children = [
    control.network_subnet_protected_by_firewall,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.network_watcher_enabled,
    control.securitycenter_email_configured,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]
}

benchmark "nist_sp_800_171_r2_3_14_7" {
  title       = "3.14.7 Identify unauthorized use of organizational systems"
  description = "System monitoring includes external and internal monitoring. System monitoring can detect unauthorized use of organizational systems. System monitoring is an integral part of continuous monitoring and incident response programs. Monitoring is achieved through a variety of tools and techniques (e.g., intrusion detection systems, intrusion prevention systems, malicious code protection software, scanning tools, audit record monitoring software, network monitoring software). Output from system monitoring serves as input to continuous monitoring and incident response programs. Unusual/unauthorized activities or conditions related to inbound and outbound communications traffic include internal traffic that indicates the presence of malicious code in systems or propagating among system components, the unauthorized exporting of information, or signaling to external systems. Evidence of malicious code is used to identify potentially compromised systems or system components. System monitoring requirements, including the need for specific types of system monitoring, may be referenced in other requirements."
  children = [
    control.network_subnet_protected_by_firewall,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.network_watcher_enabled,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]
}