locals {
  regulatory_compliance_compute_common_tags = {
    service = "compute"
  }
}

control "compute_os_and_data_disk_encrypted_with_cmk" {
  title       = "Disk encryption should be applied on virtual machines"
  description = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_os_and_data_disk_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_unattached_disk_encrypted_with_cmk" {
  title       = "Unattached disks should be encrypted"
  description = "This policy audits any unattached disk without encryption enabled."
  sql         = query.compute_unattached_disk_encrypted_with_cmk.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_attached_with_network" {
  title       = "Virtual machines should be connected to an approved virtual network"
  description = "This policy audits any virtual machine connected to a virtual network that is not approved."
  sql         = query.compute_vm_attached_with_network.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_adaptive_network_hardening_recommendation_applied" {
  title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
  description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_remote_access_restricted_all_ports" {
  title       = "All network ports should be restricted on network security groups associated to your virtual machine"
  description = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
  sql         = query.compute_vm_remote_access_restricted_all_ports.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_tcp_udp_access_restricted_internet" {
  title       = "Internet-facing virtual machines should be protected with network security groups"
  description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG)."
  sql         = query.compute_vm_tcp_udp_access_restricted_internet.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_jit_access_protected" {
  title       = "Management ports of virtual machines should be protected with just-in-time network access control."
  description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
  sql         = query.compute_vm_jit_access_protected.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed" {
  title       = "The Log Analytics agent should be installed on virtual machines"
  description = "This policy audits any Windows/Linux virtual machines if the Log Analytics agent is not installed."
  sql         = query.compute_vm_log_analytics_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed_windows" {
  title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
  sql         = query.compute_vm_log_analytics_agent_installed_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_installed" {
  title       = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
  description = "This policy deploys a Microsoft IaaSAntimalware extension with a default configuration when a VM is not configured with the antimalware extension."
  sql         = query.compute_vm_malware_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_log_analytics_agent_installed" {
  title       = "The Log Analytics agent should be installed on Virtual Machine Scale Sets"
  description = "This policy audits any Windows/Linux Virtual Machine Scale Sets if the Log Analytics agent is not installed."
  sql         = query.compute_vm_scale_set_log_analytics_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_disaster_recovery_enabled" {
  title       = "Audit virtual machines without disaster recovery configured"
  description = "Audit virtual machines which do not have disaster recovery configured."
  sql         = query.compute_vm_disaster_recovery_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_automatic_upgrade_enabled" {
  title       = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
  description = "This policy audits any Windows virtual machine not configured with automatic update of Microsoft Antimalware protection signatures."
  sql         = query.compute_vm_malware_agent_automatic_upgrade_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_logging_enabled" {
  title       = "Resource logs in Virtual Machine Scale Sets should be enabled"
  description = "It is recommended to enable Logs so that activity trail can be recreated when investigations are required in the event of an incident or a compromise."
  sql         = query.compute_vm_scale_set_logging_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_meet_system_audit_policies_requirement_windows" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'"
  description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies - Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_network_traffic_data_collection_windows_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Windows virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  sql         = query.compute_vm_network_traffic_data_collection_windows_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_network_traffic_data_collection_linux_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Linux virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  sql         = query.compute_vm_network_traffic_data_collection_linux_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_adaptive_application_controls_enabled" {
  title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
  description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your machines should be remediated"
  description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_uses_azure_resource_manager" {
  title       = "Virtual machines should be migrated to new Azure Resource Manager resources"
  description = "Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management."
  sql         = query.compute_vm_uses_azure_resource_manager.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_scale_set_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
  description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_system_updates_installed" {
  title       = "System updates should be installed on your machines"
  description = "Missing security system updates on your servers will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_vm_system_updates_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_no_specified_members_windows" {
  title       = "Audit Windows machines missing any of specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group does not contain one or more members that are listed in the policy parameter."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_specified_members_windows" {
  title       = "Audit Windows machines that have the specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains one or more of the members listed in the policy parameter."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_extra_accounts_windows" {
  title       = "Audit Windows machines that have extra accounts in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains members that are not listed in the policy parameter."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_security_option_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Accounts'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Accounts' for limiting local account use of blank passwords and guest account status. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_with_no_specified_certificates_in_trusted_root_windows" {
  title       = "Audit Windows machines that do not contain the specified certificates in Trusted Root"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine Trusted Root certificate store does not contain one or more of the certificates listed by the policy parameter."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_endpoint_protection_agent_installed" {
  title       = "Monitor missing Endpoint Protection in Azure Security Center"
  description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_firewall_properties_windows" {
  title       = "Windows machines should meet requirements for 'Windows Firewall Properties'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Windows Firewall Properties' for firewall state, connections, rule management, and notifications. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_vulnerability_assessment_solution_enabled" {
  title       = "A vulnerability assessment solution should be enabled on your virtual machines"
  description = "Audits virtual machines to detect whether they are running a supported vulnerability assessment solution. A core component of every cyber risk and security program is the identification and analysis of vulnerabilities. Azure Security Center's standard pricing tier includes vulnerability scanning for your virtual machines at no extra cost. Additionally, Security Center can automatically deploy this tool for you."
  sql         = query.compute_vm_vulnerability_assessment_solution_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
    hipaa_hitrust_v92    = "true"
  })
}

