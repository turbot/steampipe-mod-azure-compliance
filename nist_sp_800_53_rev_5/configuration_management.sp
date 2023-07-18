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
    control.compute_vm_meet_security_baseline_requirements_linux,
    control.compute_vm_meet_security_baseline_requirements_windows,
    control.kubernetes_cluster_add_on_azure_policy_enabled,
    control.kubernetes_cluster_container_cpu_and_memory_resource_limit,
    control.kubernetes_cluster_container_host_process_id_not_shared,
    control.kubernetes_cluster_container_privilege_escalation_restricted,
    control.kubernetes_cluster_container_use_allowed_apparmor_profile,
    control.kubernetes_cluster_container_use_allowed_capabilities,
    control.kubernetes_cluster_container_use_allowed_images,
    control.kubernetes_cluster_container_with_read_only_root_file_system,
    control.kubernetes_cluster_pod_host_path_volume_use_allowed_host_path,
    control.kubernetes_cluster_pod_use_approved_host_network_and_port_range,
    control.kubernetes_cluster_pods_and_containers_uses_approved_user_and_group_id,
    control.kubernetes_cluster_privilege_containers_restricted,
    control.kubernetes_cluster_service_listen_to_allowed_ports
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_cm_7" {
  title       = "Least Functionality (CM-7)"
  description = "The organization configures the information system to provide only essential capabilities and prohibits or restricts the use of organization-defined prohibited or restricted functions, ports, protocols, and/or services."
  children = [
    benchmark.nist_sp_800_53_rev_5_cm_7_2,
    benchmark.nist_sp_800_53_rev_5_cm_7_5,
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated,
    control.compute_vm_azure_defender_enabled
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_cm_7_2" {
  title       = "Prevent Program Execution CM-7(2) "
  description = "The information system prevents program execution in accordance with organization-defined policies regarding software program usage and restrictions, rules authorizing the terms and conditions of software program usage."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_cm_7_5" {
  title       = "Authorized Software ??? Allow-by-exception CM-7(5)"
  description = "The organization identifies organization-defined software programs authorized to execute on the information system, employs a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the information system, and reviews and updates the list of authorized software programs."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_cm_10" {
  title       = "Software Usage Restrictions (CM-10)"
  description = "The organization uses software and associated documentation in accordance with contract agreements and copyright laws, tracks the use of software and associated documentation protected by quantity licenses to control copying and distribution, and controls and documents the use of peer-to-peer file-sharing technology to ensure that this capability is not used for the unauthorized distribution, display, performance, or reproduction of copyrighted work."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "nist_sp_800_53_rev_5_cm_11" {
  title       = "User-installed Software (CM-11)"
  description = "The organization establishes organization-defined policies governing the installation of software by users, enforces software installation policies through organization-defined methods, and monitors policy compliance at organization-defined frequency."
  children = [
    control.compute_vm_adaptive_application_controls_enabled,
    control.compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}
