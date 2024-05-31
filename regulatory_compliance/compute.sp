locals {
  regulatory_compliance_compute_common_tags = {
    service = "Azure/Compute"
  }
}

control "compute_vm_attached_with_network" {
  title       = "Virtual machines should be connected to an approved virtual network"
  description = "This policy audits any virtual machine connected to a virtual network that is not approved."
  query       = query.compute_vm_attached_with_network

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_adaptive_network_hardening_recommendation_applied" {
  title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
  description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_remote_access_restricted_all_ports" {
  title       = "All network ports should be restricted on network security groups associated to your virtual machine"
  description = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
  query       = query.compute_vm_remote_access_restricted_all_ports

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_tcp_udp_access_restricted_internet" {
  title       = "Internet-facing virtual machines should be protected with network security groups"
  description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG)."
  query       = query.compute_vm_tcp_udp_access_restricted_internet

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_jit_access_protected" {
  title       = "Management ports of virtual machines should be protected with just-in-time network access control"
  description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
  query       = query.compute_vm_jit_access_protected

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_log_analytics_agent_installed" {
  title       = "Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring"
  description = "This policy audits any Windows/Linux virtual machines if the Log Analytics extension is not installed."
  query       = query.compute_vm_log_analytics_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_log_analytics_agent_installed_windows" {
  title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
  query       = query.compute_vm_log_analytics_agent_installed_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_installed" {
  title       = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
  description = "This policy deploys a Microsoft IaaSAntimalware extension with a default configuration when a VM is not configured with the antimalware extension."
  query       = query.compute_vm_malware_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    hipaa_hitrust_v92     = "true"
  })
}

control "compute_vm_scale_set_log_analytics_agent_installed" {
  title       = "Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring"
  description = "This policy audits any Windows/Linux Virtual Machine Scale Sets if the Log Analytics extension is not installed."
  query       = query.compute_vm_scale_set_log_analytics_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_disaster_recovery_enabled" {
  title       = "Audit virtual machines without disaster recovery configured"
  description = "Audit virtual machines which do not have disaster recovery configured."
  query       = query.compute_vm_disaster_recovery_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_malware_agent_automatic_upgrade_enabled" {
  title       = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
  description = "This policy audits any Windows virtual machine not configured with automatic update of Microsoft Antimalware protection signatures."
  query       = query.compute_vm_malware_agent_automatic_upgrade_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    hipaa_hitrust_v92     = "true"
  })
}

control "compute_vm_scale_set_logging_enabled" {
  title       = "Resource logs in Virtual Machine Scale Sets should be enabled"
  description = "It is recommended to enable Logs so that activity trail can be recreated when investigations are required in the event of an incident or a compromise."
  query       = query.compute_vm_scale_set_logging_enabled

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_meet_system_audit_policies_requirement_windows" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'"
  description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies - Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_network_traffic_data_collection_windows_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Windows virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  query       = query.compute_vm_network_traffic_data_collection_windows_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_network_traffic_data_collection_linux_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Linux virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  query       = query.compute_vm_network_traffic_data_collection_linux_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_adaptive_application_controls_enabled" {
  title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
  description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your machines should be remediated"
  description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_uses_azure_resource_manager" {
  title       = "Virtual machines should be migrated to new Azure Resource Manager resources"
  description = "Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management."
  query       = query.compute_vm_uses_azure_resource_manager

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_vm_scale_set_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
  description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_system_updates_installed" {
  title       = "System updates should be installed on your machines"
  description = "Missing security system updates on your servers will be monitored by Azure Security Center as recommendations."
  query       = query.compute_vm_system_updates_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_administrators_group_with_no_specified_members_windows" {
  title       = "Audit Windows machines missing any of specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group does not contain one or more members that are listed in the policy parameter."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_specified_members_windows" {
  title       = "Audit Windows machines that have the specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains one or more of the members listed in the policy parameter."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_extra_accounts_windows" {
  title       = "Audit Windows machines that have extra accounts in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains members that are not listed in the policy parameter."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_security_option_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Accounts'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Accounts' for limiting local account use of blank passwords and guest account status. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_security_option_audit_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Audit'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Audit' for forcing audit policy subcategory and shutting down if unable to log security audits. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_with_no_specified_certificates_in_trusted_root_windows" {
  title       = "Audit Windows machines that do not contain the specified certificates in Trusted Root"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine Trusted Root certificate store does not contain one or more of the certificates listed by the policy parameter."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_endpoint_protection_agent_installed" {
  title       = "Monitor missing Endpoint Protection in Azure Security Center"
  description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
    pci_dss_v321      = "true"
  })
}

