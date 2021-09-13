benchmark "nist_sp_800_53_rev_5_si" {
  title       = "System and Information Integrity (SI)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_si_2,
    benchmark.nist_sp_800_53_rev_5_si_3,
    benchmark.nist_sp_800_53_rev_5_si_4,
    benchmark.nist_sp_800_53_rev_5_si_16
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_si_2" {
  title       = "Flaw Remediation (SI-4)"
  description = "to  do"
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
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_2_6" {
  title       = "SI-2(6) Removal of Previous Versions of Software and Firmware"
  description = "to  do"
  children = [
    control.appservice_function_app_latest_http_version,
    control.appservice_web_app_latest_http_version
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_3" {
  title       = "Malicious Code Protection (SI-3)"
  description = "to  do"
  children = [
    control.compute_vm_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_4" {
  title       = "System Monitoring (SI-4)"
  description = "to  do"
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
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_4_12" {
  title       = "SI-4(12) Automated Organization-generated Alerts"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_si_16" {
  title       = "Memory Protection (SI-16)"
  description = "to  do"
  children = [
    control.compute_vm_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
