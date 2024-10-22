benchmark "nist_sp_800_53_rev_5_ra" {
  title       = "Risk Assessment (RA)"
  description = "The RA control family relates to an organization’s risk assessment policies and vulnerability scanning capabilities. Using an integrated risk management solution like CyberStrong can help streamline and automate your NIST 800 53 compliance efforts."
  children = [
    benchmark.nist_sp_800_53_rev_5_ra_5
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ra_5" {
  title       = "Vulnerability Monitoring and Scanning (RA-5)"
  description = "Scan for system vulnerabilities. Share vulnerability information and security controls that eliminate vulnerabilities."
  children = [
    control.compute_vm_container_security_configurations_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,
    control.container_registry_vulnerabilities_remediated,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_dns,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_azure_defender_enabled,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
