benchmark "fedramp_high_incident_response" {
  title       = "Incident Response"
  description = "The organization has an incident response capability that includes preparation, detection, analysis, containment, eradication, recovery, and user response activities. The organization employs automated mechanisms to support the incident response process."

  children = [
    benchmark.fedramp_high_incident_response_4,
    benchmark.fedramp_high_incident_response_5,
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_incident_response_4" {
  title      = "Incident Handling-4"

  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_server_azure_defender_enabled
  ]
}

benchmark "fedramp_high_incident_response_5" {
  title      = "Incident Monitoring-5"

  children = [
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_email_configured,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.sql_server_azure_defender_enabled
  ]
}