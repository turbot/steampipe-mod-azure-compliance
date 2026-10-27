
benchmark "pci_dss_v401_requirement_5" {
  title       = "5 - Protect All Systems and Networks from Malicious Software"

  description = <<-MARKDOWN
    Malicious software (malware) is software or firmware designed to infiltrate or damage a computer system without the owner's knowledge or
    consent, with the intent of compromising the confidentiality, integrity, or availability of the owner’s data, applications, or operating system.

    Examples include viruses, worms, Trojans, spyware, ransomware, keyloggers, rootkits, malicious code, scripts, and links.

    Malware can enter the network during many business-approved activities, including employee e-mail (for example, via phishing) and use of the
    Internet, mobile computers, and storage devices, resulting in the exploitation of system vulnerabilities.

    Using anti-malware solutions that address all types of malware helps to protect systems from current and evolving malware threats.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_5_2,
    benchmark.pci_dss_v401_requirement_5_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_2" {
  title       = "5.2 - Malicious software (malware) is prevented, or detected and addressed."

  children = [
    benchmark.pci_dss_v401_requirement_5_2_1,
    benchmark.pci_dss_v401_requirement_5_2_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_2_1" {
  title       = "5.2.1 - An anti-malware solution(s) is deployed on all system components, except for those system components identified in periodic evaluations per Requirement 5.2.3 that concludes the system components are not at risk from malware."

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Microsoft Defender for SQL should be enabled for unprotected SQL Managed Instances
    control.securitycenter_azure_defender_on_for_sqlservervm,

    # All advanced threat protection types should be enabled in SQL server advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings,

    # Microsoft Defender for Resource Manager should be enabled
    control.securitycenter_azure_defender_on_for_resource_manager,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # All advanced threat protection types should be enabled in SQL managed instance advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Deploy default Microsoft IaaSAntimalware extension for Windows Server
    control.compute_vm_malware_agent_installed,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # Microsoft IaaSAntimalware extension should be deployed on Windows servers
    # control.compute_vm_malware_agent_installed,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Microsoft Defender for Azure SQL Database servers should be enabled
    control.securitycenter_azure_defender_on_for_sqldb,

    # Azure Kubernetes Service clusters should have Defender profile enabled
    control.azure_kubernetes_service_clusters_should_have_defender_profile_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for App Service should be enabled
    control.securitycenter_azure_defender_on_for_appservice,

    # EDR solution should be installed on Virtual Machines
    control.edr_solution_should_be_installed_on_virtual_machines,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_2_2" {
  title       = "5.2.2 - The deployed anti-malware solution(s) detects all known types of malware and removes, blocks, or contains all known types of malware."

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Microsoft Defender for SQL should be enabled for unprotected SQL Managed Instances
    control.securitycenter_azure_defender_on_for_sqlservervm,

    # All advanced threat protection types should be enabled in SQL server advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings,

    # Microsoft Defender for Resource Manager should be enabled
    control.securitycenter_azure_defender_on_for_resource_manager,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # All advanced threat protection types should be enabled in SQL managed instance advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Deploy default Microsoft IaaSAntimalware extension for Windows Server
    control.compute_vm_malware_agent_installed,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # Microsoft IaaSAntimalware extension should be deployed on Windows servers
    # control.compute_vm_malware_agent_installed,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Microsoft Defender for Azure SQL Database servers should be enabled
    control.securitycenter_azure_defender_on_for_sqldb,

    # Azure Kubernetes Service clusters should have Defender profile enabled
    control.azure_kubernetes_service_clusters_should_have_defender_profile_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for App Service should be enabled
    control.securitycenter_azure_defender_on_for_appservice,

    # EDR solution should be installed on Virtual Machines
    control.edr_solution_should_be_installed_on_virtual_machines,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_3" {
  title       = "5.3 - Anti-malware mechanisms and processes are active, maintained, and monitored."

  children = [
    benchmark.pci_dss_v401_requirement_5_3_1,
    benchmark.pci_dss_v401_requirement_5_3_3,
    benchmark.pci_dss_v401_requirement_5_3_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_3_1" {
  title       = "5.3.1 - The anti-malware solution(s) is kept current via automatic updates."

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Microsoft Defender for SQL should be enabled for unprotected SQL Managed Instances
    control.securitycenter_azure_defender_on_for_sqlservervm,

    # All advanced threat protection types should be enabled in SQL server advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings,

    # Microsoft Defender for Resource Manager should be enabled
    control.securitycenter_azure_defender_on_for_resource_manager,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # All advanced threat protection types should be enabled in SQL managed instance advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Deploy default Microsoft IaaSAntimalware extension for Windows Server
    control.compute_vm_malware_agent_installed,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # Microsoft IaaSAntimalware extension should be deployed on Windows servers
    # control.compute_vm_malware_agent_installed,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Microsoft Defender for Azure SQL Database servers should be enabled
    control.securitycenter_azure_defender_on_for_sqldb,

    # Azure Kubernetes Service clusters should have Defender profile enabled
    control.azure_kubernetes_service_clusters_should_have_defender_profile_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for App Service should be enabled
    control.securitycenter_azure_defender_on_for_appservice,

    # EDR solution should be installed on Virtual Machines
    control.edr_solution_should_be_installed_on_virtual_machines,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_3_3" {
  title       = "5.3.3 - For removable electronic media, the antimalware solution(s) performs scans or behavioral analysis."

  description = <<-MARKDOWN
    For removable electronic media, the antimalware solution(s):

    * Performs automatic scans of when the media is inserted, connected, or logically mounted,

    OR

    * Performs continuous behavioral analysis of systems or processes when the media is inserted, connected, or logically mounted.
  MARKDOWN

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Microsoft Defender for SQL should be enabled for unprotected SQL Managed Instances
    control.securitycenter_azure_defender_on_for_sqlservervm,

    # All advanced threat protection types should be enabled in SQL server advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings,

    # Microsoft Defender for Resource Manager should be enabled
    control.securitycenter_azure_defender_on_for_resource_manager,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # All advanced threat protection types should be enabled in SQL managed instance advanced data security settings
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Deploy default Microsoft IaaSAntimalware extension for Windows Server
    control.compute_vm_malware_agent_installed,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # Microsoft IaaSAntimalware extension should be deployed on Windows servers
    # control.compute_vm_malware_agent_installed,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Microsoft Defender for Azure SQL Database servers should be enabled
    control.securitycenter_azure_defender_on_for_sqldb,

    # Azure Kubernetes Service clusters should have Defender profile enabled
    control.azure_kubernetes_service_clusters_should_have_defender_profile_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for App Service should be enabled
    control.securitycenter_azure_defender_on_for_appservice,

    # EDR solution should be installed on Virtual Machines
    control.edr_solution_should_be_installed_on_virtual_machines,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_5_3_4" {
  title       = "5.3.4 - Audit logs for the anti-malware solution(s) are enabled and retained in accordance with Requirement 10.5.1."

  children = [
    # Activity log should be retained for at least one year
    control.activity_log_should_be_retained_for_at_least_one_year,
  ]

  tags = local.pci_dss_v401_common_tags
}
