benchmark "fedramp_high_ra" {
  title       = "Risk Assessment (RA)"
  description = "The RA control family relates to an organization's risk assessment policies and vulnerability scanning capabilities. Using an integrated risk management solution like CyberStrong can help streamline and automate your NIST 800 53 compliance efforts."

  children = [
    benchmark.fedramp_high_ra_5,
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_ra_5" {
  title       = "Vulnerability Scanning (RA-5)"
  description = "Scan for system vulnerabilities. Share vulnerability information and security controls that eliminate vulnerabilities."

  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_azure_defender_enabled,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]
}