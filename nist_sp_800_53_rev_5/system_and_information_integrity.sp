benchmark "nist_sp_800_53_rev_5_si" {
  title       = "System and Information Integrity (SI)"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."
  children = [
    benchmark.nist_sp_800_53_rev_5_si_2,
    benchmark.nist_sp_800_53_rev_5_si_3,
    benchmark.nist_sp_800_53_rev_5_si_4,
    benchmark.nist_sp_800_53_rev_5_si_16
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_si_2" {
  title       = "Flaw Remediation (SI-2)"
  description = "The organization identifies, reports, and corrects information system flaws, tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation, installs security-relevant software and firmware updates within the organization-defined time period of the release of the updates, and incorporates flaw remediation into the organizational configuration management process."
  children = [
    benchmark.nist_sp_800_53_rev_5_si_2_6,
    control.appservice_azure_defender_enabled,
    control.appservice_function_app_latest_http_version,
    control.appservice_web_app_latest_http_version,
    control.compute_vm_azure_defender_enabled,
    control.container_registry_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.kubernetes_azure_defender_enabled,
    control.resource_manager_azure_defender_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.appservice_function_app_latest_java_version,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_web_app_latest_python_version,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.compute_vm_system_updates_installed,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_2_6" {
  title       = "SI-2(6) Removal of Previous Versions of Software and Firmware"
  description = "The organization removes organization-defined software and firmware components after updated versions have been installed."
  children = [
    control.appservice_function_app_latest_http_version,
    control.appservice_web_app_latest_http_version,
    control.appservice_function_app_latest_java_version,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_web_app_latest_python_version,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_3" {
  title       = "Malicious Code Protection (SI-3)"
  description = "The organization employs malicious code protection mechanisms at information system entry and exit points to detect and eradicate malicious code; updates malicious code protection mechanisms whenever new releases are available in accordance with organizational configuration management policy and procedures; addresses the receipt of false positives during malicious code detection and eradication and the resulting potential impact on the availability of the information system; and configures malicious code protection mechanisms to perform periodic scans of the information system and real-time scans of files from external sources at an endpoint, network entry/exit points as the files are downloaded, opened, or executed in accordance with organizational security policy, and block and quarantine malicious code, send alert to the administrator and take organization-defined action in response to malicious code detection."
  children = [
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.compute_vm_scale_set_endpoint_protection_solution_installed,
    control.compute_vm_monitor_missing_endpoint_protection_in_asc
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_4" {
  title       = "System Monitoring (SI-4)"
  description = "The organization monitors the information system to detect attacks and indicators of potential attacks in accordance with organization-defined monitoring objectives and unauthorized local, network, and remote connections; identifies unauthorized use of the information system through organization-defined techniques and methods; deploys monitoring devices strategically within the information system to collect organization-determined essential information and at ad hoc locations within the system to track specific types of transactions of interest to the organization; protects information obtained from intrusion-monitoring tools from unauthorized access, modification, and deletion; heightens the level of information system monitoring activity whenever there is an indication of increased risk to organizational operations and assets, individuals, other organizations, or the Nation based on law enforcement information, intelligence information, or other credible sources of information; obtains legal opinion with regard to information system monitoring activities in accordance with applicable federal laws, Executive Orders, directives, policies, or regulations; and provides organization-defined system monitoring information to organization-defined personnel or roles as needed."
  children = [
    benchmark.nist_sp_800_53_rev_5_si_4_12,
    control.appservice_azure_defender_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.container_registry_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.kubernetes_azure_defender_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.securitycenter_azure_defender_on_for_sqlservervm
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_4_12" {
  title       = "SI-4(12) Automated Organization-generated Alerts"
  description = "The organization employs automated mechanisms to alert security personnel of the organization-defined activities that trigger alerts with security implications."
  children = [
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.securitycenter_email_configured
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_16" {
  title       = "Memory Protection (SI-16)"
  description = "The information system implements organization-defined security safeguards to protect its memory from unauthorized code execution."
  children = [
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_windows_defender_exploit_guard_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
