benchmark "nist_sp_800_53_rev_5_ir" {
  title       = "Incident Response (IR)"
  description = "IR controls are specific to an organization’s incident response policies and procedures. This includes incident response training, testing, monitoring, reporting, and response plan."
  children = [
    benchmark.nist_sp_800_53_rev_5_ir_4,
    benchmark.nist_sp_800_53_rev_5_ir_5,
    benchmark.nist_sp_800_53_rev_5_ir_6_2
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ir_4" {
  title       = "Incident Handling (IR-4)"
  description = "The organization implements an incident handling capability for security incidents that includes preparation, detection and analysis, containment, eradication, and recovery; coordinates incident handling activities with contingency planning activities; and incorporates lessons learned from ongoing incident handling activities into incident response procedures, training, and testing/exercises, and implements the resulting changes accordingly."
  children = [
    control.appservice_azure_defender_enabled,
    control.compute_vm_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.resource_manager_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ir_5" {
  title       = "Incident Monitoring (IR-5)"
  description = "The organization tracks and documents information system security incidents."
  children = [
    control.appservice_azure_defender_enabled,
    control.compute_vm_azure_defender_enabled,
    control.dns_azure_defender_enabled,
    control.keyvault_azure_defender_enabled,
    control.resource_manager_azure_defender_enabled,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_database_server_azure_defender_enabled,
    control.sql_server_azure_defender_enabled,
    control.sql_server_vm_azure_defender_enabled,
    control.storage_azure_defender_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ir_6_2" {
  title       = "Vulnerabilities Related to Incidents IR-6(2) "
  description = "The organization reports information system vulnerabilities associated with reported security incidents to organization-defined personnel or roles."
  children = [
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/SecurityCenter"
  })
}
