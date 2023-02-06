benchmark "pci_dss_v321_requirement_5" {
  title       = "Requirement 5: Protect all systems against malware and regularly update anti-virus software or programs"
  description = "Malicious software (a.k.a “malware”) exploits system vulnerabilities after entering the network via users’ e-mail and other online business activities. Anti-virus software must be used on all systems commonly affected by malware to protect systems from current and evolving malicious software threats. Additional anti-malware solutions may supplement (but not replace) anti-virus software."
  children = [
    benchmark.pci_dss_v321_requirement_5_1
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_5_1" {
  title = "Deploy anti-virus software on all systems commonly affected by malicious software (particularly personal computers and servers). For systems not affected commonly by malicious software, perform periodic evaluations to evaluate evolving malware threats and confirm whether such systems continue to not require anti-virus software"
  children = [
    control.compute_vm_vulnerability_assessment_solution_enabled,
    // control 2
    control.sql_database_vulnerability_findings_resolved,
    control.compute_vm_system_updates_installed
    // control 5
  ]

  tags = merge(local.pci_dss_v321_common_tags, {
    service = "Azure/Monitor"
  })
}