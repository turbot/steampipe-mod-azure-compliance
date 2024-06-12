benchmark "fedramp_high_configuration_management" {
  title       = "Configuration Management"
  description = "The organization: (i) defines and documents configuration settings for information technology products employed within the information system; (ii) implements the configuration settings; (iii) identifies, documents, and approves any deviations from established configuration settings; and (iv) monitors and controls changes to the configuration settings."

  children = [
    benchmark.fedramp_high_configuration_management_6,
    benchmark.fedramp_high_configuration_management_7
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_configuration_management_6" {
  title = "Configuration Settings-6"

  children = [
    control.appservice_api_app_client_certificates_on,
    control.appservice_api_app_cors_no_star,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_client_certificates_on,
    control.appservice_function_app_cors_no_star,
    control.appservice_function_app_remote_debugging_disabled,
    control.compute_vm_meet_security_baseline_requirements_linux,
    control.compute_vm_meet_security_baseline_requirements_windows,
    control.kubernetes_cluster_add_on_azure_policy_enabled
  ]

}

benchmark "fedramp_high_configuration_management_7" {
  title = "Least Functionality-7"

  children = [
    control.securitycenter_azure_defender_on_for_server
  ]

}