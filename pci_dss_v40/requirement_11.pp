benchmark "pci_dss_v40_requirement_11" {
  title       = "Requirement 11 - Test Security of Systems and Networks Regularly"

  description = <<-MARKDOWN
    Vulnerabilities are being discovered continually by malicious individuals and researchers, and being introduced by new software. System
    components, processes, and bespoke and custom software should be tested frequently to ensure security controls continue to reflect a
    changing environment.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_11_3
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_11_3" {
  title       = "11.3 - External and internal vulnerabilities are regularly identified, prioritized, and addressed"
  children = [
    benchmark.pci_dss_v40_requirement_11_3_1_star
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_11_3_1_star" {
  title       = "11.3.1.* - Additional assessments for 11.3.1 - External and internal vulnerabilities are regularly identified, prioritized, and addressed"

  description = <<-MARKDOWN
    Internal vulnerability scans are performed as follows:

    * At least once every three months.
    * High-risk and critical vulnerabilities (per the entity's vulnerability risk rankings defined at Requirement 6.3.1) are resolved.
    * Rescans are performed that confirm all highrisk and critical vulnerabilities (as noted above) have been resolved.
    * Scan tool is kept up to date with latest vulnerability information.
    * Scans are performed by qualified personnel and organizational independence of the tester exists.
  MARKDOWN

  children = [
    # NOTE: Separate these into Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Machines should have vulnerability findings resolved
  ]

  tags = local.pci_dss_v40_common_tags
}
