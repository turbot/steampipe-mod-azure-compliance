benchmark "nist_sp_800_53_rev_5_au" {
  title       = "Audit and Accountability Control (AU)"
  description = "The AU control family consists of security controls related to an organization’s audit capabilities. This includes audit policies and procedures, audit logging, audit report generation, and protection of audit information."
  children = [
    benchmark.nist_sp_800_53_rev_5_au_6,
    benchmark.nist_sp_800_53_rev_5_au_11,
    benchmark.nist_sp_800_53_rev_5_au_12
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_au_6" {
  title       = "Audit Record Review, Analysis, and Reporting (AU-6)"
  description = "Integrate audit review, analysis, and reporting with processes for investigation and response to suspicious activities."
  children = [
    benchmark.nist_sp_800_53_rev_5_au_6_4,
    benchmark.nist_sp_800_53_rev_5_au_6_5,
    control.appservice_azure_defender_enabled,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_au_6_4" {
  title       = "Central Review and Analysis AU-6(4)"
  description = "The information system provides the capability to centrally review and analyze audit records from multiple components within the system."
  children = [
    control.appservice_azure_defender_enabled,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.dns_azure_defender_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_azure_defender_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.servicebus_namespace_logging_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_au_6_5" {
  title       = "Integrated Analysis of Audit Records AU-6(5)"
  description = "The organization integrates analysis of audit records with analysis of vulnerable scanning information, performance data, and information system monitoring information collected from other sources to further enhance the ability to identify inappropriate or unusual activity."
  children = [
    control.appservice_azure_defender_enabled,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.dns_azure_defender_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_azure_defender_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.servicebus_namespace_logging_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_au_11" {
  title       = "Audit Record Retention (AU-11)"
  description = "Retain audit records for security investigations. Meet regulatory and organizational data retention requirements."
  children = [
    control.sql_server_auditing_storage_account_destination_retention_90_days
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/SQL"
  })
}

benchmark "nist_sp_800_53_rev_5_au_12" {
  title       = "Audit Record Generation (AU-12)"
  description = "Audit events defined in AU-2. Allow trusted personnel to select which events to audit. Generate audit records for events."
  children = [
    benchmark.nist_sp_800_53_rev_5_au_12_1,
    control.appservice_azure_defender_enabled,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.dns_azure_defender_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_azure_defender_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.servicebus_namespace_logging_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_au_12_1" {
  title       = "System-wide and Time-correlated Audit Trail AU-12(1)"
  description = "The information system compiles audit records from organization-defined information system components into a system-wide (logical or physical) audit trail that is time-correlated to within organization-defined level of tolerance for the relationship between timestamps of individual records in the audit trail."
  children = [
    control.appservice_azure_defender_enabled,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.arc_kubernetes_cluster_azure_defender_extension_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.dns_azure_defender_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_azure_defender_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.resource_manager_azure_defender_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.servicebus_namespace_logging_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
