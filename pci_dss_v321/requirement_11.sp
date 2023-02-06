benchmark "pci_dss_v321_requirement_11" {
  title       = "Requirement 11: Regularly test security systems and processes"
  description = "Vulnerabilities are being discovered continually by malicious individuals and researchers, and being introduced by new software. System components, processes, and custom software should be tested frequently to ensure security is maintained over time. Testing of security controls is especially important for any environmental changes such as deploying new software or changing system configurations."
  children = [
    benchmark.pci_dss_v321_requirement_11_2
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_11_2" {
  title = "Perform quarterly internal vulnerability scans and rescans as needed, until all “high-risk” vulnerabilities (as identified in Requirement 6.1) are resolved. Scans must be performed by qualified personnel"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    control.compute_vm_endpoint_protection_agent_installed,
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_system_updates_installed,
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}