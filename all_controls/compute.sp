locals {
  all_controls_compute_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "all_controls_compute" {
  title       = "Compute"
  description = "This section contains recommendations for configuring Compute resources."
  children = [
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.compute_disk_access_uses_private_link,
    control.compute_disk_unattached_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk,
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,
    control.compute_unattached_disk_encrypted_with_cmk,
    control.compute_vm_account_with_password_linux,
    control.compute_vm_and_sacle_set_encryption_at_host_enabled,
    control.compute_vm_attached_with_network,
    control.compute_vm_data_and_os_disk_uses_managed_disk,
    control.compute_vm_disaster_recovery_enabled,
    control.compute_vm_guest_configuration_installed,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_jit_access_protected,
    control.compute_vm_log_analytics_agent_installed,
    control.compute_vm_log_analytics_agent_installed_windows,
    control.compute_vm_malware_agent_automatic_upgrade_enabled,
    control.compute_vm_malware_agent_installed,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_meet_security_baseline_requirements_linux,
    control.compute_vm_meet_security_baseline_requirements_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_password_complexity_setting_enabled_windows,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_remote_access_restricted_all_ports,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.compute_vm_scale_set_automatic_upgrade_enabled,
    control.compute_vm_scale_set_boot_diagnostics_enabled,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.compute_vm_scale_set_logging_enabled,
    control.compute_vm_scale_set_uses_managed_disks,
    control.compute_vm_scale_set_ssh_key_authentication_linux,
    control.compute_vm_secure_communication_protocols_configured,
    control.compute_vm_ssh_key_authentication_linux,
    control.compute_vm_system_updates_installed,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.compute_vm_uses_azure_resource_manager,
    control.compute_vm_utilizing_managed_disk,
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_windows_defender_exploit_guard_enabled,
    control.network_interface_ip_forwarding_disabled
  ]

  tags = merge(local.all_controls_compute_common_tags, {
    type = "Benchmark"
  })
}