control "compute_vm_meet_firewall_properties_windows" {
  title       = "Windows machines should meet requirements for 'Windows Firewall Properties'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Windows Firewall Properties' for firewall state, connections, rule management, and notifications. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.manual_control_hipaa

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_vulnerability_assessment_solution_enabled" {
  title       = "A vulnerability assessment solution should be enabled on your virtual machines"
  description = "Audits virtual machines to detect whether they are running a supported vulnerability assessment solution. A core component of every cyber risk and security program is the identification and analysis of vulnerabilities. Azure Security Center's standard pricing tier includes vulnerability scanning for your virtual machines at no extra cost. Additionally, Security Center can automatically deploy this tool for you."
  query       = query.compute_vm_vulnerability_assessment_solution_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92     = "true"
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity" {
  title       = "Add system-assigned managed identity to enable Guest Configuration assignments on VMs with a user-assigned identity"
  description = "This policy adds a system-assigned managed identity to virtual machines hosted in Azure that are supported by Guest Configuration and have at least one user-assigned identity but do not have a system-assigned managed identity. A system-assigned managed identity is a prerequisite for all Guest Configuration assignments and must be added to machines before using any Guest Configuration policy definitions."
  query       = query.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_vm_passwords_stored_using_reversible_encryption_windows" {
  title       = "Audit Windows machines that do not store passwords using reversible encryption"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not store passwords using reversible encryption."
  query       = query.compute_vm_passwords_stored_using_reversible_encryption_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_account_with_password_linux" {
  title       = "Audit Linux machines that have accounts without passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope.  Machines are non-compliant if Linux machines that have accounts without passwords."
  query       = query.compute_vm_account_with_password_linux

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_ssh_key_authentication_linux" {
  title       = "Authentication to Linux machines should require SSH keys"
  description = "Although SSH itself provides an encrypted connection, using passwords with SSH still leaves the VM vulnerable to brute-force attacks. The most secure option for authenticating to an Azure Linux virtual machine over SSH is with a public-private key pair, also known as SSH keys."
  query       = query.compute_vm_ssh_key_authentication_linux

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_guest_configuration_installed_linux" {
  title       = "Deploy the Linux Guest Configuration extension to enable Guest Configuration assignments on Linux VMs"
  description = "This policy deploys the Linux Guest Configuration extension to Linux virtual machines hosted in Azure that are supported by Guest Configuration. The Linux Guest Configuration extension is a prerequisite for all Linux Guest Configuration assignments and must be deployed to machines before using any Linux Guest Configuration policy definition."
  query       = query.compute_vm_guest_configuration_installed_linux

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_guest_configuration_installed" {
  title       = "Guest Configuration extension should be installed on your machines"
  description = "To ensure secure configurations of in-guest settings of your machine, install the Guest Configuration extension. In-guest settings that the extension monitors include the configuration of the operating system, application configuration or presence, and environment settings. Once installed, in-guest policies will be available such as 'Windows Exploit guard should be enabled'."
  query       = query.compute_vm_guest_configuration_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "arc_compute_machine_linux_log_analytics_agent_installed" {
  title       = "Log Analytics extension should be installed on your Linux Azure Arc machines"
  description = "This policy audits Linux Azure Arc machines if the Log Analytics extension is not installed."
  query       = query.arc_compute_machine_linux_log_analytics_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_guest_configuration_installed_windows" {
  title       = "Deploy the Windows Guest Configuration extension to enable Guest Configuration assignments on Windows VMs"
  description = "This policy deploys the Windows Guest Configuration extension to Windows virtual machines hosted in Azure that are supported by Guest Configuration. The Windows Guest Configuration extension is a prerequisite for all Windows Guest Configuration assignments and must be deployed to machines before using any Windows Guest Configuration policy definition."
  query       = query.compute_vm_guest_configuration_installed_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_vm_restrict_previous_24_passwords_resuse_windows" {
  title       = "Audit Windows machines that allow re-use of the previous 24 passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that allow re-use of the previous 24 passwords."
  query       = query.compute_vm_restrict_previous_24_passwords_resuse_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_vm_max_password_age_70_days_windows" {
  title       = "Audit Windows machines that do not have a maximum password age of 70 days"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have a maximum password age of 70 days."
  query       = query.compute_vm_max_password_age_70_days_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "compute_vm_min_password_age_1_day_windows" {
  title       = "Audit Windows machines that do not have a minimum password age of 1 day"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have a minimum password age of 1 day."
  query       = query.compute_vm_min_password_age_1_day_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_password_complexity_setting_enabled_windows" {
  title       = "Audit Windows machines that do not have the password complexity setting enabled"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have the password complexity setting enabled."
  query       = query.compute_vm_password_complexity_setting_enabled_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_min_password_length_14_windows" {
  title       = "Audit Windows machines that do not restrict the minimum password length to 14 characters"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not restrict the minimum password length to 14 characters."
  query       = query.compute_vm_min_password_length_14_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_disk_access_uses_private_link" {
  title       = "Disk access resources should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to diskAccesses, data leakage risks are reduced."
  query       = query.compute_disk_access_uses_private_link

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "network_interface_ip_forwarding_disabled" {
  title       = "IP Forwarding on your virtual machine should be disabled"
  description = "Enabling IP forwarding on a virtual machine's NIC allows the machine to receive traffic addressed to other destinations. IP forwarding is rarely required (e.g., when using the VM as a network virtual appliance), and therefore, this should be reviewed by the network security team."
  query       = query.network_interface_ip_forwarding_disabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "arc_compute_machine_windows_log_analytics_agent_installed" {
  title       = "Log Analytics extension should be installed on your Windows Azure Arc machines"
  description = "This policy audits Windows Azure Arc machines if the Log Analytics agent is not installed."
  query       = query.arc_compute_machine_windows_log_analytics_agent_installed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_guest_configuration_with_system_assigned_managed_identity" {
  title       = "Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity"
  description = "The Guest Configuration extension requires a system assigned managed identity. Azure virtual machines in the scope of this policy will be non-compliant when they have the Guest Configuration extension installed but do not have a system assigned managed identity."
  query       = query.compute_vm_guest_configuration_with_system_assigned_managed_identity

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    rbi_itf_nbfc_v2017    = "true"
  })
}

control "compute_vm_windows_defender_exploit_guard_enabled" {
  title       = "Windows Defender Exploit Guard should be enabled on your machines"
  description = "Windows Defender Exploit Guard uses the Azure Policy Guest Configuration agent. Exploit Guard has four components that are designed to lock down devices against a wide variety of attack vectors and block behaviors commonly used in malware attacks while enabling enterprises to balance their security risk and productivity requirements (Windows only)."
  query       = query.compute_vm_windows_defender_exploit_guard_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_secure_communication_protocols_configured" {
  title       = "Windows web servers should be configured to use secure communication protocols"
  description = "To protect the privacy of information communicated over the Internet, your web servers should use the latest version of the industry-standard cryptographic protocol, Transport Layer Security (TLS). TLS secures communications over a network by using security certificates to encrypt a connection between machines."
  query       = query.compute_vm_secure_communication_protocols_configured

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_restrict_remote_connection_from_accounts_without_password_linux" {
  title       = "Audit Linux machines that allow remote connections from accounts without passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Linux machines that allow remote connections from accounts without passwords."
  query       = query.compute_vm_restrict_remote_connection_from_accounts_without_password_linux

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed" {
  title       = "Managed disks should be double encrypted with both platform-managed and customer-managed keys"
  description = "High security sensitive customers who are concerned of the risk associated with any particular encryption algorithm, implementation, or key being compromised can opt for additional layer of encryption using a different encryption algorithm/mode at the infrastructure layer using platform managed encryption keys. The disk encryption sets are required to use double encryption."
  query       = query.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_and_sacle_set_encryption_at_host_enabled" {
  title       = "Virtual machines and virtual machine scale sets should have encryption at host enabled"
  description = "Use encryption at host to get end-to-end encryption for your virtual machine and virtual machine scale set data. Encryption at host enables encryption at rest for your temporary disk and OS/data disk caches. Temporary and ephemeral OS disks are encrypted with platform-managed keys when encryption at host is enabled. OS/data disk caches are encrypted at rest with either customer-managed or platform-managed key, depending on the encryption type selected on the disk."
  query       = query.compute_vm_and_sacle_set_encryption_at_host_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated" {
  title       = "Allowlist rules in your adaptive application control policy should be updated"
  description = "Monitor for changes in behavior on groups of machines configured for auditing by Azure Security Center's adaptive application controls. Security Center uses machine learning to analyze the running processes on your machines and suggest a list of known-safe applications. These are presented as recommended apps to allow in adaptive application control policies."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_scale_set_endpoint_protection_solution_installed" {
  title       = "Endpoint protection solution should be installed on virtual machine scale sets"
  description = "Audit the existence and health of an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_monitor_missing_endpoint_protection_in_asc" {
  title       = "Monitor missing Endpoint Protection in Azure Security Center"
  description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_non_internet_facing_protected_with_nsg" {
  title       = "Non-internet-facing virtual machines should be protected with network security groups"
  description = "Protect your non-internet-facing virtual machines from potential threats by restricting access with network security groups (NSG)."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_password_file_permissions_0644_linux" {
  title       = "Audit Linux machines that do not have the passwd file permissions set to 0644"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Linux machines that do not have the passwd file permissions set to 0644"
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_temp_disks_cache_and_data_flows_encrypted" {
  title       = "Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
  description = "By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys. Temp disks, data caches and data flowing between compute and storage aren't encrypted. Disregard this recommendation if: 1. using encryption-at-host, or 2. server-side encryption on Managed Disks meets your security requirements. Learn more in: Server-side encryption of Azure Disk Storage: https://aka.ms/disksse, Different disk encryption offerings: https://aka.ms/diskencryptioncomparison"
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_container_security_configurations_vulnerabilities_remediated" {
  title       = "Vulnerabilities in container security configurations should be remediated"
  description = "Audit vulnerabilities in security configuration on machines with Docker installed and display as recommendations in Azure Security Center."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_meet_security_baseline_requirements_linux" {
  title       = "Linux machines should meet requirements for the Azure compute security baseline"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine is not configured correctly for one of the recommendations in the Azure compute security baseline."
  query       = query.compute_vm_meet_security_baseline_requirements_linux

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_meet_security_baseline_requirements_windows" {
  title       = "Windows machines should meet requirements of the Azure compute security baseline"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine is not configured correctly for one of the recommendations in the Azure compute security baseline."
  query       = query.compute_vm_meet_security_baseline_requirements_windows

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

# control "compute_vm_log_analytics_agent_health_issues_resolved" {
#   title       = "Log Analytics agent health issues should be resolved on your machines"
#   description = "Security Center uses the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA). To make sure your virtual machines are successfully monitored, you need to make sure the agent is installed on the virtual machines and properly collects security events to the configured workspace."
#   query       = query.manual_control

#   tags = merge(local.regulatory_compliance_compute_common_tags, {
#     other_checks = "true"
#   })
# }

control "compute_vm_vulnerability_findings_resolved_for_sql_server" {
  title       = "SQL servers on machines should have vulnerability findings resolved"
  description = "SQL vulnerability assessment scans your database for security vulnerabilities, and exposes any deviations from best practices such as misconfigurations, excessive permissions, and unprotected sensitive data. Resolving the vulnerabilities found can greatly improve your database security posture."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_guest_configuration_with_no_managed_identity" {
  title       = "Add system-assigned managed identity to enable Guest Configuration assignments on virtual machines with no identities"
  description = "This policy adds a system-assigned managed identity to virtual machines hosted in Azure that are supported by Guest Configuration but do not have any managed identities. A system-assigned managed identity is a prerequisite for all Guest Configuration assignments and must be added to machines before using any Guest Configuration policy definitions."
  query       = query.compute_vm_guest_configuration_with_no_managed_identity

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
    pci_dss_v321          = "true"
  })
}

control "compute_vm_meet_security_options_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Recovery console'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Recovery console' for allowing floppy copy and access to all drives and folders. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_system_updates_installed" {
  title       = "System updates on virtual machine scale sets should be installed"
  description = "Audit whether there are any missing system security updates and critical updates that should be installed to ensure that your Windows and Linux virtual machine scale sets are secure."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    rbi_itf_nbfc_v2017   = "true"
  })
}

