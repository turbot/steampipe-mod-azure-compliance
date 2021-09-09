benchmark "nist_sp_800_53_rev_5_ra" {
  title       = "Risk Assessment (RA)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_ra_5
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_ra_5" {
  title       = "Vulnerability Monitoring and Scanning (RA-5)"
  description = "to  do"
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
