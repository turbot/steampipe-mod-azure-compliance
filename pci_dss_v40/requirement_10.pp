benchmark "pci_dss_v40_requirement_10" {
  title       = "Requirement 10 - Log and Monitor All Access to System Components and Cardholder Data"

  description = <<-MARKDOWN
    Logging mechanisms and the ability to track user activities are critical in preventing, detecting, or minimizing the impact of a data compromise.
    The presence of logs on all system components and in the cardholder data environment (CDE) allows thorough tracking, alerting, and analysis
    when something does go wrong. Determining the cause of a compromise is difficult, if not impossible, without system activity logs.

    This requirement applies to user activities, including those by employees, contractors, consultants, and internal and external vendors, and other
    third parties (for example, those providing support or maintenance services).

    These requirements do not apply to user activity of consumers (cardholders).

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_10_2,
    benchmark.pci_dss_v40_requirement_10_3,
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_10_2" {
  title       = "10.2 - Audit logs are implemented to support the detection of anomalies and suspicious activity, and the forensic analysis of events"
  children = [
    benchmark.pci_dss_v40_requirement_10_2_2
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_10_2_2" {
  title       = "10.2.2 - Audit logs record details for each auditable event"
  description = <<-MARKDOWN
    Audit logs record the following details for each auditable event:

    * User identification.
    * Type of event.
    * Date and time.
    * Success and failure indication.
    * Origination of event.
    * Identity or name of affected data, system component, resource, or service (for example, name and protocol).
  MARKDOWN
  children = [
    control.audit_diagnostic_setting,
    control.sql_server_auditing_on,
    control.compute_vm_uses_azure_resource_manager,
    control.storage_account_uses_azure_resource_manager
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_10_3" {
  title       = "10.3 - Audit logs are protected from destruction and unauthorized modifications"
  children = [
    benchmark.pci_dss_v40_requirement_10_3_3
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_10_3_3" {
  title       = "10.3.3 - Audit log files, including those for externalfacing technologies, are promptly backed up to a secure, central, internal log server(s) or other media that is difficult to modify."

  description = <<-MARKDOWN
    Audit log files, including those for externalfacing technologies, are promptly backed up to a secure, central,
    internal log server(s) or other media that is difficult to modify.
  MARKDOWN

  children = [
    control.audit_diagnostic_setting,
    control.sql_server_auditing_on,
    control.compute_vm_uses_azure_resource_manager,
    control.storage_account_uses_azure_resource_manager
  ]

  tags = local.pci_dss_v40_common_tags
}