control "compute_vm_azure_defender_enabled" {
  title       = "Azure Defender for servers should be enabled"
  description = "Azure Defender for servers provides real-time threat protection for server workloads and generates hardening recommendations as well as alerts about suspicious activities."
  sql         = query.compute_vm_azure_defender_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity" {
  title       = "Add system-assigned managed identity to enable Guest Configuration assignments on VMs with a user-assigned identity"
  description = "This policy adds a system-assigned managed identity to virtual machines hosted in Azure that are supported by Guest Configuration and have at least one user-assigned identity but do not have a system-assigned managed identity. A system-assigned managed identity is a prerequisite for all Guest Configuration assignments and must be added to machines before using any Guest Configuration policy definitions."
  sql         = query.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_passwords_stored_using_reversible_encryption_windows" {
  title       = "Audit Windows machines that do not store passwords using reversible encryption"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not store passwords using reversible encryption."
  sql         = query.compute_vm_passwords_stored_using_reversible_encryption_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_account_with_password_linux" {
  title       = "Audit Linux machines that have accounts without passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope.  Machines are non-compliant if Linux machines that have accounts without passwords."
  sql         = query.compute_vm_account_with_password_linux.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_ssh_key_authentication_linux" {
  title       = "Authentication to Linux machines should require SSH keys"
  description = "Although SSH itself provides an encrypted connection, using passwords with SSH still leaves the VM vulnerable to brute-force attacks. The most secure option for authenticating to an Azure Linux virtual machine over SSH is with a public-private key pair, also known as SSH keys."
  sql         = query.compute_vm_ssh_key_authentication_linux.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_guest_configuration_installed_linux" {
  title       = "Deploy the Linux Guest Configuration extension to enable Guest Configuration assignments on Linux VMs"
  description = "This policy deploys the Linux Guest Configuration extension to Linux virtual machines hosted in Azure that are supported by Guest Configuration. The Linux Guest Configuration extension is a prerequisite for all Linux Guest Configuration assignments and must be deployed to machines before using any Linux Guest Configuration policy definition."
  sql         = query.compute_vm_guest_configuration_installed_linux.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_guest_configuration_installed" {
  title       = "Guest Configuration extension should be installed on your machines"
  description = "To ensure secure configurations of in-guest settings of your machine, install the Guest Configuration extension. In-guest settings that the extension monitors include the configuration of the operating system, application configuration or presence, and environment settings. Once installed, in-guest policies will be available such as 'Windows Exploit guard should be enabled'."
  sql         = query.compute_vm_guest_configuration_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "arc_compute_machine_linux_log_analytics_agent_installed" {
  title       = "Log Analytics agent should be installed on your Linux Azure Arc machines"
  description = "This policy audits Linux Azure Arc machines if the Log Analytics agent is not installed."
  sql         = query.arc_compute_machine_linux_log_analytics_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_guest_configuration_installed_windows" {
  title       = "Deploy the Windows Guest Configuration extension to enable Guest Configuration assignments on Windows VMs"
  description = "This policy deploys the Windows Guest Configuration extension to Windows virtual machines hosted in Azure that are supported by Guest Configuration. The Windows Guest Configuration extension is a prerequisite for all Windows Guest Configuration assignments and must be deployed to machines before using any Windows Guest Configuration policy definition."
  sql         = query.compute_vm_guest_configuration_installed_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_restrict_previous_24_passwords_resuse_windows" {
  title       = "Audit Windows machines that allow re-use of the previous 24 passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that allow re-use of the previous 24 passwords."
  sql         = query.compute_vm_restrict_previous_24_passwords_resuse_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_max_password_age_70_days_windows" {
  title       = "Audit Windows machines that do not have a maximum password age of 70 days"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have a maximum password age of 70 days."
  sql         = query.compute_vm_max_password_age_70_days_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_min_password_age_1_day_windows" {
  title       = "Audit Windows machines that do not have a minimum password age of 1 day"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have a minimum password age of 1 day."
  sql         = query.compute_vm_min_password_age_1_day_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_password_complexity_setting_enabled_windows" {
  title       = "Audit Windows machines that do not have the password complexity setting enabled"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not have the password complexity setting enabled."
  sql         = query.compute_vm_password_complexity_setting_enabled_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_min_password_length_14_windows" {
  title       = "Audit Windows machines that do not restrict the minimum password length to 14 characters"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Windows machines that do not restrict the minimum password length to 14 characters."
  sql         = query.compute_vm_min_password_length_14_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_disk_access_uses_private_link" {
  title       = "Disk access resources should use private link"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to diskAccesses, data leakage risks are reduced."
  sql         = query.compute_disk_access_uses_private_link.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "network_interface_ip_forwarding_disabled" {
  title       = "IP Forwarding on your virtual machine should be disabled"
  description = "Enabling IP forwarding on a virtual machine's NIC allows the machine to receive traffic addressed to other destinations. IP forwarding is rarely required (e.g., when using the VM as a network virtual appliance), and therefore, this should be reviewed by the network security team."
  sql         = query.network_interface_ip_forwarding_disabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "arc_compute_machine_windows_log_analytics_agent_installed" {
  title       = "Log Analytics agent should be installed on your Windows Azure Arc machines"
  description = "This policy audits Windows Azure Arc machines if the Log Analytics agent is not installed."
  sql         = query.arc_compute_machine_windows_log_analytics_agent_installed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_guest_configuration_with_system_assigned_managed_identity" {
  title       = "Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity"
  description = "The Guest Configuration extension requires a system assigned managed identity. Azure virtual machines in the scope of this policy will be non-compliant when they have the Guest Configuration extension installed but do not have a system assigned managed identity."
  sql         = query.compute_vm_guest_configuration_with_system_assigned_managed_identity.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_windows_defender_exploit_guard_enabled" {
  title       = "Windows Defender Exploit Guard should be enabled on your machines"
  description = "Windows Defender Exploit Guard uses the Azure Policy Guest Configuration agent. Exploit Guard has four components that are designed to lock down devices against a wide variety of attack vectors and block behaviors commonly used in malware attacks while enabling enterprises to balance their security risk and productivity requirements (Windows only)."
  sql         = query.compute_vm_windows_defender_exploit_guard_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_secure_communication_protocols_configured" {
  title       = "Windows web servers should be configured to use secure communication protocols"
  description = "To protect the privacy of information communicated over the Internet, your web servers should use the latest version of the industry-standard cryptographic protocol, Transport Layer Security (TLS). TLS secures communications over a network by using security certificates to encrypt a connection between machines."
  sql         = query.compute_vm_secure_communication_protocols_configured.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_restrict_remote_connection_from_accounts_without_password_linux" {
  title       = "Audit Linux machines that allow remote connections from accounts without passwords"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Linux machines that allow remote connections from accounts without passwords."
  sql         = query.compute_vm_restrict_remote_connection_from_accounts_without_password_linux.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}


control "compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed" {
  title       = "Managed disks should be double encrypted with both platform-managed and customer-managed keys"
  description = "High security sensitive customers who are concerned of the risk associated with any particular encryption algorithm, implementation, or key being compromised can opt for additional layer of encryption using a different encryption algorithm/mode at the infrastructure layer using platform managed encryption keys. The disk encryption sets are required to use double encryption."
  sql         = query.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_and_sacle_set_encryption_at_host_enabled" {
  title       = "Virtual machines and virtual machine scale sets should have encryption at host enabled"
  description = "Use encryption at host to get end-to-end encryption for your virtual machine and virtual machine scale set data. Encryption at host enables encryption at rest for your temporary disk and OS/data disk caches. Temporary and ephemeral OS disks are encrypted with platform-managed keys when encryption at host is enabled. OS/data disk caches are encrypted at rest with either customer-managed or platform-managed key, depending on the encryption type selected on the disk."
  sql         = query.compute_vm_and_sacle_set_encryption_at_host_enabled.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_allowlist_rules_in_adaptive_application_control_policy_updated" {
  title       = "Allowlist rules in your adaptive application control policy should be updated"
  description = "Monitor for changes in behavior on groups of machines configured for auditing by Azure Security Center's adaptive application controls. Security Center uses machine learning to analyze the running processes on your machines and suggest a list of known-safe applications. These are presented as recommended apps to allow in adaptive application control policies."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_scale_set_endpoint_protection_solution_installed" {
  title       = "Endpoint protection solution should be installed on virtual machine scale sets"
  description = "Audit the existence and health of an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_monitor_missing_endpoint_protection_in_asc" {
  title       = "Monitor missing Endpoint Protection in Azure Security Center"
  description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_non_internet_facing_protected_with_nsg" {
  title       = "Non-internet-facing virtual machines should be protected with network security groups"
  description = "Protect your non-internet-facing virtual machines from potential threats by restricting access with network security groups (NSG)."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_password_file_permissions_0644_linux" {
  title       = "Audit Linux machines that do not have the passwd file permissions set to 0644"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if Linux machines that do not have the passwd file permissions set to 0644"
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_temp_disks_cache_and_data_flows_encrypted" {
  title       = "Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources"
  description = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_container_security_configurations_vulnerabilities_remediated" {
  title       = "Vulnerabilities in container security configurations should be remediate"
  description = "Audit vulnerabilities in security configuration on machines with Docker installed and display as recommendations in Azure Security Center."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_meet_security_baseline_requirements_linux" {
  title       = "Linux machines should meet requirements for the Azure compute security baseline"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine is not configured correctly for one of the recommendations in the Azure compute security baseline."
  sql         = query.compute_vm_meet_security_baseline_requirements_linux.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_meet_security_baseline_requirements_windows" {
  title       = "Windows machines should meet requirements of the Azure compute security baseline"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine is not configured correctly for one of the recommendations in the Azure compute security baseline."
  sql         = query.compute_vm_meet_security_baseline_requirements_windows.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_vulnerability_findings_resolved_for_sql_server" {
  title       = "SQL servers on machines should have vulnerability findings resolved"
  description = "SQL vulnerability assessment scans your database for security vulnerabilities, and exposes any deviations from best practices such as misconfigurations, excessive permissions, and unprotected sensitive data. Resolving the vulnerabilities found can greatly improve your database security posture."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "compute_vm_log_analytics_agent_health_issues_resolved" {
  title       = "Log Analytics agent health issues should be resolved on your machines"
  description = "Security Center uses the Log Analytics agent, formerly known as the Microsoft Monitoring Agent (MMA). To make sure your virtual machines are successfully monitored, you need to make sure the agent is installed on the virtual machines and properly collects security events to the configured workspace."
  sql         = query.manual_control.sql

  tags = merge(local.regulatory_compliance_compute_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
