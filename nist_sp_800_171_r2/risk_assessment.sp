benchmark "nist_sp_800_171_r2_3_11" {
  title       = "3.11 Risk Assessment"
  description = ""
  children = [
    benchmark.nist_sp_800_171_r2_3_11_2,
    benchmark.nist_sp_800_171_r2_3_11_3
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_11_2" {
  title       = "3.11.2 Scan for vulnerabilities in organizational systems and applications periodically and when new vulnerabilities affecting those systems and applications are identified"
  description = ""
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,
    control.compute_vm_container_security_configurations_vulnerabilities_remediated,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.sql_server_and_databases_va_enabled,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_11_3" {
  title       = "3.11.3 Remediate vulnerabilities in accordance with risk assessments"
  description = ""
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.sql_server_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,
    control.compute_vm_container_security_configurations_vulnerabilities_remediated,
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.compute_vm_scale_set_security_configuration_vulnerabilities_remediated,
    control.mssql_managed_instance_vulnerability_assessment_enabled,
    control.sql_server_and_databases_va_enabled,
    control.synapse_workspace_vulnerability_assessment_enabled
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}
