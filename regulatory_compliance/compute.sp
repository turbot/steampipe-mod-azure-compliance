locals {
  conformance_pack_compute_common_tags = {
    service = "compute"
  }
}

control "compute_os_and_data_disk_encrypted_with_cmk" {
  title       = "Disk encryption should be applied on virtual machines"
  description = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_os_and_data_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_unattached_disk_encrypted_with_cmk" {
  title       = "Unattached disks should be encrypted"
  description = "This policy audits any unattached disk without encryption enabled."
  sql         = query.compute_unattached_disk_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_attached_with_network" {
  title       = "Virtual machines should be connected to an approved virtual network"
  description = "This policy audits any virtual machine connected to a virtual network that is not approved."
  sql         = query.compute_vm_attached_with_network.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_adaptive_network_hardening_recommendation_applied" {
  title       = "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
  description = "Azure Security Center analyzes the traffic patterns of Internet facing virtual machines and provides Network Security Group rule recommendations that reduce the potential attack surface. Note: It uses a machine learning algorithm that factors in actual traffic, known trusted configuration, threat intelligence, and other indicators of compromise, and then provides recommendations to allow traffic only from specific IP/port tuples."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_remote_access_restricted_all_ports" {
  title       = "All network ports should be restricted on network security groups associated to your virtual machine"
  description = "Azure Security Center has identified some of your network security groups' inbound rules to be too permissive. Inbound rules should not allow access from 'Any' or 'Internet' ranges. This can potentially enable attackers to target your resources."
  sql         = query.compute_vm_remote_access_restricted_all_ports.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_tcp_udp_access_restricted_internet" {
  title       = "Internet-facing virtual machines should be protected with network security groups"
  description = "Protect your virtual machines from potential threats by restricting access to them with network security groups (NSG)."
  sql         = query.compute_vm_tcp_udp_access_restricted_internet.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_jit_access_protected" {
  title       = "Management ports of virtual machines should be protected with just-in-time network access control."
  description = "Possible network Just In Time (JIT) access will be monitored by Azure Security Center as recommendations"
  sql         = query.compute_vm_jit_access_protected.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed" {
  title       = "The Log Analytics agent should be installed on virtual machines"
  description = "This policy audits any Windows/Linux virtual machines if the Log Analytics agent is not installed."
  sql         = query.compute_vm_log_analytics_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_log_analytics_agent_installed_windows" {
  title       = "Audit Windows machines on which the Log Analytics agent is not connected as expected"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the agent is not installed, or if it is installed but the COM object AgentConfigManager.MgmtSvcCfg returns that it is registered to a workspace other than the ID specified in the policy parameter."
  sql         = query.compute_vm_log_analytics_agent_installed_windows.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_installed" {
  title       = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
  description = "This policy deploys a Microsoft IaaSAntimalware extension with a default configuration when a VM is not configured with the antimalware extension."
  sql         = query.compute_vm_malware_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_log_analytics_agent_installed" {
  title       = "The Log Analytics agent should be installed on Virtual Machine Scale Sets"
  description = "This policy audits any Windows/Linux Virtual Machine Scale Sets if the Log Analytics agent is not installed."
  sql         = query.compute_vm_scale_set_log_analytics_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_disaster_recovery_enabled" {
  title       = "Audit virtual machines without disaster recovery configured"
  description = "Audit virtual machines which do not have disaster recovery configured."
  sql         = query.compute_vm_disaster_recovery_enabled.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_malware_agent_automatic_upgrade_enabled" {
  title       = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
  description = "This policy audits any Windows virtual machine not configured with automatic update of Microsoft Antimalware protection signatures."
  sql         = query.compute_vm_malware_agent_automatic_upgrade_enabled.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_logging_enabled" {
  title       = "Resource logs in Virtual Machine Scale Sets should be enabled"
  description = "It is recommended to enable Logs so that activity trail can be recreated when investigations are required in the event of an incident or a compromise."
  sql         = query.compute_vm_scale_set_logging_enabled.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_system_audit_policies_requirement_windows" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'"
  description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies - Detailed Tracking' for auditing DPAPI, process creation/termination, RPC events, and PNP activity. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. Note: This requires manual configurations in VM as prerequisites, for the time being there are no direct way to extract multiple information as defined in the policy except the GuestConfiguration setting in VM extension."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_network_traffic_data_collection_windows_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Windows virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  sql         = query.compute_vm_network_traffic_data_collection_windows_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_network_traffic_data_collection_linux_agent_installed" {
  title       = "Network traffic data collection agent should be installed on Linux virtual machines"
  description = "Security Center uses the Microsoft Dependency agent to collect network traffic data from your Azure virtual machines to enable advanced network protection features such as traffic visualization on the network map, network hardening recommendations and specific network threats."
  sql         = query.compute_vm_network_traffic_data_collection_linux_agent_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_adaptive_application_controls_enabled" {
  title       = "Adaptive application controls for defining safe applications should be enabled on your machines"
  description = "Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Security Center uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your machines should be remediated"
  description = "Servers which do not satisfy the configured baseline will be monitored by Azure Security Center as recommendations. Note: There are no defined list of checks available for this policy, Azure ASC has the special privilege to inspect respective attributes by its own mechanism."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_uses_azure_resource_manager" {
  title       = "Virtual machines should be migrated to new Azure Resource Manager resources"
  description = "Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management."
  sql         = query.compute_vm_uses_azure_resource_manager.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_scale_set_security_configuration_vulnerabilities_remediated" {
  title       = "Vulnerabilities in security configuration on your virtual machine scale sets should be remediated"
  description = "Audit the OS vulnerabilities on your virtual machine scale sets to protect them from attacks. Note: Azure Security Control (ASC) uses pattern based finding from the logging events and initiate corrective actions to remediate."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_system_updates_installed" {
  title       = "System updates should be installed on your machines"
  description = "Missing security system updates on your servers will be monitored by Azure Security Center as recommendations."
  sql         = query.compute_vm_system_updates_installed.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_no_specified_members_windows" {
  title       = "Audit Windows machines missing any of specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group does not contain one or more members that are listed in the policy parameter. Note: This control requires parameter to be specified."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_specified_members_windows" {
  title       = "Audit Windows machines that have the specified members in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains one or more of the members listed in the policy parameter. Note: This control requires parameter to be specified."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_administrators_group_with_extra_accounts_windows" {
  title       = "Audit Windows machines that have extra accounts in the Administrators group"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the local Administrators group contains members that are not listed in the policy parameter. Note: This control requires parameter to be specified."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_security_option_requirement_windows" {
  title       = "Windows machines should meet requirements for 'Security Options - Accounts'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Options - Accounts' for limiting local account use of blank passwords and guest account status. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_with_no_specified_certificates_in_trusted_root_windows" {
  title       = "Audit Windows machines that do not contain the specified certificates in Trusted Root"
  description = "Requires that prerequisites are deployed to the policy assignment scope. Machines are non-compliant if the machine Trusted Root certificate store does not contain one or more of the certificates listed by clearthe policy parameter. Note: This control requires parameter to be specified."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_endpoint_protection_agent_installed" {
  title       = "Monitor missing Endpoint Protection in Azure Security Center"
  description = "Servers without an installed Endpoint Protection agent will be monitored by Azure Security Center as recommendations."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_meet_firewall_properties_windows" {
  title       = "Windows machines should meet requirements for 'Windows Firewall Properties'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Windows Firewall Properties' for firewall state, connections, rule management, and notifications. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "compute_vm_vulnerability_assessment_solution_enabled" {
  title       = "A vulnerability assessment solution should be enabled on your virtual machines"
  description = "Audits virtual machines to detect whether they are running a supported vulnerability assessment solution. A core component of every cyber risk and security program is the identification and analysis of vulnerabilities. Azure Security Center's standard pricing tier includes vulnerability scanning for your virtual machines at no extra cost. Additionally, Security Center can automatically deploy this tool for you."
  sql         = query.compute_vm_vulnerability_assessment_solution_enabled.sql

  tags = merge(local.conformance_pack_compute_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

