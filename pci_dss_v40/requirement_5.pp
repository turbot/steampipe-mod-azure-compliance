benchmark "pci_dss_v40_requirement_5" {
  title       = "Requirement 5 - Protect All Systems and Networks from Malicious Software"

  description = <<-MARKDOWN
    Malicious software (malware) is software or firmware designed to infiltrate or damage a computer system without the owner's knowledge or consent, with the intent of compromising the confidentiality, integrity, or availability of the owner’s data, applications, or operating system.

    Examples include viruses, worms, Trojans, spyware, ransomware, keyloggers, and rootkits, malicious code, scripts, and links.

    Malware can enter the network during many business-approved activities, including employee e-mail (for example, via phishing) and use of the Internet, mobile computers, and storage devices, resulting in the exploitation of system vulnerabilities.

    Using anti-malware solutions that address all types of malware helps to protect systems from current and evolving malware threats.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_5_2
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_5_2" {
  title       = "5.2 - Malicious software (malware) is prevented, or detected and addressed"

  children = [
    benchmark.pci_dss_v40_requirement_5_2_1,
    benchmark.pci_dss_v40_requirement_5_2_2,
    benchmark.pci_dss_v40_requirement_5_2_3_star
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_5_2_1" {
  title       = "5.2.1 - An anti-malware solution(s) is deployed on all system components"

  description = <<-MARKDOWN
    An anti-malware solution(s) is deployed on all system components, except for those system
    components identified in periodic evaluations per Requirement 5.2.3 that concludes the system
    components are not at risk from malware.
  MARKDOWN

  children = [
    # NOTE: split by Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Missing "Machines should have vulnerability findings resolved"
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_5_2_2" {
  title       = "5.2.2 - Malware cannot execute or infect other system components"

  description = <<-MARKDOWN
    The deployed anti-malware solution(s):

    * Detects all known types of malware.
    * Removes, blocks, or contains all known types of malware.
  MARKDOWN

  children = [
    # NOTE: split by Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Missing "Machines should have vulnerability findings resolved"
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_5_2_3_star" {
  title       = "5.2.3.* - Malicious software (malware) is prevented, or detected and addressed"

  description = <<-MARKDOWN
    Additional assessments for 5.2.3 - Malicious software (malware) is prevented, or detected and addressed.

    Any system components that are not at risk for malware are evaluated periodically to include the following:

    * A documented list of all system components not at risk for malware.
    * Identification and evaluation of evolving malware threats for those system components.
    * Confirmation whether such system components continue to not require anti-malware protection.
  MARKDOWN

  children = [
    # NOTE: split by Windows and Linux
    control.compute_vm_security_configuration_vulnerabilities_remediated,
    control.sql_database_vulnerability_findings_resolved,
    # NOTE: Missing "Machines should have vulnerability findings resolved"
  ]

  tags = local.pci_dss_v40_common_tags
}
