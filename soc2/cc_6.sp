locals {
  soc_2_cc_6_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc6"
  })
}

benchmark "soc_2_cc_6" {
  title       = "CC6.0 - Logical and Physical Access"
  description = "The criteria relevant to how an entity (i) restricts logical and physical access, (ii) provides and removes that access, and (iii) prevents unauthorized access."

  children = [
    benchmark.soc_2_cc_6_1,
    benchmark.soc_2_cc_6_2,
    benchmark.soc_2_cc_6_3,
    benchmark.soc_2_cc_6_6,
    benchmark.soc_2_cc_6_8,
    control.ad_guest_user_reviewed_monthly,
    control.appservice_authentication_enabled,
    control.appservice_web_app_incoming_client_cert_on,
    control.appservice_web_app_register_with_active_directory_enabled,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.compute_unattached_disk_encrypted_with_cmk,
    control.iam_no_custom_subscription_owner_roles_created,
    control.keyvault_vault_recoverable,
    control.monitor_logs_storage_container_encryptes_with_byok,
    control.monitor_logs_storage_container_not_public_accessible,
    control.network_security_group_rdp_access_restricted,
    control.network_security_group_ssh_access_restricted,
    control.network_security_group_udp_service_restricted,
    control.network_watcher_enabled,
    control.securitycenter_asc_default_setting_not_disabled,
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_k8s,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_mcas_integration,
    control.securitycenter_wdatp_integration,
    control.sql_database_allow_internet_access,
    control.sql_db_active_directory_admin_configured,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_atp_enabled,
    control.sql_server_tde_protector_cmk_encrypted,
    control.sql_server_transparent_data_encryption_enabled,
    control.sql_server_va_setting_periodic_scan_enabled,
    control.sql_server_va_setting_reports_notify_admins,
    control.sql_server_va_setting_scan_reports_configured,
    control.storage_account_blob_containers_public_access_private,
    control.storage_account_encryption_at_rest_using_cmk,
    control.storage_account_trusted_microsoft_services_enabled
  ]

  tags = local.soc_2_cc_6_common_tags
}

benchmark "soc_2_cc_6_1" {
  title         = "CC6.1 The entity implements logical access security software, infrastructure, and architectures over protected information assets to protect them from security events to meet the entity's objectives"
  documentation = file("./soc2/docs/cc_6_1.md")

  children = [
    control.ad_manual_control,
    control.appservice_authentication_enabled,
    control.appservice_web_app_incoming_client_cert_on,
    control.appservice_web_app_register_with_active_directory_enabled,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.compute_unattached_disk_encrypted_with_cmk,
    control.iam_no_custom_subscription_owner_roles_created,
    control.monitor_logs_storage_container_encryptes_with_byok,
    control.monitor_logs_storage_container_not_public_accessible,
    control.network_security_group_udp_service_restricted,
    control.securitycenter_asc_default_setting_not_disabled,
    control.storage_account_blob_containers_public_access_private,
    control.storage_account_encryption_at_rest_using_cmk,
    control.sql_database_allow_internet_access,
    control.sql_db_active_directory_admin_configured,
    control.sql_server_tde_protector_cmk_encrypted,
    control.sql_server_transparent_data_encryption_enabled
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.1"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_2" {
  title         = "CC6.2 Prior to issuing system credentials and granting system access, the entity registers and authorizes new internal and external users whose access is administered by the entity"
  documentation = file("./soc2/docs/cc_6_2.md")

  children = [
    control.ad_guest_user_reviewed_monthly
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.2"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_3" {
  title         = "CC6.3 The entity authorizes, modifies, or removes access to data, software, functions, and other protected information assets based on roles, responsibilities, or the system design and changes, giving consideration to the concepts of least privilege and segregation of duties, to meet the entity’s objectives"
  documentation = file("./soc2/docs/cc_6_3.md")

  children = [
    control.ad_guest_user_reviewed_monthly,
    control.iam_no_custom_subscription_owner_roles_created,
    control.keyvault_vault_recoverable
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.3"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_6" {
  title         = "CC6.6 The entity implements logical access security measures to protect against threats from sources outside its system boundaries"
  documentation = file("./soc2/docs/cc_6_6.md")

  children = [
    control.network_security_group_rdp_access_restricted,
    control.network_security_group_ssh_access_restricted,
    control.network_security_group_udp_service_restricted,
    control.network_watcher_enabled,
    control.storage_account_trusted_microsoft_services_enabled,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_atp_enabled,
    control.sql_server_va_setting_periodic_scan_enabled,
    control.sql_server_va_setting_reports_notify_admins,
    control.sql_server_va_setting_scan_reports_configured
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.6"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_8" {
  title         = "CC6.8 The entity implements controls to prevent or detect and act upon the introduction of unauthorized or malicious software to meet the entity’s objectives"
  documentation = file("./soc2/docs/cc_6_8.md")

  children = [
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_k8s,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_mcas_integration,
    control.securitycenter_wdatp_integration
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.8"
    soc_2_type    = "automated"
  })
}
