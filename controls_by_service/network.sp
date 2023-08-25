locals {
  controls_by_service_network_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "controls_by_service_network" {
  title       = "Network"
  description = "This section contains recommendations for configuring Network resources."
  children = [
    control.application_gateway_waf_enabled,
    control.network_bastion_host_min_1,
    control.network_ddos_enabled,
    control.network_lb_no_basic_sku,
    control.network_public_ip_no_basic_sku,
    control.network_security_group_diagnostic_setting_deployed,
    control.network_security_group_https_access_restricted,
    control.network_security_group_not_configured_gateway_subnets,
    control.network_security_group_rdp_access_restricted,
    control.network_security_group_remote_access_restricted,
    control.network_security_group_ssh_access_restricted,
    control.network_security_group_subnet_associated,
    control.network_security_group_udp_service_restricted,
    control.network_sg_flowlog_retention_period_greater_than_90,
    control.network_virtual_network_gateway_no_basic_sku,
    control.network_watcher_enabled,
    control.network_watcher_in_regions_with_virtual_network
  ]

  tags = merge(local.controls_by_service_network_common_tags, {
    type = "Benchmark"
  })
}
