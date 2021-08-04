benchmark "hipaa_hitrust_v92_network_connection_control" {
  title         = "Network Connection Control"
  children = [
    benchmark.hipaa_hitrust_v92_0809_01n2organizational_1234_01_n,
    benchmark.hipaa_hitrust_v92_0810_01n2organizational_5_01_n,
    benchmark.hipaa_hitrust_v92_0811_01n2organizational_6_01_n,
    benchmark.hipaa_hitrust_v92_0812_01n2organizational_8_01_n,
    benchmark.hipaa_hitrust_v92_0814_01n1organizational_12_01_n
  ]

  tags  = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0809_01n2organizational_1234_01_n" {
  title         = "0809.01n2Organizational.1234 - 01.n"
  description   = "Network traffic is controlled in accordance with the organizations access control policy through firewall and other network-related restrictions for each network access point or external telecommunication service's managed interface."
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.compute_vm_remote_access_restricted,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0810_01n2organizational_5_01_n" {
  title         = "0810.01n2Organizational.5 - 01.n"
  description   = "Transmitted information is secured and, at a minimum, encrypted over open, public networks"
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.compute_vm_remote_access_restricted,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0811_01n2organizational_6_01_n" {
  title         = "0811.01n2Organizational.6 - 01.n"
  description   = "Exceptions to the traffic flow policy are documented with a supporting mission/business need, duration of the exception, and reviewed at least annually; traffic flow policy exceptions are removed when no longer supported by an explicit mission/business need."
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.compute_vm_remote_access_restricted,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0812_01n2organizational_8_01_n" {
  title         = "0812.01n2Organizational.8 - 01.n"
  description   = "Remote devices establishing a non-remote connection are not allowed to communicate with external (remote) resources."
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.compute_vm_remote_access_restricted,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0814_01n1organizational_12_01_n" {
  title         = "0814.01n1Organizational.12 - 01.n"
  description   = "The ability of users to connect to the internal network is restricted using a deny-by-default and allow-by-exception policy at managed interfaces according to the access control policy and the requirements of clinical and business applications."
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_use_https,
    control.compute_vm_remote_access_restricted,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.mysql_ssl_enabled,
    control.network_security_group_subnet_associated,
    control.postgres_sql_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
