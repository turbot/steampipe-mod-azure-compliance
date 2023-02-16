benchmark "pci_dss_v321_requirement_10" {
  title       = "Requirement 10: Track and monitor all access to network resources and cardholder data"
  description = "Logging mechanisms and the ability to track user activities are critical for effective forensics and vulnerability management. The presence of logs in all environments allows thorough tracking and analysis if something goes wrong. Determining the cause of a compromise is very difficult without system activity logs."
  children = [
    benchmark.pci_dss_v321_requirement_10_5
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_10_5" {
  title = "Secure audit trails so they cannot be altered"
  children = [
    benchmark.pci_dss_v321_requirement_10_5_4
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_10_5_4" {
  title = "Write logs for external-facing technologies onto a secure, centralized, internal log server or media device"
  children = [
    control.audit_diagnostic_setting,
    control.compute_vm_uses_azure_resource_manager,
    control.sql_server_auditing_on,
    control.storage_account_uses_azure_resource_manager
  ]

  tags = local.pci_dss_v321_common_tags
}