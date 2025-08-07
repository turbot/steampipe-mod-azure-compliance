
benchmark "pci_dss_v401_requirement_10" {
  title       = "10 - Log and Monitor All Access to System Components and Cardholder Data"

  description = <<-MARKDOWN
    Logging mechanisms and the ability to track user activities are critical in preventing, detecting, or minimizing the impact of a data compromise.
    The presence of logs on all system components and in the cardholder data environment (CDE) allows thorough tracking, alerting, and analysis
    when something does go wrong. Determining the cause of a compromise is difficult, if not impossible, without system activity logs.

    This requirement applies to user activities, including those by employees, contractors, consultants, and internal and external vendors, and other
    third parties (for example, those providing support or maintenance services).

    These requirements do not apply to user activity of consumers (cardholders).

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_10_2,
    benchmark.pci_dss_v401_requirement_10_3,
    benchmark.pci_dss_v401_requirement_10_4,
    benchmark.pci_dss_v401_requirement_10_7,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_2" {
  title       = "10.2 - Audit logs are implemented to support the detection of anomalies and suspicious activity, and the forensic analysis of events."

  children = [
    benchmark.pci_dss_v401_requirement_10_2_1,
    benchmark.pci_dss_v401_requirement_10_2_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_2_1" {
  title       = "10.2.1 - Audit logs are enabled and active for all system components and cardholder data."

  children = [
    benchmark.pci_dss_v401_requirement_10_2_1_2,
    benchmark.pci_dss_v401_requirement_10_2_1_5,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_2_1_2" {
  title       = "10.2.1.2 - Audit logs capture all actions taken by any individual with administrative access, including any interactive use of application or system accounts. "

  children = [
    # Azure Monitor should collect activity logs from all regions
    control.monitor_log_profile_enabled_for_all_regions,

    # An activity log alert should exist for specific Policy operations
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,

    # Audit flow logs configuration for every virtual network
    control.audit_flow_logs_configuration_for_every_virtual_network,

    # Azure subscriptions should have a log profile for Activity Log
    control.log_profile_enabled_for_all_subscription,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Flow logs should be configured for every network security group
    control.network_sg_flowlog_enabled,

    # An activity log alert should exist for specific Security operations
    control.an_activity_log_alert_should_exist_for_specific_security_operations,

    # Diagnostic logs in Service Bus should be enabled
    control.servicebus_namespace_logging_enabled,

    # Diagnostic logs in Azure Stream Analytics should be enabled
    control.stream_analytics_job_logging_enabled,

    # Guest Attestation extension should be installed on supported Linux virtual machines
    control.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines,

    # Diagnostic logs in Kubernetes services should be enabled
    control.kubernetes_cluster_logging_enabled,

    # Linux virtual machines should use only signed and trusted boot components
    control.linux_virtual_machines_should_use_only_signed_and_trusted_boot_components,

    # Resource logs in Azure Databricks Workspaces should be enabled
    control.resource_logs_in_azure_databricks_workspaces_should_be_enabled,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Audit diagnostic setting for selected resource types
    control.audit_diagnostic_setting,

    # Windows machines should meet requirements for 'System Audit Policies - Policy Change'
    control.windows_machines_should_meet_requirements_for_system_audit_policies_policy_change_,

    # Managed identity should be enabled on web apps
    control.appservice_web_app_uses_managed_identity,

    # Diagnostic logs in App Service should be enabled
    control.diagnostic_logs_in_app_service_should_be_enabled,

    # Windows machines should meet requirements for 'System Audit Policies - Account Management'
    control.compute_vm_guest_configuration_with_azure_baseline_system_audit_policies_account_management,

    # Windows machines should meet requirements for 'System Audit Policies - Privilege Use'
    control.windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_,

    # Resource logs in Azure Machine Learning Workspaces should be enabled
    control.resource_logs_in_azure_machine_learning_workspaces_should_be_enabled,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,

    # SQL Auditing settings should have Action-Groups configured to capture critical activities
    control.sql_auditing_settings_should_have_action_groups_configured_to_capture_critical_activities,

    # Resource logs in Azure Key Vault Managed HSM should be enabled
    control.keyvault_managed_hms_logging_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_2_1_5" {
  title       = "10.2.1.5 -  Audit logs capture all changes to identification and authentication credentials."

  description = <<-MARKDOWN
    Audit logs capture all changes to identification and authentication credentials including, but not limited to:

    * Creation of new accounts.
    * Elevation of privileges.
    * All changes, additions, or deletions to accounts with administrative access.
  MARKDOWN

  children = [
    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # An activity log alert should exist for specific Security operations
    control.an_activity_log_alert_should_exist_for_specific_security_operations,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Windows machines should meet requirements for 'System Audit Policies - Account Management'
    control.compute_vm_guest_configuration_with_azure_baseline_system_audit_policies_account_management,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_2_2" {
  title       = "10.2.2 - Audit logs record the details for each auditable event."

  description = <<-MARKDOWN
    Audit logs record the following details for each auditable event:

    * User identification.
    * Type of event.
    * Date and time.
    * Success and failure indication.
    * Origination of event.
    * Identity or name of affected data, system component, resource, or service (for example, name and protocol).
  MARKDOWN

  children = [
    # Audit flow logs configuration for every virtual network
    control.audit_flow_logs_configuration_for_every_virtual_network,

    # Azure subscriptions should have a log profile for Activity Log
    control.log_profile_enabled_for_all_subscription,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Auditing on SQL server should be enabled
    control.sql_server_auditing_on,

    # Audit resource location matches resource group location
    control.audit_resource_location_matches_resource_group_location,

    # Diagnostic logs in Batch accounts should be enabled
    control.diagnostic_logs_in_batch_accounts_should_be_enabled,

    # Diagnostic logs in Event Hub should be enabled
    control.eventhub_namespace_logging_enabled,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_3" {
  title       = "10.3 - Audit logs are protected from destruction and unauthorized modifications."

  children = [
    benchmark.pci_dss_v401_requirement_10_3_1,
    benchmark.pci_dss_v401_requirement_10_3_2,
    benchmark.pci_dss_v401_requirement_10_3_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_3_1" {
  title       = "10.3.1 - Read access to audit logs files is limited to those with a job-related need."

  children = [
    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_3_2" {
  title       = "10.3.2 - Audit log files are protected to prevent modifications by individuals."

  children = [
    # Email notification for high severity alerts should be enabled
    control.securitycenter_notify_alerts_configured,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Azure Monitor Logs for Application Insights should be linked to a Log Analytics workspace
    control.application_insights_linked_to_log_analytics_workspace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_3_4" {
  title       = "10.3.4 - File integrity monitoring or change-detection mechanisms is used on audit logs to ensure that existing log data cannot be changed without generating alerts."

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Email notification for high severity alerts should be enabled
    control.securitycenter_notify_alerts_configured,

    # Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'
    control.monitor_log_profile_enabled_for_all_categories,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Flow logs should be configured for every network security group
    control.network_sg_flowlog_enabled,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # Linux virtual machines should enforce kernel module signature validation
    control.linux_virtual_machines_should_enforce_kernel_module_signature_validation,

    # EDR configuration issues should be resolved on virtual machines
    control.edr_configuration_issues_should_be_resolved_on_virtual_machines,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Virtual machines guest attestation status should be healthy
    control.virtual_machines_guest_attestation_status_should_be_healthy,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # Guest Attestation extension should be installed on supported Linux virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machine_scale_sets,

    # Microsoft Defender for APIs should be enabled
    control.microsoft_defender_for_apis_should_be_enabled,

    # Guest Attestation extension should be installed on supported Windows virtual machines
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines,

    # Containers should only use allowed AppArmor profiles
    control.kubernetes_cluster_container_use_allowed_apparmor_profile,

    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,

    # Azure Local machines should meet Secured-core requirements
    control.azure_local_machines_should_meet_secured_core_requirements,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Secure Boot should be enabled on supported Windows virtual machines
    control.compute_windows_vm_secure_boot_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Code repositories should have infrastructure as code scanning findings resolved
    control.code_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Immutable (read-only) root filesystem should be enforced for containers
    control.kubernetes_cluster_container_with_read_only_root_file_system,

    # Azure API Management APIs should be onboarded to Defender for APIs
    control.azure_api_management_apis_should_be_onboarded_to_defender_for_apis,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # Java should be updated to the latest version for API apps
    control.appservice_web_app_latest_java_version,

    # Linux virtual machines should use Secure Boot
    control.linux_virtual_machines_should_use_secure_boot,

    # Guest Attestation extension should be installed on supported Windows virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4" {
  title       = "10.4 - Audit logs are reviewed to identify anomalies or suspicious activity."

  children = [
    benchmark.pci_dss_v401_requirement_10_4_1,
    benchmark.pci_dss_v401_requirement_10_4_2,
    benchmark.pci_dss_v401_requirement_10_4_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4_1" {
  title       = "10.4.1 - Specific audit logs are reviewed at least once daily."

  description = <<-MARKDOWN
    The following audit logs are reviewed at least once daily:

    * All security events.
    * Logs of all system components that store, process, or transmit CHD and/or SAD.
    * Logs of all critical system components.
    * Logs of all servers and system components that perform security functions (for example, network
      security controls, intrusion-detection systems/intrusion-prevention systems (IDS/IPS),
      authentication servers).
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_10_4_1_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4_1_1" {
  title       = "10.4.1.1 - Automated mechanisms are used to perform audit log reviews."

  children = [
    # An activity log alert should exist for specific Policy operations
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,

    # Azure subscriptions should have a log profile for Activity Log
    control.log_profile_enabled_for_all_subscription,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # Resource logs in Azure Key Vault Managed HSM should be enabled
    control.keyvault_managed_hms_logging_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4_2" {
  title       = "10.4.2 - Logs of all other system components (those not specified in Requirement 10.4.1) are reviewed periodically."

  children = [
    benchmark.pci_dss_v401_requirement_10_4_2_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4_2_1" {
  title       = "10.4.2.1 - The frequency of periodic log reviews for all other system components (not defined in Requirement 10.4.1) is defined in the entity’s targeted risk analysis, which is performed according to all elements specified in Requirement 12.3.1."

  children = [
    # Azure Monitor should collect activity logs from all regions
    control.monitor_log_profile_enabled_for_all_regions,

    # An activity log alert should exist for specific Policy operations
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,

    # Azure subscriptions should have a log profile for Activity Log
    control.log_profile_enabled_for_all_subscription,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Diagnostic logs in Service Bus should be enabled
    control.servicebus_namespace_logging_enabled,

    # Diagnostic logs in Azure Stream Analytics should be enabled
    control.stream_analytics_job_logging_enabled,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Diagnostic logs in Data Lake Analytics should be enabled
    control.diagnostic_logs_in_data_lake_analytics_should_be_enabled,

    # Diagnostic logs in Kubernetes services should be enabled
    control.kubernetes_cluster_logging_enabled,

    # Diagnostic logs in Azure Data Lake Store should be enabled
    control.diagnostic_logs_in_azure_data_lake_store_should_be_enabled,

    # Resource logs in Azure Databricks Workspaces should be enabled
    control.resource_logs_in_azure_databricks_workspaces_should_be_enabled,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Auditing on SQL server should be enabled
    control.sql_server_auditing_on,

    # Diagnostic logs in Logic Apps should be enabled
    control.logic_app_workflow_logging_enabled,

    # Diagnostic logs in Key Vault should be enabled
    control.keyvault_logging_enabled,

    # Diagnostic logs in IoT Hub should be enabled
    control.iot_hub_logging_enabled,

    # Redis Cache should allow access only via SSL
    control.redis_cache_should_allow_access_only_via_ssl,

    # Audit resource location matches resource group location
    control.audit_resource_location_matches_resource_group_location,

    # Resource logs in Azure Machine Learning Workspaces should be enabled
    control.resource_logs_in_azure_machine_learning_workspaces_should_be_enabled,

    # Diagnostic logs in Event Hub should be enabled
    control.eventhub_namespace_logging_enabled,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # Resource logs in Azure Key Vault Managed HSM should be enabled
    control.keyvault_managed_hms_logging_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_4_3" {
  title       = "10.4.3 - Exceptions and anomalies identified during the review process are addressed."

  children = [
    # An activity log alert should exist for specific Policy operations
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,

    # Azure subscriptions should have a log profile for Activity Log
    control.log_profile_enabled_for_all_subscription,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,

    # Resource logs in Azure Key Vault Managed HSM should be enabled
    control.keyvault_managed_hms_logging_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_7" {
  title       = "10.7 - Failures of critical security control systems are detected, reported, and responded to promptly."

  children = [
    benchmark.pci_dss_v401_requirement_10_7_1,
    benchmark.pci_dss_v401_requirement_10_7_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_7_1" {
  title       = "10.7.1 - Additional requirement for service providers only: Failures of critical security control systems are detected, alerted, and addressed promptly"

  description = <<-MARKDOWN
    Additional requirement for service providers only: Failures of critical security control systems are detected, alerted, and addressed
    promptly, including but not limited to failure of the following critical security control systems:

    * Network security controls.
    * IDS/IPS.
    * FIM.
    * Anti-malware solutions.
    * Physical access controls.
    * Logical access controls.
    * Audit logging mechanisms.
    * Segmentation controls (if used).
  MARKDOWN

  children = [
    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_10_7_2" {
  title       = "10.7.2 - Failures of critical security control systems are detected, alerted, and addressed promptly."

  description = <<-MARKDOWN
    Failures of critical security control systems are detected, alerted, and addressed promptly,
    including but not limited to failure of the following critical security control systems:

    * Network security controls.
    * IDS/IPS.
    * Change-detection mechanisms.
    * Anti-malware solutions.
    * Physical access controls.
    * Logical access controls.
    * Audit logging mechanisms.
    * Segmentation controls (if used).
    * Audit log review mechanisms.
    * Automated security testing tools (if used).
  MARKDOWN

  children = [
    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,
  ]

  tags = local.pci_dss_v401_common_tags
}