control "compute_vm_meet_security_options_network_access_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Network Access'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Network Access' for including access for anonymous users, local accounts, and remote access to the registry. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_security_options_user_account_control_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - User Account Control'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - User Account Control' for mode for admins, behavior of elevation prompt, and virtualizing file and registry write failures. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_azure_backup_enabled" {
  title       = "Azure Backup should be enabled for Virtual Machines"
  description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92  = "true"
    rbi_itf_nbfc_v2017 = "true"
  })
}

control "compute_vm_image_builder_uses_private_link" {
  title       = "VM Image Builder templates should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your VM Image Builder building resources, data leakage risks are reduced."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_os_and_data_disk_encrypted_with_cmk" {
  title       = "OS and data disks should be encrypted with a customer-managed key"
  description = "Use customer-managed keys to manage the encryption at rest of the contents of your managed disks. By default, the data is encrypted at rest with platform-managed keys, but customer-managed keys are commonly required to meet regulatory compliance standards. Customer-managed keys enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more at https://aka.ms/disks-cmk."
  query       = query.compute_os_and_data_disk_encrypted_with_cmk

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_171_rev_2 = "true"
    nist_sp_800_53_rev_5  = "true"
  })
}

control "compute_vm_data_and_os_disk_uses_managed_disk" {
  title       = "Compute virtual machines should use managed disk for OS and data disk"
  description = "This control checks whether virtual machines use managed disks for OS and data disks."
  query       = query.compute_vm_data_and_os_disk_uses_managed_disk

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_scale_set_automatic_upgrade_enabled" {
  title       = "Compute virtual machine scale sets should have automatic OS image patching enabled"
  description = "This control checks whether virtual machine scale sets have automatic OS image patching enabled."
  query       = query.compute_vm_scale_set_automatic_upgrade_enabled

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_scale_set_ssh_key_authentication_linux" {
  title       = "Compute virtual machine scale sets with linux OS should have SSH key authentication enabled"
  description = "This control checks whether virtual machine scale sets have SSH key authentication enabled. This control is only applicable for Linux-type operating systems."
  query       = query.compute_vm_scale_set_ssh_key_authentication_linux

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_unattached_disk_encrypted_with_cmk" {
  title       = "Ensure that 'Unattached disks' are encrypted with 'Customer Managed Key' (CMK)"
  description = "Ensure that unattached disks in a subscription are encrypted with a Customer Managed Key (CMK)."
  query       = query.compute_unattached_disk_encrypted_with_cmk

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_utilizing_managed_disk" {
  title       = "Ensure Virtual Machines are utilizing Managed Disks"
  description = "Migrate BLOB based VHD's to Managed Disks on Virtual Machines to exploit the default features of this configuration."
  query       = query.compute_vm_utilizing_managed_disk

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_disk_unattached_encrypted_with_cmk" {
  title       = "Unattached Compute disks should be encrypted with ADE/CMK"
  description = "This policy identifies the disks which are unattached and are encrypted with default encryption instead of ADE/CMK. Azure encrypts disks by default Server-Side Encryption (SSE) with platform-managed keys [SSE with PMK]. It is recommended to use either SSE with Azure Disk Encryption [SSE with PMK+ADE] or Customer Managed Key [SSE with CMK] which improves on platform-managed keys by giving you control of the encryption keys to meet your compliance need."
  query       = query.compute_disk_unattached_encrypted_with_cmk

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_scale_set_uses_managed_disks" {
  title       = "Virtual machine scale sets should use managed disks"
  description = "This policy identifies Azure Virtual machine scale sets which are not utilising Managed Disks. Using Azure Managed disk over traditional BLOB storage based VHD's has more advantage features like Managed disks are by default encrypted, reduces cost over storage accounts and more resilient as Microsoft will manage the disk storage and move around if underlying hardware goes faulty. It is recommended to move BLOB based VHD's to Managed Disks."
  query       = query.compute_vm_scale_set_uses_managed_disks

  tags = local.regulatory_compliance_compute_common_tags
}

