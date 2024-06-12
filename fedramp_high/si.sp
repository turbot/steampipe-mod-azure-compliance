benchmark "fedramp_high_systam_and_information_integrity" {
  title       = "System And Information Integrity"
  description = "The organization: (i) identifies, reports, and corrects information and information system flaws in a timely manner; (ii) provides protection from malicious code at appropriate locations within the information system; (iii) monitors information system security alerts and advisories and takes action in response; (iv) establishes and maintains a malicious code protection mechanism for the information system; and (v) updates malicious code protection mechanisms when new releases are available."

  children = [
    benchmark.fedramp_high_systam_and_information_integrity_2,
    benchmark.fedramp_high_systam_and_information_integrity_3,
    benchmark.fedramp_high_systam_and_information_integrity_4,
    benchmark.fedramp_high_systam_and_information_integrity_16
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_systam_and_information_integrity_2" {
  title = "Flaw Remediation-2"

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

benchmark "fedramp_high_systam_and_information_integrity_3" {
  title = "Malicious Code Protection-3"

  children = [
    benchmark.fedramp_high_systam_and_information_integrity_3_1,
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}

benchmark "fedramp_high_systam_and_information_integrity_3_1" {
  title = "Central Management-3.1"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}

benchmark "fedramp_high_systam_and_information_integrity_4" {
  title = "Information System Monitoring-4"

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

benchmark "fedramp_high_systam_and_information_integrity_16" {
  title = "Memory Protection-16"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_server
  ]
}