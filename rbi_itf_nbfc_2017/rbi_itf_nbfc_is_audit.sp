benchmark "rbi_itf_nbfc_is_audit" {
  title       = "IS Audit"
  children = [
    benchmark.rbi_itf_nbfc_is_audit_5,
    benchmark.rbi_itf_nbfc_is_audit_5_2
  ]

  tags = local.rbi_itf_nbfc_common_tags
}

benchmark "rbi_itf_nbfc_is_audit_5" {
  title       = "Policy for Information System Audit (IS Audit)-5"
  children = [
    control.network_subnet_protected_by_firewall,
    control.network_watcher_flow_log_enabled,
    control.compute_vm_remote_access_restricted_all_ports,
    control.cosmosdb_account_with_firewall_rules,
    control.frontdoor_waf_enabled,
    control.network_sg_flowlog_enabled,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.network_interface_ip_forwarding_disabled,
    control.compute_vm_non_internet_facing_protected_with_nsg,
    control.network_security_group_subnet_associated,
    control.application_gateway_waf_enabled
  ]
}

benchmark "rbi_itf_nbfc_is_audit_5_2" {
  title       = "Policy for Information System Audit (IS Audit)-5.2"
  children = [
    control.compute_vm_azure_backup_enabled,
    control.mariadb_server_geo_redundant_backup_enabled,
    control.mysql_db_server_geo_redundant_backup_enabled,
    control.postgres_db_server_geo_redundant_backup_enabled
  ]
}
