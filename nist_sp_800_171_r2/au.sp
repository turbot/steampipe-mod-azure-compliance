benchmark "nist_sp_800_171_r2_3_3" {
  title       = "3.3 Audit and Accountability"
  description = "The AU control family consists of security controls related to an organization’s audit capabilities. This includes audit policies and procedures, audit logging, audit report generation, and protection of audit information."
  children = [
    benchmark.nist_sp_800_171_r2_3_3_1,
    benchmark.nist_sp_800_171_r2_3_3_2,
    benchmark.nist_sp_800_171_r2_3_3_4,
    benchmark.nist_sp_800_171_r2_3_3_5
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_3_1" {
  title       = "3.3.1 Create and retain system audit logs and records to the extent needed to enable the monitoring, analysis, investigation, and reporting of unlawful or unauthorized system activity"
  description = "An event is any observable occurrence in a system, which includes unlawful or unauthorized system activity. Organizations identify event types for which a logging functionality is needed as those events which are significant and relevant to the security of systems and the environments in which those systems operate to meet specific and ongoing auditing needs. Event types can include password changes, failed logons or failed accesses related to systems, administrative privilege usage, or third-party credential usage. In determining event types that require logging, organizations consider the monitoring and auditing appropriate for each of the CUI security requirements. Monitoring and auditing requirements can be balanced with other system needs. For example, organizations may determine that systems must have the capability to log every file access both successful and unsuccessful, but not activate that capability except for specific circumstances due to the potential burden on system performance. Audit records can be generated at various levels of abstraction, including at the packet level as information traverses the network. Selecting the appropriate level of abstraction is a critical aspect of an audit logging capability and can facilitate the identification of root causes to problems. Organizations consider in the definition of event types, the logging necessary to cover related events such as the steps in distributed, transaction-based processes (e.g., processes that are distributed across multiple organizations) and actions that occur in service-oriented or cloudbased architectures. Audit record content that may be necessary to satisfy this requirement includes time stamps, source and destination addresses, user or process identifiers, event descriptions, success or fail indications, filenames involved, and access control or flow control rules invoked. Event outcomes can include indicators of event success or failure and event-specific results (e.g., the security state of the system after the event occurred). Detailed information that organizations may consider in audit records includes full text recording of privileged commands or the individual identities of group account users. Organizations consider limiting the additional audit log information to only that information explicitly needed for specific audit requirements. This facilitates the use of audit trails and audit logs by not including information that could potentially be misleading or could make it more difficult to locate information of interest. Audit logs are reviewed and analyzed as often as needed to provide important information to organizations to facilitate risk-based decision making."
  children = [
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.sql_server_auditing_on,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_database,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.network_watcher_enabled,
    control.datalake_store_account_logging_enabled,
    control.stream_analytics_job_logging_enabled,
    control.batch_account_logging_enabled,
    control.datalake_analytics_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.search_service_logging_enabled,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_storage_account_destination_retention_90_days,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_3_2" {
  title       = "3.3.2 Ensure that the actions of individual system users can be uniquely traced to those users, so they can be held accountable for their actions"
  description = ""
  children = [
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.sql_server_auditing_on,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_database,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.network_watcher_enabled,
    control.datalake_store_account_logging_enabled,
    control.stream_analytics_job_logging_enabled,
    control.batch_account_logging_enabled,
    control.datalake_analytics_account_logging_enabled,
    control.eventhub_namespace_logging_enabled,
    control.iot_hub_logging_enabled,
    control.keyvault_logging_enabled,
    control.logic_app_workflow_logging_enabled,
    control.search_service_logging_enabled,
    control.servicebus_namespace_logging_enabled,
    control.sql_server_auditing_storage_account_destination_retention_90_days,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_3_4" {
  title       = "3.3.4 Alert in the event of an audit logging process failure"
  description = ""
  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_3_5" {
  title       = "3.3.5 Correlate audit record review, analysis, and reporting processes for investigation and response to indications of unlawful, unauthorized, suspicious, or unusual activity"
  description = ""
  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}