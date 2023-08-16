locals {
  fundamental_security_securitycenter_common_tags = {
    service = "Azure/SecurityCenter"
  }
}

benchmark "fundamental_security_securitycenter" {
  title       = "Security Center"
  description = "This section contains recommendations for configuring SecurityCenter resources."
  children = [
    control.securitycenter_additional_email_configured,
    control.securitycenter_asc_default_setting_not_disabled,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_azure_defender_on_for_appservice,
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_containers,
    control.securitycenter_azure_defender_on_for_cosmosdb,
    control.securitycenter_azure_defender_on_for_database,
    control.securitycenter_azure_defender_on_for_dns,
    control.securitycenter_azure_defender_on_for_k8s,
    control.securitycenter_azure_defender_on_for_keyvault,
    control.securitycenter_azure_defender_on_for_opensource_relational_db,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.securitycenter_email_configured,
    control.securitycenter_mcas_integration,
    control.securitycenter_notify_alerts_configured,
    control.securitycenter_pricing_standard,
    control.securitycenter_security_alerts_to_owner_enabled,
    control.securitycenter_wdatp_integration
  ]
}
