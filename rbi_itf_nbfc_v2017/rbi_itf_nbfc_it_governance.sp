benchmark "rbi_itf_nbfc_v2017_it_governance" {
  title = "IT Governance"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_governance_1
  ]

  tags = local.rbi_itf_nbfc_v2017_common_tags
}

benchmark "rbi_itf_nbfc_v2017_it_governance_1" {
  title = "IT Governance-1"
  children = [
    benchmark.rbi_itf_nbfc_v2017_it_governance_1_1,
    control.compute_vm_system_updates_installed,
    control.compute_vm_vulnerability_assessment_solution_enabled,
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
    control.network_security_group_remote_access_restricted
  ]
}