control "compute_vm_scale_set_boot_diagnostics_enabled" {
  title       = "Virtual Machine scale sets boot diagnostics should be enabled"
  description = "This policy identifies Azure Virtual Machines scale sets which has Boot Diagnostics setting Disabled. Boot Diagnostics when enabled for virtual machine, captures Screenshot and Console Output during virtual machine startup. This would help in troubleshooting virtual machine when it enters a non-bootable state."
  query       = query.compute_vm_scale_set_boot_diagnostics_enabled

  tags = local.regulatory_compliance_compute_common_tags
}

query "compute_os_and_data_disk_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      disk.id as resource,
      case
        when encryption_type = 'EncryptionAtRestWithCustomerKey' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_type = 'EncryptionAtRestWithCustomerKey' then disk.name || ' encrypted with CMK.'
        else disk.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "disk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_disk disk,
      azure_subscription sub
    where
      disk_state = 'Attached'
      and sub.subscription_id = disk.subscription_id;
  EOQ
}

query "compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed" {
  sql = <<-EOQ
    select
      disk.id as resource,
      case
        when encryption_type = 'EncryptionAtRestWithPlatformAndCustomerKeys' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_type = 'EncryptionAtRestWithPlatformAndCustomerKeys' then disk.name || ' encrypted with both platform-managed and customer-managed keys.'
        else disk.name || ' not encrypted with both platform-managed and customer-managed keys.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "disk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_disk disk,
      azure_subscription sub
    where
      disk_state = 'Attached'
      and sub.subscription_id = disk.subscription_id;
  EOQ
}

query "compute_vm_restrict_remote_connection_from_accounts_without_password_linux" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(guest_configuration_assignments) as e
      where
        e ->> 'name' = 'PasswordPolicy_msid110'
        and e ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.name || ' is of ' || a.os_type || ' operating system.'
        when m.id is not null then a.name || ' restrict remote connections from accounts without passwords.'
        else a.name || ' allows remote connections from accounts without passwords.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join compute_machine as m on m.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_unattached_disk_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      disk.id as resource,
      case
        when encryption_type = 'EncryptionAtRestWithCustomerKey' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_type = 'EncryptionAtRestWithCustomerKey' then disk.name || ' encrypted with CMK.'
        else disk.name || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "disk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_disk disk,
      azure_subscription sub
    where
      disk_state != 'Attached'
      and sub.subscription_id = disk.subscription_id;
  EOQ
}

