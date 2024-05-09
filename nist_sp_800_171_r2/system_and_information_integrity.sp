benchmark "nist_sp_800_171_r2_3_14" {
  title       = "3.14 System and Information Integrity"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_14_1,
    benchmark.nist_sp_800_171_r2_3_14_2,
    benchmark.nist_sp_800_171_r2_3_14_3,
    benchmark.nist_sp_800_171_r2_3_14_4,
    benchmark.nist_sp_800_171_r2_3_14_5,
    benchmark.nist_sp_800_171_r2_3_14_6,
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_14_1" {
  title       = "3.14.1 Identify, report, and correct system flaws in a timely manner"
  description = ""
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
  description = ""
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
  description = ""
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
  description = ""
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
  description = ""
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
  description = ""
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