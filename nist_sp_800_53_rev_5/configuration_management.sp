benchmark "nist_sp_800_53_rev_5_cm" {
  title       = "Configuration Management (CM)"
  description = "CM controls are specific to an organization’s configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis control."
  children = [
    benchmark.nist_sp_800_53_rev_5_cm_6,
    benchmark.nist_sp_800_53_rev_5_cm_7,
    benchmark.nist_sp_800_53_rev_5_cm_10,
    benchmark.nist_sp_800_53_rev_5_cm_11
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_cm_6" {
  title       = "Configuration Settings (CM-6)"
  description = "The organization establishes and documents configuration settings for information technology products employed within the information system using organization-defined security configuration checklists that reflect the most restrictive mode consistent with operational requirements; implements the configuration settings; identifies, documents, and approves any deviations from established configuration settings for organization-defined information system components based on organization-defined operational requirements; and monitors and controls changes to the configuration settings in accordance with organizational policies and procedures."
  children = [
    control.appservice_api_app_client_certificates_on,
    control.appservice_api_app_cors_no_star,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_function_app_client_certificates_on,
    control.appservice_function_app_cors_no_star,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_web_app_client_certificates_on,
    control.appservice_web_app_cors_no_star,
    control.appservice_web_app_remote_debugging_disabled,
    control.kubernetes_cluster_add_on_azure_policy_enabled,
    control.kubernetes_cluster_pods_and_containers_uses_approved_user_and_group_id,
    control.compute_vm_meet_security_baseline_requirements_linux,
    control.compute_vm_meet_security_baseline_requirements_windows
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7" {
  title       = "Least Functionality (CM-7)"
  description = "The organization configures the information system to provide only essential capabilities and prohibits or restricts the use of organization-defined prohibited or restricted functions, ports, protocols, and/or services."
  children = [
    benchmark.nist_sp_800_53_rev_5_cm_7_2,
    benchmark.nist_sp_800_53_rev_5_cm_7_5,
    control.compute_vm_azure_defender_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7_2" {
  title       = "CM-7(2) Prevent Program Execution"
  description = "The information system prevents program execution in accordance with organization-defined policies regarding software program usage and restrictions, rules authorizing the terms and conditions of software program usage."
  children = [
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7_5" {
  title       = "CM-7(5) Authorized Software ??? Allow-by-exception"
  description = "The organization identifies organization-defined software programs authorized to execute on the information system, employs a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the information system, and reviews and updates the list of authorized software programs."
  children = [
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_10" {
  title       = "Software Usage Restrictions (CM-10)"
  description = "The organization uses software and associated documentation in accordance with contract agreements and copyright laws, tracks the use of software and associated documentation protected by quantity licenses to control copying and distribution, and controls and documents the use of peer-to-peer file-sharing technology to ensure that this capability is not used for the unauthorized distribution, display, performance, or reproduction of copyrighted work."
  children = [
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_11" {
  title       = "User-installed Software (CM-11)"
  description = "The organization establishes organization-defined policies governing the installation of software by users, enforces software installation policies through organization-defined methods, and monitors policy compliance at organization-defined frequency."
  children = [
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