query "compute_vm_attached_with_network" {
  sql = <<-EOQ
    with vm_with_network_interfaces as (
      select
        vm.id as vm_id,
        n ->> 'id' as network_id
      from
        azure_compute_virtual_machine as vm,
        jsonb_array_elements(network_interfaces) as n
    ),
    vm_with_appoved_networks as (
      select
        vn.vm_id as vm_id,
        vn.network_id as network_id,
        t.title as title
      from
        vm_with_network_interfaces as vn
        left join azure_network_interface as t on t.id = vn.network_id
        where exists
          (select
            ip -> 'properties' -> 'subnet' ->> 'id' as ip
          FROM
            azure_network_interface,
            jsonb_array_elements(ip_configurations) as ip
          where
            ip -> 'properties' -> 'subnet' ->> 'id' is not null)
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.vm_id is null then a.title || ' not attached with virtual network.'
        else a.name || ' attached with virtual network ' || b.title || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_with_appoved_networks as b on a.id = b.vm_id,
      azure_subscription sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_remote_access_restricted_all_ports" {
  sql = <<-EOQ
    with network_sg as (
      select
        distinct name as sg_name,
        network_interfaces
      from
        azure_network_security_group as nsg,
        jsonb_array_elements(security_rules) as sg,
        jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) as dport,
        jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and sg -> 'properties' ->> 'protocol' in ('TCP','*')
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', '<nw>/0', '/0')
    )
    select
      vm.vm_id as resource,
      case
        when sg.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.sg_name is null then vm.title || ' restricts remote access from internet.'
        else vm.title || ' allows remote access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm
      left join network_sg as sg on sg.network_interfaces @> vm.network_interfaces
      join azure_subscription as sub on sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_tcp_udp_access_restricted_internet" {
  sql = <<-EOQ
    with network_sg as (
      select
        distinct id as sg_id,
        subscription_id,
        network_interfaces
      from
        azure_network_security_group as nsg,
        jsonb_array_elements(security_rules) as sg,
        jsonb_array_elements_text(
          sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb
        ) as dport,
        jsonb_array_elements_text(
          sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb
        ) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and sg -> 'properties' ->> 'protocol' in ('TCP', 'UDP')
        and sip in (
          '*',
          '0.0.0.0',
          '0.0.0.0/0',
          'Internet',
          'any',
          '<nw>/0',
          '/0'
        )
        and (
          dport in ('22', '3389', '*')
          or (
            dport like '%-%'
            and (
              (
                53 between split_part(dport, '-', 1) :: integer
                and split_part(dport, '-', 2) :: integer
                or 123 between split_part(dport, '-', 1) :: integer
                and split_part(dport, '-', 2) :: integer
                or 161 between split_part(dport, '-', 1) :: integer
                and split_part(dport, '-', 2) :: integer
                or 389 between split_part(dport, '-', 1) :: integer
                and split_part(dport, '-', 2) :: integer
                or 1900 between split_part(dport, '-', 1) :: integer
                and split_part(dport, '-', 2) :: integer
              )
              or (
                split_part(dport, '-', 1) :: integer <= 3389
                and split_part(dport, '-', 2) :: integer >= 3389
              )
              or (
                split_part(dport, '-', 1) :: integer <= 22
                and split_part(dport, '-', 2) :: integer >= 22
              )
            )
          )
        )
    ), network_security_group_subnets as (
    select
      nsg.id as nsg_id,
      sub ->> 'id' as subnet_id
    from
      azure_network_security_group as nsg,
      jsonb_array_elements(nsg.subnets) as sub
    where
      nsg.id in (select sg_id from network_sg )
  ),
  virtual_machines_with_access as (
    select
      nic.virtual_machine_id as virtual_machine_id
    from
      azure_network_interface as nic,
      jsonb_array_elements(nic.ip_configurations) as config
      left join network_security_group_subnets as sub on config -> 'properties' -> 'subnet' ->> 'id' = sub.subnet_id
  where
    nic.virtual_machine_id is not null
    and sub.nsg_id is not null
  union
    select
      n.virtual_machine_id as virtual_machine_id
  from
    network_sg as nsg,
    jsonb_array_elements(network_interfaces)  as vm_nic
    left join azure_network_interface as n on n.id = vm_nic ->> 'id'
  )
  select
    vm.id as resource,
    case
      when m.virtual_machine_id is not null then 'alarm'
      else 'ok'
    end as status,
    case
      when m.virtual_machine_id is not null then vm.title || ' restricts remote access from internet.'
      else vm.title || ' allows remote access from internet.'
    end as reason,
    vm.resource_group as resource_group,
    sub.display_name as subscription
    ${local.tag_dimensions_sql}
    ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
    ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
  from
    azure_compute_virtual_machine as vm
    left join virtual_machines_with_access as m on lower(m.virtual_machine_id) = lower(vm.id)
    join azure_subscription as sub on sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_jit_access_protected" {
  sql = <<-EOQ
    with compute as (
      select
        vm.id as resource,
        'alarm' as status,
        vm.name || ' not JIT protected.' as reason,
        vm.resource_group,
        sub.display_name as subscription
      from
        azure_compute_virtual_machine as vm,
        azure_subscription sub
      where
        vm.subscription_id = sub.subscription_id
    )
    select
      distinct vm.vm_id as resource,
      case
        when lower(vm.id) = lower(vms ->> 'id') then 'ok'
        else 'alarm'
      end as status,
      case
        when lower(vms ->> 'id') = lower(vm.id) then vm.name || ' JIT protected.'
        else vm.name || ' not JIT protected.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm,
      azure_security_center_jit_network_access_policy as jit,
      jsonb_array_elements(virtual_machines) as vms,
      azure_subscription as sub
      left join compute on true
    where
      jit.subscription_id = sub.subscription_id;
  EOQ
}

