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
    control.appservice_azure_defender_enabled,
    control.compute_vm_azure_defender_enabled,
    control.container_registry_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.kubernetes_azure_defender_enabled,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.resource_manager_azure_defender_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_database_vulnerability_findings_resolved,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
