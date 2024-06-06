benchmark "rbi_itf_nbfc_v2016_secure_configuration" {
  title = "Secure Configuration"
  children = [
    benchmark.rbi_itf_nbfc_v2016_secure_configuration_5
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_secure_configuration_5" {
  title = "Secure Configuration-5"
  children = [
    benchmark.rbi_itf_nbfc_v2016_secure_configuration_5_1
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_secure_configuration_5_1" {
  title = "Secure Configuration-5.1"

  children = [
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.securitycenter_azure_defender_on_for_cosmosdb,
    control.securitycenter_azure_defender_on_for_resource_manager,
    control.securitycenter_azure_defender_on_for_server,
    control.securitycenter_azure_defender_on_for_sqldb,
    control.securitycenter_azure_defender_on_for_sqlservervm,
    control.securitycenter_azure_defender_on_for_storage,
    control.sql_server_azure_defender_enabled
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}