query "compute_vm_log_analytics_agent_installed" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.EnterpriseCloud.Monitoring'
        and b ->> 'ExtensionType' = any(ARRAY ['MicrosoftMonitoringAgent', 'OmsAgentForLinux'])
        and b ->> 'ProvisioningState' = 'Succeeded'
        and b -> 'Settings' ->> 'workspaceId' is not null
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is not null then a.title || ' have log analytics agent installed.'
        else a.title || ' log analytics agent not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_log_analytics_agent_installed_windows" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.EnterpriseCloud.Monitoring'
        and b ->> 'ExtensionType' = any(ARRAY ['MicrosoftMonitoringAgent', 'OmsAgentForLinux'])
        and b ->> 'ProvisioningState' = 'Succeeded'
        and b -> 'Settings' ->> 'workspaceId' is not null
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating syetem.'
        when b.vm_id is not null then a.title || ' have log analytics agent installed.'
        else a.title || ' log analytics agent not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_malware_agent_installed" {
  sql = <<-EOQ
    with malware_agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.Azure.Security'
        and b ->> 'ExtensionType' = 'IaaSAntimalware'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is not null then a.title || ' IaaSAntimalware extension installed.'
        else a.title || ' IaaSAntimalware extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join malware_agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_scale_set_log_analytics_agent_installed" {
  sql = <<-EOQ
    with agent_installed_vm_scale_set as (
      select
        distinct a.id as vm_id
      from
        azure_compute_virtual_machine_scale_set as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.EnterpriseCloud.Monitoring'
        and b ->> 'ExtensionType' = any(ARRAY ['MicrosoftMonitoringAgent', 'OmsAgentForLinux'])
        and b ->> 'ProvisioningState' = 'Succeeded'
        and b -> 'Settings' ->> 'workspaceId' is not null
    )
    select
      a.id as resource,
      case
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is not null then a.title || ' have log analytics agent installed.'
        else a.title || ' log analytics agent not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine_scale_set as a
      left join agent_installed_vm_scale_set as b on a.id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_disaster_recovery_enabled" {
  sql = <<-EOQ
    with vm_dr_enabled as (
      select
        substr(source_id, 0, length(source_id)) as source_id
      from
        azure_resource_link as l
        left join azure_compute_virtual_machine as vm on lower(substr(source_id, 0, length(source_id)))= lower(vm.id)
      where
        l.name like 'ASR-Protect-%'
    )
    select
      vm.vm_id as resource,
      case
        when l.source_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when l.source_id is null then vm.title || ' disaster recovery disabled.'
        else vm.title || ' disaster recovery enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm
      left join vm_dr_enabled as l on lower(vm.id) = lower(l.source_id),
      azure_subscription sub
    where
      sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_malware_agent_automatic_upgrade_enabled" {
  sql = <<-EOQ
    with malware_agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.Azure.Security'
        and b ->> 'ExtensionType' = 'IaaSAntimalware'
        and b ->> 'AutoUpgradeMinorVersion' = 'true'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating syetem.'
        when b.vm_id is not null then a.title || ' automatic update of Microsoft Antimalware protection signatures enabled.'
        else a.title || ' automatic update of Microsoft Antimalware protection signatures not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join malware_agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_scale_set_logging_enabled" {
  sql = <<-EOQ
    with malware_agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.Azure.Security'
        and b ->> 'ExtensionType' = 'IaaSAntimalware'
        and b ->> 'AutoUpgradeMinorVersion' = 'true'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating syetem.'
        when b.vm_id is not null then a.title || ' automatic update of Microsoft Antimalware protection signatures enabled.'
        else a.title || ' automatic update of Microsoft Antimalware protection signatures not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join malware_agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_network_traffic_data_collection_windows_agent_installed" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'ExtensionType' = 'DependencyAgentWindows'
        and b ->> 'Publisher' = 'Microsoft.Azure.Monitoring.DependencyAgent'
        and b ->> 'ProvisioningState' = 'Succeeded'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have data collection agent installed.'
        else a.title || ' data collection agent not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_network_traffic_data_collection_linux_agent_installed" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'ExtensionType' = 'DependencyAgentLinux'
        and b ->> 'Publisher' = 'Microsoft.Azure.Monitoring.DependencyAgent'
        and b ->> 'ProvisioningState' = 'Succeeded'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have data collection agent installed.'
        else a.title || ' data collection agent not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_uses_azure_resource_manager" {
  sql = <<-EOQ
    select
      vm.vm_id as resource,
      case
        when resource_group is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when resource_group is not null then vm.title || ' uses azure resource manager.'
        else vm.title || ' not uses azure resource manager.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm,
      azure_subscription as sub
    where
      sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_system_updates_installed" {
  sql = <<-EOQ
    select
      vm.vm_id as resource,
      case
        when enable_automatic_updates then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_automatic_updates then vm.title || ' automatic system updates enabled.'
        else vm.title || ' automatic system updates disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm,
      azure_subscription as sub
    where
      sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_vulnerability_assessment_solution_enabled" {
  sql = <<-EOQ
    with defender_enabled_vms as (
      select
        distinct a.vm_id as vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'ExtensionType' = any(ARRAY ['MDE.Linux', 'MDE.Windows'])
        and b ->> 'ProvisioningState' = 'Succeeded'
    ),
    agent_installed_vm as (
      select
        distinct a.vm_id as vm_id
      from
        defender_enabled_vms as a
        left join azure_compute_virtual_machine as w on w.vm_id = a.vm_id,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Qualys'
        and b ->> 'ExtensionType' = any(ARRAY ['WindowsAgent.AzureSecurityCenter', 'LinuxAgent.AzureSecurityCenter'])
        and b ->> 'ProvisioningState' = 'Succeeded'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is not null then a.title || ' have vulnerability assessment solution enabled.'
        else a.title || ' have vulnerability assessment solution disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity" {
  sql = <<-EOQ
    with gc_installed_vm as (
      select
        distinct a.vm_id,
        title
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is null then 'skip'
        when not string_to_array(a.identity ->> 'type' , ', ') @> array['UserAssigned'] then 'skip'
        when string_to_array(identity ->> 'type' , ', ') @> array['UserAssigned', 'SystemAssigned'] then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is null then a.title || ' guest configuration extension not installed.'
        when not string_to_array(a.identity ->> 'type' , ', ') @> array['UserAssigned'] then a.title || ' does not have user assigned managed identity.'
        when string_to_array(identity ->> 'type' , ', ') @> array['UserAssigned', 'SystemAssigned'] then a.title || ' guest configuration extension installed with user and system assigned managed identity.'
        else a.title || ' guest configuration extension not installed with user and system assigned managed identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join gc_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_passwords_stored_using_reversible_encryption_windows" {
  sql = <<-EOQ
    with vm_password_reversible_encryption as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'StorePasswordsUsingReversibleEncryption'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' store passwords using reversible encryption.'
        else a.title || ' not store passwords using reversible encryption'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_password_reversible_encryption as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_account_with_password_linux" {
  sql = <<-EOQ
    with vm_ssh_key_auth as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'PasswordPolicy_msid232'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have accounts with passwords.'
        else a.title || ' does not have have accounts with passwords.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_ssh_key_auth as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_ssh_key_authentication_linux" {
  sql = <<-EOQ
    with vm_ssh_key_auth as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'LinuxNoPasswordForSSH'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have SSH keys authentication.'
        else a.title || ' does not have SSH keys authentication.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_ssh_key_auth as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_installed_linux" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
        and b ->> 'ProvisioningState' = 'Succeeded'
        and b ->> 'ExtensionType' = 'ConfigurationforLinux'
        and b ->> 'Name' like '%AzurePolicyforLinux'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have guest configuration extension installed.'
        else a.title || ' guest configuration extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_installed" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
        and b ->> 'ProvisioningState' = 'Succeeded'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is not null then a.title || ' have guest configuration extension installed.'
        else a.title || ' guest configuration extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "arc_compute_machine_linux_log_analytics_agent_installed" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_hybrid_compute_machine,
        jsonb_array_elements(extensions) as e
      where
      e ->> 'name' = 'OMSAgentForLinux'
      and e ->> 'provisioningState' = 'Succeeded'
    )
    select
      a.id as resource,
      case
        when a.os_name <> 'linux' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_name <> 'linux' then a.name || ' is of ' || a.os_name || ' operating system.'
        when m.id is not null then a.name || ' log analytics extension installed.'
        else a.name || ' log analytics extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
    azure_hybrid_compute_machine as a
    left join compute_machine as m on m.id = a.id,
    azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_installed_windows" {
  sql = <<-EOQ
    with agent_installed_vm as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
        and b ->> 'ProvisioningState' = 'Succeeded'
        and b ->> 'ExtensionType' = 'ConfigurationforWindows'
        and b ->> 'Name' like '%AzurePolicyforWindows'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' have guest configuration extension installed.'
        else a.title || ' guest configuration extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join agent_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_restrict_previous_24_passwords_resuse_windows" {
  sql = <<-EOQ
    with vm_enforce_password_history as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'EnforcePasswordHistory'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' enforce password history.'
        else a.title || ' doest not enforce password history.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_enforce_password_history as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_max_password_age_70_days_windows" {
  sql = <<-EOQ
    with vm_maximum_password_age as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'MaximumPasswordAge'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' maximum password age is 70 days.'
        else a.title || ' maximum password age is not 70 days.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_maximum_password_age as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_min_password_age_1_day_windows" {
  sql = <<-EOQ
    with vm_min_password_age as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'MinimumPasswordAge'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' minimum password age is 1 day.'
        else a.title || ' minimum password age is not 1 day.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_min_password_age as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_password_complexity_setting_enabled_windows" {
  sql = <<-EOQ
    with vm_password_complexity_setting as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'PasswordMustMeetComplexityRequirements'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' password complexity setting enabled.'
        else a.title || ' password complexity setting disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_password_complexity_setting as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_min_password_length_14_windows" {
  sql = <<-EOQ
    with vm_min_password_age as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'MinimumPasswordLength'
        and b ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when b.vm_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when b.vm_id is not null then a.title || ' minimum password length is 14 characters.'
        else a.title || ' minimum password length is not 14 characters.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join vm_min_password_age as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_disk_access_uses_private_link" {
  sql = <<-EOQ
    with compute_disk_connection as (
      select
        distinct a.id
      from
        azure_compute_disk_access as a,
        jsonb_array_elements(private_endpoint_connections) as connection
      where
        connection ->> 'PrivateLinkServiceConnectionStateStatus' = 'Approved'
    )
    select
      b.id as resource,
      case
        when c.id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.id is null then b.name || ' not uses private link.'
        else b.name || ' uses private link.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_disk_access as b
      left join compute_disk_connection as c on b.id = c.id,
      azure_subscription as sub
    where
      sub.subscription_id = b.subscription_id;
  EOQ
}

