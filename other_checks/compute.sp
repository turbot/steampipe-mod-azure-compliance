locals {
  other_compute_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "other_compute" {
  title = "Compute"
  children = [
    control.compute_vm_data_and_os_disk_uses_managed_disk,
    control.compute_vm_log_analytics_agent_health_issues_resolved,
    control.compute_vm_scale_set_automatic_upgrade_enabled,
    control.compute_vm_scale_set_logging_enabled,
    control.compute_vm_scale_set_ssh_key_authentication_linux
  ]

  tags = merge(local.other_compute_common_tags, {
    type = "Benchmark"
  })
}
