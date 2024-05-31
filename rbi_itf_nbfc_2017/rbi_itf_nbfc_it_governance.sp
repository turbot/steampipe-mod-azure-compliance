benchmark "rbi_itf_nbfc_v2017_it_governance" {
  title = "IT Governance"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_governance_1,
    benchmark.rbi_itf_nbfc_v2017_it_governance_1_1,
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_it_governance_1" {
  title = "IT Governance-1"
  children = [
    control.compute_vm_container_security_configurations_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_system_updates_installed,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_and_databases_va_enabled
  ]
}

benchmark "rbi_itf_nbfc_v2017_it_governance_1_1" {
  title = "IT Governance-1.1"
  children = [
    control.compute_vm_jit_access_protected,
    control.network_interface_ip_forwarding_disabled,
    control.network_security_group_remote_access_restricted,
    control.network_subnet_protected_by_firewall
  ]
}