query "network_interface_ip_forwarding_disabled" {
  sql = <<-EOQ
    with vm_using_nic as (
      select
        id as vm_id,
        name as vm_name,
        resource_group,
        _ctx,
        region,
        subscription_id,
        b ->> 'id' as nic_id
      from
        azure_compute_virtual_machine as c,
        jsonb_array_elements(network_interfaces) as b
    )
    select
      v.vm_id as resource,
      case
        when i.enable_ip_forwarding then 'alarm'
        else 'ok'
      end as status,
      case
        when i.enable_ip_forwarding then v.vm_name || ' using ' || i.name || ' network interface enabled with IP forwarding.'
        else v.vm_name || ' using ' || i.name || ' network interface disabled with IP forwarding.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_subscription as sub,
      vm_using_nic as v
      left join azure_network_interface as i on i.id = v.nic_id;
  EOQ
}

query "arc_compute_machine_windows_log_analytics_agent_installed" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_hybrid_compute_machine,
        jsonb_array_elements(extensions) as e
      where
      e ->> 'name' = 'MicrosoftMonitoringAgent'
      and e ->> 'provisioningState' = 'Succeeded'
    )
    select
      a.id as resource,
      case
        when a.os_name <> 'windows' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_name <> 'windows' then a.name || ' is of ' || a.os_name || ' operating system.'
        when m.id is not null then a.name || ' log analytics extension installed.'
        else a.name || ' log analytics extension not installed.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
    azure_hybrid_compute_machine as a
    left join compute_machine as m on m.id = a.id,
    azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_with_system_assigned_managed_identity" {
  sql = <<-EOQ
    with gc_installed_vm as (
      select
        distinct a.vm_id,
        title
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is null then 'skip'
        when b.vm_id is not null and string_to_array(identity ->> 'type' , ', ') @> array['SystemAssigned'] then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is null then a.title || ' guest configuration extension not installed.'
        when b.vm_id is not null and string_to_array(identity ->> 'type' , ', ') @> array['SystemAssigned'] then a.title || ' guest configuration extension installed with system-assigned managed identity.'
        else a.title || ' guest configuration extension not installed with system-assigned managed identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join gc_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_windows_defender_exploit_guard_enabled" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(guest_configuration_assignments) as e
      where
      e ->> 'name' = 'WindowsDefenderExploitGuard'
      and e ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.name || ' is of ' || a.os_type || ' operating system.'
        when m.id is not null then a.name || ' windows defender exploit guard enabled.'
        else a.name || ' windows defender exploit guard disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join compute_machine as m on m.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_secure_communication_protocols_configured" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group,c
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(guest_configuration_assignments) as e,
        jsonb_array_elements(e -> 'guestConfiguration' -> 'configurationParameter') as c
      where
        e ->> 'name' = 'AuditSecureProtocol'
        and e ->> 'complianceStatus' = 'Compliant'
        and c ->> 'name' = 'MinimumTLSVersion'
        and c ->> 'value' = '1.3'
    )
    select
      a.id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.name || ' is of ' || a.os_type || ' operating system.'
        when m.id is not null then a.name || ' configured to use secure communication protocols.'
        else a.name || ' not configured to use secure communication protocols.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join compute_machine as m on m.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_and_sacle_set_encryption_at_host_enabled" {
  sql = <<-EOQ
    (
      select
        a.id as resource,
        case
          when security_profile -> 'encryptionAtHost' = 'true' then 'ok'
          else 'alarm'
        end as status,
        case
          when security_profile -> 'encryptionAtHost' = 'true' then a.name || ' encryption at host enabled.'
          else a.name || ' encryption at host disabled.'
        end as reason
        ${local.tag_dimensions_sql}
        ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_compute_virtual_machine as a,
        azure_subscription as sub
      where
        sub.subscription_id = a.subscription_id
    )
    union
    (
      select
        a.id as resource,
        case
          when virtual_machine_security_profile -> 'encryptionAtHost' = 'true' then 'ok'
          else 'alarm'
        end as status,
        case
          when virtual_machine_security_profile -> 'encryptionAtHost' = 'true' then a.name || ' encryption at host enabled.'
          else a.name || ' encryption at host disabled.'
        end as reason
        ${local.tag_dimensions_sql}
        ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_compute_virtual_machine_scale_set as a,
        azure_subscription as sub
      where
        sub.subscription_id = a.subscription_id
    )
  EOQ
}

