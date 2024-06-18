benchmark "rbi_itf_nbfc_v2017_is_audit" {
  title = "IS Audit"
  children = [
    benchmark.rbi_itf_nbfc_v2017_is_audit_5
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_is_audit_5" {
  title = "Policy for Information System Audit (IS Audit)-5"
  children = [
    benchmark.rbi_itf_nbfc_v2017_is_audit_5_2,
    control.application_gateway_waf_enabled,
    control.application_gateway_waf_uses_specified_mode,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.cosmosdb_account_with_firewall_rules,
    control.frontdoor_waf_enabled,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_subnet_associated,
    control.network_sg_flowlog_enabled,
    control.network_watcher_flow_log_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_is_audit_5_2" {
  title = "Policy for Information System Audit (IS Audit)-5.2"
  children = [
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]
}
