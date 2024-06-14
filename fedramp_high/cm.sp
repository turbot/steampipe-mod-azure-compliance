benchmark "fedramp_high_cm" {
  title       = "Configuration Management (CM)"
  description = "The organization: (i) defines and documents configuration settings for information technology products employed within the information system; (ii) implements the configuration settings; (iii) identifies, documents, and approves any deviations from established configuration settings; and (iv) monitors and controls changes to the configuration settings."

  children = [
    benchmark.fedramp_high_cm_6,
    benchmark.fedramp_high_cm_7
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_cm_6" {
  title       = "Configuration Settings (CM-6)"
  description = "The organization: (i) establishes mandatory configuration settings for information technology products employed within the information system; (ii) configures the security settings of information technology products to the most restrictive mode consistent with operational requirements; (iii) documents the configuration settings; and (iv) enforces the configuration settings in all components of the information system."

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

benchmark "fedramp_high_cm_7" {
  title       = "Least Functionality (CM-7)"
  description = "The organization configures the information system to provide only essential capabilities and prohibits or restricts the use of the functions, ports, protocols, and/or services."

  children = [
    control.securitycenter_azure_defender_on_for_server
  ]

}