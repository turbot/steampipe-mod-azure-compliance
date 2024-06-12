benchmark "fedramp_high_risk_assessment" {
  title       = "Risk Assessment"
  description = "The organization conducts an assessment of the risk and magnitude of harm that could result from the unauthorized access, use, disclosure, disruption, modification, or destruction of information and information systems that support the operations and assets of the organization."

  children = [
    benchmark.fedramp_high_risk_assessment_5,
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_risk_assessment_5" {
  title      = "Vulnerability Scanning-5"

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