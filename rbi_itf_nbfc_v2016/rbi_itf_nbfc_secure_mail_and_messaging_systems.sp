benchmark "rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems" {
  title = "Secure Mail And Messaging Systems-10"
  children = [
    benchmark.rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10" {
  title = "Secure Mail And Messaging Systems-10.1"
  children = [
    benchmark.rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10_1,
    benchmark.rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10_2,
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10_1" {
  title = "Secure Mail And Messaging Systems-10.1"

  children = [
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_secure_mail_and_messaging_systems_10_2" {
  title = "Secure Mail And Messaging Systems-10.2"

  children = [
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_use_https,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}