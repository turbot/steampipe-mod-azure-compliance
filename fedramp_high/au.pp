benchmark "fedramp_high_au" {
  title       = "Audit And Accountability (AU)"
  description = "The FedRAMP High baseline requires that audit logs are generated and reviewed for security-relevant events. This benchmark verifies that audit logs are generated and reviewed for security-relevant events."

  children = [
    benchmark.fedramp_high_au_6,
    benchmark.fedramp_high_au_12
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_au_6" {
  title       = "Audit Record Review, Analysis And Reporting (AU-6)"
  description = "Integrate audit review, analysis, and reporting with processes for investigation and response to suspicious activities."

  children = [
    benchmark.fedramp_high_au_6_4,
    benchmark.fedramp_high_au_6_5,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.network_watcher_enabled,
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

benchmark "fedramp_high_au_6_4" {
  title       = "AU-6(4) Central Review And Analysis"
  description = "Provide and implement the capability to centrally review and analyze audit records from multiple components within the system."

  children = [
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]
}

benchmark "fedramp_high_au_6_5" {
  title       = "AU-6(5) Integration / Scanning And Monitoring Capabilities"
  description = "Integrate analysis of audit records with analysis of [Selection (one or more): vulnerability scanning information; performance data; system monitoring information; [Assignment: organization-defined data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual activity."

  children = [
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]
}

benchmark "fedramp_high_au_12" {
  title       = "Audit Generation (AU-12)"
  description = "Audit events defined in AU-2. Allow trusted personnel to select which events to audit. Generate audit records for events."

  children = [
    benchmark.fedramp_high_au_12_1,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]
}

benchmark "fedramp_high_au_12_1" {
  title       = "AU-12(1) System-Wide / Time-Correlated Audit Trail"
  description = "Compile audit records from [Assignment: organization-defined system components] into a system-wide (logical or physical) audit trail that is time-correlated to within [Assignment: organization-defined level of tolerance for the relationship between time stamps of individual records in the audit trail]."

  children = [
    control.appservice_web_app_diagnostic_logs_enabled,
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.batch_account_logging_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.datalake_analytics_account_logging_enabled,
    control.datalake_store_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.network_watcher_enabled,
    control.search_service_logging_enabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_on,
    control.sql_server_azure_defender_enabled,
    control.stream_analytics_job_logging_enabled
  ]
}
