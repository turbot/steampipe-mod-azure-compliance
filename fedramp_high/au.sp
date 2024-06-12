benchmark "fedramp_high_audit_and_accountability" {
  title = "Audit And Accountability"
  description = "The FedRAMP High baseline requires that audit logs are generated and reviewed for security-relevant events. This benchmark verifies that audit logs are generated and reviewed for security-relevant events."

  children = [
    benchmark.fedramp_high_audit_and_accountability_6,
    benchmark.fedramp_high_audit_and_accountability_12
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_audit_and_accountability_6" {
  title = "Audit Review, Analysis, And Reporting-6"

  children = [
    benchmark.fedramp_high_audit_and_accountability_6_4,
    benchmark.fedramp_high_audit_and_accountability_6_5,
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

benchmark "fedramp_high_audit_and_accountability_6_4" {
  title = "Central Review And Analysis-6.4"

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

benchmark "fedramp_high_audit_and_accountability_6_5" {
  title = "Integration / Scanning And Monitoring Capabilities-6.5"

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

benchmark "fedramp_high_audit_and_accountability_12" {
  title = "Audit Generation-12"

  children = [
    benchmark.fedramp_high_audit_and_accountability_12_1,
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

benchmark "fedramp_high_audit_and_accountability_12_1" {
  title = "System-Wide / Time-Correlated Audit Trail-12.1"

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
