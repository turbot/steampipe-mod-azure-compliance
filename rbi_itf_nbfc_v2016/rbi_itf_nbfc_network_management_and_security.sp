benchmark "rbi_itf_nbfc_v2016_network_management_and_security" {
  title = "Network Management And Security"
  children = [
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security_4
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4" {
  title = "Network Management And Security-4"
  children = [
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security_4_2,
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security_4_3,
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security_4_7,
    benchmark.rbi_itf_nbfc_v2016_network_management_and_security_4_9,
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4_2" {
  title = "Network Inventory-4.2"

  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.network_watcher_flow_log_traffic_analytics_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4_3" {
  title = "Network Device Configuration Management-4.3"

  children = [
    control.application_gateway_waf_enabled,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_web_app_client_certificates_on,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.frontdoor_waf_enabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_watcher_flow_log_traffic_analytics_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4_7" {
  title = "Network Device Configuration Management-4.7"

  children = [
    control.application_gateway_waf_enabled,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.frontdoor_waf_enabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_subnet_associated,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4_9" {
  title = "Security Operation Centre-4.9"

  children = [
    control.network_watcher_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
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

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_network_management_and_security_4_10" {
  title = "Perimeter Protection And Detection-4.10"

  children = [
    control.application_gateway_waf_enabled,
    control.compute_vm_jit_access_protected,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.frontdoor_waf_enabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_subnet_associated,
    control.securitycenter_azure_defender_on_for_server
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}