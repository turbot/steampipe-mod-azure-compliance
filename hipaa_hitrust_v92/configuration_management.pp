benchmark "hipaa_hitrust_v92_configuration_management" {
  title       = "06 Configuration Management"
  description = "Configuration management involves implementing processes and controls to effectively manage and track changes to information systems, ensuring their integrity and security. In the context of compliance, organizations need to establish a robust configuration management program that includes documenting the baseline configuration of systems, implementing change management procedures, and conducting regular configuration reviews and audits."
  children = [
    benchmark.hipaa_hitrust_v92_0605_10h1system,
    benchmark.hipaa_hitrust_v92_0635_10k1organizational,
    benchmark.hipaa_hitrust_v92_0636_10k2organizational,
    benchmark.hipaa_hitrust_v92_0637_10k2organizational,
    benchmark.hipaa_hitrust_v92_0638_10k2organizational,
    benchmark.hipaa_hitrust_v92_0639_10k2organizational,
    benchmark.hipaa_hitrust_v92_0640_10k2organizational,
    benchmark.hipaa_hitrust_v92_0641_10k2organizational,
    benchmark.hipaa_hitrust_v92_0642_10k3organizational,
    benchmark.hipaa_hitrust_v92_0643_10k3organizational,
    benchmark.hipaa_hitrust_v92_0644_10k3organizational,
    benchmark.hipaa_hitrust_v92_0662_09scsporganizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_0605_10h1system" {
  title       = "0605.10h1System.12-10.h 10.04 Security of System Files"
  description = "Only authorized administrators are allowed to implement approved upgrades to software, applications, and program libraries, based on business requirements and the security implications of the release."
  children = [
    control.compute_vm_meet_security_option_audit_requirement_windows,
    control.compute_vm_meet_system_audit_policies_requirement_windows,
    control.compute_vm_security_configuration_vulnerabilities_remediated
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0635_10k1organizational" {
  title       = "0635.10k1Organizational.12-10.k 10.05 Security In Development and Support Processes"
  description = "Managers responsible for application systems are also responsible for the strict control (security) of the project or support environment and ensure that all proposed system changes are reviewed to check that they do not compromise the security of either the system or the operating environment."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0636_10k2organizational" {
  title       = "0636.10k2Organizational.1-10.k 10.05 Security In Development and Support Processes"
  description = "The organization formally addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance for configuration management."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0637_10k2organizational" {
  title       = "0637.10k2Organizational.2-10.k 10.05 Security In Development and Support Processes"
  description = "The organization has developed, documented, and implemented a configuration management plan for the information system."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0638_10k2organizational" {
  title       = "0638.10k2Organizational.34569-10.k 10.05 Security In Development and Support Processes"
  description = "Changes are formally controlled, documented and enforced in order to minimize the corruption of information systems."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0639_10k2organizational" {
  title       = "0639.10k2Organizational.78-10.k 10.05 Security In Development and Support Processes"
  description = "Installation checklists and vulnerability scans are used to validate the configuration of servers, workstations, devices and appliances and ensure the configuration meets minimum standards."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0640_10k2organizational" {
  title       = "0640.10k2Organizational.1012-10.k 10.05 Security In Development and Support Processes"
  description = "Where development is outsourced, change control procedures to address security are included in the contract(s) and specifically require the developer to track security flaws and flaw resolution within the system, component, or service and report findings to organization-defined personnel or roles."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0641_10k2organizational" {
  title       = "0641.10k2Organizational.11-10.k 10.05 Security In Development and Support Processes"
  description = "The organization does not use automated updates on critical systems."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0642_10k3organizational" {
  title       = "0642.10k3Organizational.12-10.k 10.05 Security In Development and Support Processes"
  description = "The organization develops, documents, and maintains, under configuration control, a current baseline configuration of the information system, and reviews and updates the baseline as required."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0643_10k3organizational" {
  title       = "0643.10k3Organizational.3-10.k 10.05 Security In Development and Support Processes"
  description = "The organization (i) establishes and documents mandatory configuration settings for information technology products employed within the information system using the latest security configuration baselines; (ii) identifies, documents, and approves exceptions from the mandatory established configuration settings for individual components based on explicit operational requirements; and (iii) monitors and controls changes to the configuration settings in accordance with organizational policies and procedures."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0644_10k3organizational" {
  title       = "0644.10k3Organizational.4-10.k 10.05 Security In Development and Support Processes"
  description = "The organization employs automated mechanisms to (i) centrally manage, apply, and verify configuration settings; (ii) respond to unauthorized changes to network and system security-related configuration settings; and (iii) enforce access restrictions and auditing of the enforcement actions."
  children = [
    control.compute_vm_meet_system_audit_policies_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_0662_09scsporganizational" {
  title       = "0662.09sCSPOrganizational.2-09.s 09.08 Exchange of Information"
  description = "Cloud service providers use an industry-recognized virtualization platform and standard virtualization formats (e.g., Open Virtualization Format, OVF) to help ensure interoperability, and has documented custom changes made to any hypervisor in use and all solution-specific virtualization hooks available for customer review."
  children = [
    control.appservice_web_app_client_certificates_on
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}
