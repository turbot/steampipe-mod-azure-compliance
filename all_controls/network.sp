locals {
  all_controls_network_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "all_controls_network" {
  title       = "Network"
  description = "This section contains recommendations for configuring Network resources."
  children = [
    control.application_gateway_waf_enabled,
    control.network_bastion_host_min_1,
    control.network_ddos_enabled,
    control.network_lb_no_basic_sku,
    control.network_network_peering_connected,
    control.network_public_ip_no_basic_sku,
    control.network_security_group_diagnostic_setting_deployed,
    control.network_security_group_https_access_restricted,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_outbound_access_restricted,
    control.network_security_group_rdp_access_restricted,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_restrict_inbound_icmp_port,
    control.network_security_group_restrict_inbound_tcp_port_135,
    control.network_security_group_restrict_inbound_tcp_port_1433,
    control.network_security_group_restrict_inbound_tcp_port_20,
    control.network_security_group_restrict_inbound_tcp_port_21,
    control.network_security_group_restrict_inbound_tcp_port_23,
    control.network_security_group_restrict_inbound_tcp_port_25,
    control.network_security_group_restrict_inbound_tcp_port_3306,
    control.network_security_group_restrict_inbound_tcp_port_4333,
    control.network_security_group_restrict_inbound_tcp_port_445,
    control.network_security_group_restrict_inbound_tcp_port_53,
    control.network_security_group_restrict_inbound_tcp_port_5432,
    control.network_security_group_restrict_inbound_tcp_port_5500,
    control.network_security_group_restrict_inbound_tcp_port_5900,
    control.network_security_group_restrict_inbound_udp_port_137,
    control.network_security_group_restrict_inbound_udp_port_138,
    control.network_security_group_restrict_inbound_udp_port_1434,
    control.network_security_group_restrict_inbound_udp_port_445,
    control.network_security_group_restrict_inbound_udp_port_53,
    control.network_security_group_ssh_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_security_group_udp_service_restricted,
    control.network_sg_flowlog_enabled,
    control.network_sg_flowlog_retention_period_greater_than_90,
    control.network_virtual_network_gateway_no_basic_sku,
    control.network_watcher_enabled,
    control.network_watcher_flow_log_enabled,
    control.network_watcher_flow_log_traffic_analytics_enabled,
    control.network_watcher_in_regions_with_virtual_network
  ]

  tags = merge(local.all_controls_network_common_tags, {
    type = "Benchmark"
  })
}
