benchmark "nist_sp_800_53_rev_5_sc" {
  title       = "System and Communications Protection (SC)"
  description = "The SC control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
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
  description = "The information system isolates security functions from nonsecurity functions."
  children = [
    control.compute_vm_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_5" {
  title       = "Denial-of-service Protection (SC-5)"
  description = "The information system protects against or limits the effects of the organization-defined types of denial of service attacks or reference to a source for such information by employing organization-defined security safeguards."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_7" {
  title       = "Boundary Protection (SC-7)"
  description = "The information system monitors and controls communications at the external boundary of the system and at key internal boundaries within the system; implements subnetworks for publicly accessible system components that are physically or logically separated from internal organizational networks; and connects to external networks or information systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture."
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
  description = "The organization limits the number of external network connections to the information system."
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
  description = "The information system protects the confidentiality and integrity of transmitted information."
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
  description = "The information system implements cryptographic mechanisms to prevent unauthorized disclosure of information and detect changes to information during transmission unless otherwise protected by organization-defined alternative physical safeguards."
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
  description = "The organization establishes and manages cryptographic keys for required cryptography employed within the information system in accordance with organization-defined requirements for key generation, distribution, storage, access, and destruction."
  children = [
    control.container_registry_encrypted_with_cmk,
    control.cosmosdb_account_encryption_at_rest_using_cmk
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_sc_28" {
  title       = "Protection of Information at Rest (SC-28)"
  description = "The information system protects the confidentiality and integrity of organization-defined information at rest."
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
  description = "The information system implements cryptographic mechanisms to prevent unauthorized disclosure and modification of organization-defined information on organization-defined information system components."
  children = [
    control.mysql_server_infrastructure_encryption_enabled,
    control.postgresql_server_infrastructure_encryption_enabled,
    control.storage_account_infrastructure_encryption_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
