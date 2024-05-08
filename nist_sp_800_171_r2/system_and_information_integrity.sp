benchmark "nist_sp_800_171_r2_3_14" {
  title       = "3.14 System and Information Integrity"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_14_1
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
