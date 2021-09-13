benchmark "nist_sp_800_53_rev_5_sc" {
  title       = "System and Communications Protection (SC)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_3,
    benchmark.nist_sp_800_53_rev_5_sc_5,
    benchmark.nist_sp_800_53_rev_5_sc_7,
    benchmark.nist_sp_800_53_rev_5_sc_8,
    benchmark.nist_sp_800_53_rev_5_sc_12,
    benchmark.nist_sp_800_53_rev_5_sc_28,
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_sc_3" {
  title       = "Security Function Isolation (SC-3)"
  description = "to  do"
  children = [
    control.compute_vm_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_5" {
  title       = "Denial-of-service Protection (SC-5)"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_7" {
  title       = "Boundary Protection (SC-7)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_7_3,
    control.azure_redis_cache_uses_private_link,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_7_3" {
  title       = "SC-7(3) Access Points"
  description = "to  do"
  children = [
    control.azure_redis_cache_uses_private_link,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.postgresql_server_public_network_access_disabled,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_8" {
  title       = "Transmission Confidentiality and Integrity (SC-8)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_8_1,
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.azure_redis_cache_ssl_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_8_1" {
  title       = "SC-8(1) Cryptographic Protection"
  description = "to  do"
  children = [
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.azure_redis_cache_ssl_enabled,
    control.mysql_ssl_enabled,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_12" {
  title       = "Cryptographic Key Establishment and Management (SC-12)"
  description = "to  do"
  children = [
    control.container_registry_encrypted_with_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_28" {
  title       = "Protection of Information at Rest (SC-28)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_sc_28_1,
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_28_1" {
  title       = "SC-28(1) Cryptographic Protection"
  description = "to  do"
  children = [
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
