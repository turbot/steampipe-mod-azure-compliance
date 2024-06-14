benchmark "fedramp_high_si" {
  title       = "System and Information Integrity (SI)"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."

  children = [
    benchmark.fedramp_high_si_2,
    benchmark.fedramp_high_si_3,
    benchmark.fedramp_high_si_4,
    benchmark.fedramp_high_si_16
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_si_2" {
  title       = "Flaw Remediation (SI-2)"
  description = "The organization: a.Identifies, reports, and corrects information system flaws; b.Tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation; c.Installs security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates; and d.Incorporates flaw remediation into the organizational configuration management process."

  children = [
    control.appservice_function_app_latest_http_version,
    control.appservice_web_app_latest_http_version,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_database_vulnerability_findings_resolved
  ]
}

benchmark "fedramp_high_si_3" {
  title = "Malicious Code Protection (SI-3)"

  children = [
    benchmark.fedramp_high_si_3_1,
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}

benchmark "fedramp_high_si_3_1" {
  title = "SI-3(1) Central Management"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}

benchmark "fedramp_high_si_4" {
  title       = "Information System Monitoring (SI-4)"
  description = "The organization: a.Monitors the information system to detect: 1. Attacks and indicators of potential attacks in accordance with [Assignment: organization-defined monitoring objectives]; and 2.Unauthorized local, network, and remote connections; b. Identifies unauthorized use of the information system through [Assignment: organization-defined techniques and methods]; c. Deploys monitoring devices: 1. Strategically within the information system to collect organization-determined essential information; and 2. At ad hoc locations within the system to track specific types of transactions of interest to the organization; d. Protects information obtained from intrusion-monitoring tools from unauthorized access, modification, and deletion; e. Heightens the level of information system monitoring activity whenever there is an indication of increased risk to organizational operations and assets, individuals, other organizations, or the Nation based on law enforcement information, intelligence information, or other credible sources of information; f. Obtains legal opinion with regard to information system monitoring activities in accordance with applicable federal laws, Executive Orders, directives, policies, or regulations; and g. Provides [Assignment: organization-defined information system monitoring information] to [Assignment: organization-defined personnel or roles] [Selection (one or more): as needed; [Assignment: organization-defined frequency]]."

  children = [
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.network_watcher_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_server_azure_defender_enabled
  ]
}

benchmark "fedramp_high_si_16" {
  title = "Memory Protection (SI-16)"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}