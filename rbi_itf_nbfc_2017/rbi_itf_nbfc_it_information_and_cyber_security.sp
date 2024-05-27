benchmark "rbi_itf_nbfc_it_information_and_cyber_security" {
  title       = "Information and Cyber Security"
  children = [
    // benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1,
  ]

  tags = local.rbi_itf_nbfc_common_tags
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3" {
  title       = "Information Security-3"
  children = [
    control.securitycenter_azure_defender_on_for_storage
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1" {
  title       = "Identification and Classification of Information Assets-3.1"
  children = [
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1_a,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1_b,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1_c,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1_f,
    benchmark.rbi_itf_nbfc_it_information_and_cyber_security_3_1_g
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1_a" {
  title       = "Identification and Classification of Information Assets-3.1.a"
  children = [
    control.iam_no_custom_role,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1_b" {
  title       = "Segregation of Functions-3.1.b"
  children = [
    control.appservice_function_app_client_certificates_on,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1_c" {
  title       = "Role based Access Control-3.1.c"
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.compute_vm_jit_access_protected,
    control.securitycenter_email_configured,
    control.iam_subscription_owner_more_than_1
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1_f" {
  title       = "Maker-checker-3.1.f"
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.iam_no_custom_role,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_email_configured
  ]
}

benchmark "rbi_itf_nbfc_it_information_and_cyber_security_3_1_g" {
  title       = "Trails-3.1.g"
  children = [
    control.iam_subscription_owner_max_3,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.monitor_log_profile_enabled_for_all_categories,
    control.monitor_log_cluster_infrastructure_encryption_enabled,
    control.monitor_log_cluster_encrypted_with_cmk,
    control.monitor_log_profile_enabled_for_all_regions,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.logic_app_integration_service_environment_encrypted_with_cmk,
    control.sql_server_auditing_storage_account_destination_retention_90_days
  ]
}