query "compute_vm_meet_security_baseline_requirements_linux" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(guest_configuration_assignments) as e
      where
        e ->> 'name' = 'AzureLinuxBaseline'
        and e ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Linux' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Linux' then a.name || ' is of ' || a.os_type || ' operating system.'
        when m.id is not null then a.name || ' meet requirements for azure compute security baseline.'
        else a.name || ' does not meet requirements for azure compute security baseline.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join compute_machine as m on m.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_meet_security_baseline_requirements_windows" {
  sql = <<-EOQ
    with compute_machine as(
      select
        id,
        name,
        subscription_id,
        resource_group
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(guest_configuration_assignments) as e
      where
      e ->> 'name' = 'AzureWindowsBaseline'
      and e ->> 'complianceStatus' = 'Compliant'
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when m.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.name || ' is of ' || a.os_type || ' operating system.'
        when m.id is not null then a.name || ' meet requirements for azure compute security baseline.'
        else a.name || ' does not meet requirements for azure compute security baseline.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join compute_machine as m on m.id = a.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_guest_configuration_with_no_managed_identity" {
  sql = <<-EOQ
    with gc_installed_vm as (
      select
        distinct a.vm_id,
        title
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(extensions) as b
      where
        b ->> 'Publisher' = 'Microsoft.GuestConfiguration'
    )
    select
      a.vm_id as resource,
      case
        when b.vm_id is null then 'skip'
        when b.vm_id is not null and identity ->> 'type' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.vm_id is null then a.title || ' guest configuration extension not installed.'
        when b.vm_id is not null and identity ->> 'type' is not null then a.title || ' guest configuration extension installed with ' || (identity ->> 'type') || ' managed identity.'
        else a.title || ' guest configuration extension not installed with managed identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join gc_installed_vm as b on a.vm_id = b.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

# Non-Config rule query

query "compute_vm_remote_access_restricted" {
  sql = <<-EOQ
    with network_sg as (
      select
        distinct name as sg_name,
        network_interfaces
      from
        azure_network_security_group as nsg,
        jsonb_array_elements(security_rules) as sg,
        jsonb_array_elements_text(sg -> 'properties' -> 'destinationPortRanges' || (sg -> 'properties' -> 'destinationPortRange') :: jsonb) as dport,
        jsonb_array_elements_text(sg -> 'properties' -> 'sourceAddressPrefixes' || (sg -> 'properties' -> 'sourceAddressPrefix') :: jsonb) as sip
      where
        sg -> 'properties' ->> 'access' = 'Allow'
        and sg -> 'properties' ->> 'direction' = 'Inbound'
        and sg -> 'properties' ->> 'protocol' = 'TCP'
        and sip in ('*', '0.0.0.0', '0.0.0.0/0', 'Internet', '<nw>/0', '/0')
        and (
          dport in ('22', '3389', '*')
          or (
            dport like '%-%'
            and (
              (
                split_part(dport, '-', 1) :: integer <= 3389
                and split_part(dport, '-', 2) :: integer >= 3389
              )
              or (
                split_part(dport, '-', 1) :: integer <= 22
                and split_part(dport, '-', 2) :: integer >= 22
              )
            )
          )
        )
    )
    select
      vm.vm_id as resource,
      case
        when sg.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.sg_name is null then vm.title || ' restricts remote access from internet.'
        else vm.title || ' allows remote access from internet.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm
      left join network_sg as sg on sg.network_interfaces @> vm.network_interfaces
      join azure_subscription as sub on sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_utilizing_managed_disk" {
  sql = <<-EOQ
    select
      vm.id as resource,
      case
        when managed_disk_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when managed_disk_id is null then vm.name || ' VM not utilizing managed disks.'
        else vm.name || ' VM utilizing managed disks.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm,
      azure_subscription as sub
    where
      sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_data_and_os_disk_uses_managed_disk" {
  sql = <<-EOQ
    with data_disk_with_no_managed_disk as (
      select
        id as vm_id,
        count(*) as count
      from
        azure_compute_virtual_machine,
        jsonb_array_elements(data_disks) as d
      where
        d -> 'managedDisk' ->> 'id' is null
      group by
        id
    )
    select
      vm.id as resource,
      case
        when managed_disk_id is null and d.count > 0 then 'alarm'
        when managed_disk_id is null then 'alarm'
        when d.count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when managed_disk_id is null and d.count > 0 then vm.name || ' not utilizing managed disks for both data and OS disk.'
        when managed_disk_id is null then vm.name || ' not utilizing managed disks for OS disk.'
        when d.count > 0 then vm.name || ' not utilizing managed disks for data disk.'
        else vm.name || ' utilizing managed disks for both data and OS disk.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "vm.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as vm
      left join data_disk_with_no_managed_disk as d on d.vm_id = vm.id,
      azure_subscription as sub
    where
      sub.subscription_id = vm.subscription_id;
  EOQ
}

query "compute_vm_scale_set_automatic_upgrade_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when upgrade_policy is null then 'skip'
        when upgrade_policy ->> 'mode' = 'Automatic' then 'ok'
        else 'alarm'
      end as status,
      case
        when upgrade_policy is null then a.title || ' upgrade policy not applicable.'
        when upgrade_policy ->> 'mode' = 'Automatic' then a.title || ' automatic update enabled.'
        else a.title || ' automatic update disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine_scale_set as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_scale_set_ssh_key_authentication_linux" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when virtual_machine_storage_profile -> 'osDisk' ->> 'osType' = 'Windows' then 'skip'
        when virtual_machine_os_profile -> 'linuxConfiguration' ->> 'disablePasswordAuthentication' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when virtual_machine_storage_profile -> 'osDisk' ->> 'osType' = 'Windows' then a.title || ' is using windows OS.'
        when virtual_machine_os_profile -> 'linuxConfiguration' ->> 'disablePasswordAuthentication' = 'true' then a.title || ' has SSK key authentication enabled.'
        else a.title || ' has password authentication enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine_scale_set as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_disk_unattached_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      disk.id as resource,
      case
        when managed_by is not null
        or managed_by != ''
        or encryption_type = 'EncryptionAtRestWithCustomerKey'
        or encryption_type = 'EncryptionAtRestWithPlatformAndCustomerKeys'
         then 'ok'
        else 'alarm'
      end as status,
      case
        when managed_by is not null
        or managed_by != ''
        or encryption_type = 'EncryptionAtRestWithCustomerKey'
        or encryption_type = 'EncryptionAtRestWithPlatformAndCustomerKeys'
         then disk.name || ' attached and encrypted with ADE/CMK.'
        else disk.name || ' unattached and encrypted with default encryption key.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "disk.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_disk disk,
      azure_subscription sub
    where
      disk_state != 'Attached'
      and sub.subscription_id = disk.subscription_id;
  EOQ
}

query "compute_vm_scale_set_uses_managed_disks" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when virtual_machine_storage_profile -> 'osDisk' -> 'osType' -> 'vhdContainers' != null then 'ok'
        else 'alarm'
      end as status,
      case
        when virtual_machine_storage_profile -> 'osDisk' -> 'osType' -> 'vhdContainers' != null then a.title || ' utilising managed disks.'
        else a.title || ' not utilising managed disks.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine_scale_set as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "compute_vm_scale_set_boot_diagnostics_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when (virtual_machine_diagnostics_profile -> 'bootDiagnostics' ->> 'enabled') :: boolean then 'ok'
        else 'alarm'
      end as status,
      case
        when (virtual_machine_diagnostics_profile -> 'bootDiagnostics' ->> 'enabled') :: boolean then a.title || ' boot diagnostics enabled.'
        else a.title || ' boot diagnostics disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine_scale_set as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
