benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security" {
  title = "Information and Cyber Security"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_3,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_8
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3" {
  title = "Information Security-3"
  children = [
    control.securitycenter_azure_defender_on_for_storage
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1" {
  title = "Identification and Classification of Information Assets-3.1"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_a,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_b,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_c,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_f,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_g,
    benchmark.rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_h
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_a" {
  title = "Identification and Classification of Information Assets-3.1.a"
  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_b" {
  title = "Segregation of Functions-3.1.b"
  children = [
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_client_certificates_on,
    control.appservice_function_app_remote_debugging_disabled,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_c" {
  title = "Role based Access Control-3.1.c"
  children = [
    control.compute_vm_jit_access_protected,
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.log_profile_enabled_for_all_subscription,
    control.securitycenter_email_configured,
    control.securitycenter_security_alerts_to_owner_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_f" {
  title = "Maker-checker-3.1.f"
  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role,
    control.iam_subscription_owner_max_3,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_opensource_relational_db,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_server_azure_defender_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_g" {
  title = "Trails-3.1.g"
  children = [
    control.application_insights_linked_to_log_analytics_workspace,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.iam_subscription_owner_max_3,
    control.log_profile_enabled_for_all_subscription,
    control.logic_app_integration_service_environment_encrypted_with_cmk,
    control.monitor_log_cluster_encrypted_with_cmk,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.monitor_log_profile_enabled_for_all_categories,
    control.monitor_log_profile_enabled_for_all_regions,
    control.monitor_log_profile_retention_365_days,
    control.monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok,
    control.network_sg_flowlog_enabled,
    control.network_watcher_flow_log_enabled,
    control.network_watcher_flow_log_traffic_analytics_enabled,
    control.postgres_db_server_log_checkpoints_on,
    control.postgres_db_server_log_connections_on,
    control.postgres_db_server_log_disconnections_on,
    control.postgres_db_server_log_duration_on,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_opensource_relational_db,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_server_auditing_storage_account_destination_retention_90_days,
    control.sql_server_azure_defender_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_1_h" {
  title = "Public Key Infrastructure (PKI)-3.1.h"
  children = [
    control.app_configuration_encryption_enabled,
    control.app_service_environment_internal_encryption_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.automation_account_variable_encryption_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted,
    control.keyvault_certificate_validity_12_months,
    control.keyvault_firewall_enabled,
    control.keyvault_purge_protection_enabled,
    control.keyvault_secret_expiration_set,
    control.keyvault_soft_delete_enabled,
    control.keyvault_vault_private_link_used,
    control.kusto_cluster_disk_encryption_enabled,
    control.monitor_log_analytics_workspace_integrated_with_encrypted_storage_account,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.mysql_server_encrypted_at_rest_using_cmk,
    control.mysql_server_infrastructure_encryption_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_server_encrypted_at_rest_using_cmk,
    control.postgres_sql_ssl_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.sql_server_transparent_data_encryption_enabled,
    control.storage_account_encryption_at_rest_using_cmk,
    control.storage_account_encryption_scopes_encrypted_at_rest_with_cmk,
    control.storage_account_infrastructure_encryption_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_3" {
  title = "Vulnerability Management-3.3"
  children = [
    control.compute_vm_container_security_configurations_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_system_updates_installed,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_and_databases_va_enabled,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_information_and_cyber_security_3_8" {
  title = "Digital Signatures-3.8"
  children = [
    control.appservice_function_app_client_certificates_on,
    control.appservice_web_app_client_certificates_on,
    control.keyvault_certificate_validity_12_months
  ]
}
