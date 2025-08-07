
benchmark "pci_dss_v401_requirement_11" {
  title       = "11 - Test Security Systems and Processes Regularly"

  description = <<-MARKDOWN
    Vulnerabilities are being discovered continually by malicious individuals and researchers, as well as being introduced by new software. System
    components, processes, and bespoke and custom software should be tested frequently to ensure security controls continue to reflect a
    changing environment.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_11_3,
    benchmark.pci_dss_v401_requirement_11_4,
    benchmark.pci_dss_v401_requirement_11_5,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_3" {
  title       = "11.3 - External and internal vulnerabilities are regularly identified, prioritized, and addressed."

  children = [
    benchmark.pci_dss_v401_requirement_11_3_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_3_1" {
  title       = "11.3.1 - Internal vulnerability scans are performed."

  description = <<-MARKDOWN
    Internal vulnerability scans are performed as follows:

    * At least once every three months.
    * Vulnerabilities that are either high-risk or critical (according to the entity's vulnerability risk
      rankings defined at Requirement 6.3.1) are resolved.
    * Rescans are performed that confirm all high-risk and all critical vulnerabilities (as noted above)
      have been resolved.
    * Scan tool is kept up to date with latest vulnerability information.
    * Scans are performed by qualified personnel and organizational independence of the tester exists.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_11_3_1_1,
    benchmark.pci_dss_v401_requirement_11_3_1_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_3_1_1" {
  title       = "11.3.1.1 - All other applicable vulnerabilities (those not ranked as high-risk vulnerabilities or critical vulnerabilities according to the entity's vulnerability risk rankings defined at Requirement 6.3.1) are managed."

  description = <<-MARKDOWN
    All other applicable vulnerabilities (those not ranked as high-risk vulnerabilities or critical vulnerabilities according to the entity's vulnerability
    risk rankings defined at Requirement 6.3.1) are managed as follows:

    * Addressed based on the risk defined in the entity's targeted risk analysis, which is performed according to all elements specified
      in Requirement 12.3.1.
    * Rescans are conducted as needed.
  MARKDOWN

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Machines should have a vulnerability assessment solution
    control.machines_should_have_a_vulnerability_assessment_solution,

    # SQL servers on machines should have vulnerability findings resolved
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,

    # GitHub repositories should have code scanning enabled
    control.github_repositories_should_have_code_scanning_enabled,

    # GitHub repositories should have dependency vulnerability scanning findings resolved
    control.github_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # GitHub repositories should have secret scanning enabled
    control.github_repositories_should_have_secret_scanning_enabled,

    # Azure DevOps repositories should have code scanning findings resolved
    control.azure_devops_repositories_should_have_code_scanning_findings_resolved,

    # Code repositories should have code scanning findings resolved
    control.code_repositories_should_have_code_scanning_findings_resolved,

    # Azure running container images should have vulnerabilities resolved
    control.azure_running_container_images_should_have_vulnerabilities_resolved,

    # SQL managed instances should have vulnerability assessment configured
    control.mssql_managed_instance_vulnerability_assessment_enabled,

    # Python should be updated to the latest version for API apps
    control.python_should_be_updated_to_the_latest_version_for_api_apps,

    # Azure registry container images should have vulnerabilities resolved
    control.container_registry_vulnerabilities_remediated,

    # Azure DevOps repositories should have secrets scanning findings resolved
    control.azure_devops_repositories_should_have_secrets_scanning_findings_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # GitHub repositories should have infrastructure as code scanning findings resolved
    control.github_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Function apps should have vulnerability findings resolved
    control.function_apps_should_have_vulnerability_findings_resolved,

    # Azure DevOps security posture management findings should be resolved
    control.azure_devops_security_posture_management_findings_should_be_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # GitHub repositories should have secrets scanning findings resolved
    control.github_repositories_should_have_secrets_scanning_findings_resolved,

    # GitHub repositories should have code scanning findings resolved
    control.github_repositories_should_have_code_scanning_findings_resolved,

    # Code repositories should have dependency vulnerability scanning findings resolved
    control.code_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # Azure Resource Manager deployments should have secrets findings resolved
    control.azure_resource_manager_deployments_should_have_secrets_findings_resolved,

    # Azure DevOps repositories should have infrastructure as code scanning findings resolved
    control.azure_devops_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Code repositories should have secrets scanning findings resolved
    control.code_repositories_should_have_secrets_scanning_findings_resolved,

    # Servers onboarded with MDE should have vulnerability findings resolved
    control.servers_onboarded_with_mde_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Machines should have secrets findings resolved
    control.machines_should_have_secrets_findings_resolved,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Guest Attestation extension should be installed on supported Windows virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_3_1_2" {
  title       = "11.3.1.2 - Internal vulnerability scans are performed via authenticated scanning."

  description = <<-MARKDOWN
    Internal vulnerability scans are performed via authenticated scanning as follows:

    * Systems that are unable to accept credentials for authenticated scanning are documented.
    * Sufficient privileges are used for those systems that accept credentials for scanning.
    * If accounts used for authenticated scanning can be used for interactive login, they are managed
      in accordance with Requirement 8.2.2.
  MARKDOWN

  children = [
    # Container with privilege escalation should be avoided
    control.kubernetes_cluster_container_privilege_escalation_restricted,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_4" {
  title       = "11.4 - External and internal penetration testing is regularly performed, and exploitable vulnerabilities and security weaknesses are corrected."

  children = [
    benchmark.pci_dss_v401_requirement_11_4_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_4_4" {
  title       = "11.4.4 - Exploitable vulnerabilities and security weaknesses found during penetration testing are corrected."

  description = <<-MARKDOWN
    Exploitable vulnerabilities and security weaknesses found during penetration testing are corrected as follows:

    * In accordance with the entity's assessment of the risk posed by the security issue as defined in Requirement 6.3.1.
    * Penetration testing is repeated to verify the corrections.
  MARKDOWN

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Machines should have a vulnerability assessment solution
    control.machines_should_have_a_vulnerability_assessment_solution,

    # SQL servers on machines should have vulnerability findings resolved
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,

    # GitHub repositories should have code scanning enabled
    control.github_repositories_should_have_code_scanning_enabled,

    # GitHub repositories should have dependency vulnerability scanning findings resolved
    control.github_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # GitHub repositories should have secret scanning enabled
    control.github_repositories_should_have_secret_scanning_enabled,

    # Azure DevOps repositories should have code scanning findings resolved
    control.azure_devops_repositories_should_have_code_scanning_findings_resolved,

    # Code repositories should have code scanning findings resolved
    control.code_repositories_should_have_code_scanning_findings_resolved,

    # Azure running container images should have vulnerabilities resolved
    control.azure_running_container_images_should_have_vulnerabilities_resolved,

    # SQL managed instances should have vulnerability assessment configured
    control.mssql_managed_instance_vulnerability_assessment_enabled,

    # Python should be updated to the latest version for API apps
    control.python_should_be_updated_to_the_latest_version_for_api_apps,

    # Azure registry container images should have vulnerabilities resolved
    control.container_registry_vulnerabilities_remediated,

    # Azure DevOps repositories should have secrets scanning findings resolved
    control.azure_devops_repositories_should_have_secrets_scanning_findings_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # GitHub repositories should have infrastructure as code scanning findings resolved
    control.github_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Function apps should have vulnerability findings resolved
    control.function_apps_should_have_vulnerability_findings_resolved,

    # Azure DevOps security posture management findings should be resolved
    control.azure_devops_security_posture_management_findings_should_be_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # GitHub repositories should have secrets scanning findings resolved
    control.github_repositories_should_have_secrets_scanning_findings_resolved,

    # GitHub repositories should have code scanning findings resolved
    control.github_repositories_should_have_code_scanning_findings_resolved,

    # Code repositories should have dependency vulnerability scanning findings resolved
    control.code_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # Azure Resource Manager deployments should have secrets findings resolved
    control.azure_resource_manager_deployments_should_have_secrets_findings_resolved,

    # Azure DevOps repositories should have infrastructure as code scanning findings resolved
    control.azure_devops_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Code repositories should have secrets scanning findings resolved
    control.code_repositories_should_have_secrets_scanning_findings_resolved,

    # Servers onboarded with MDE should have vulnerability findings resolved
    control.servers_onboarded_with_mde_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Machines should have secrets findings resolved
    control.machines_should_have_secrets_findings_resolved,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,

    # Guest Attestation extension should be installed on supported Windows virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_5" {
  title       = "11.5 - Network intrusions and unexpected file changes are detected and responded to."

  children = [
    benchmark.pci_dss_v401_requirement_11_5_1,
    benchmark.pci_dss_v401_requirement_11_5_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_5_1" {
  title       = "11.5.1 - Intrusion-detection and/or intrusionprevention techniques are used to detect and/or prevent intrusions into the network."

  description = <<-MARKDOWN
    Intrusion-detection and/or intrusionprevention techniques are used to detect and/or prevent intrusions into the network as follows:

    * All traffic is monitored at the perimeter of the CDE.
    * All traffic is monitored at critical points in the CDE.
    * Personnel are alerted to suspected compromises.
    * All intrusion-detection and prevention engines, baselines, and signatures are kept up to date.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_11_5_1_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_5_1_1" {
  title       = "11.5.1.1 - Additional requirement for service providers only: Intrusion-detection and/or intrusion-prevention techniques detect, alert on/prevent, and address covert malware communication channels."

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Guest Configuration extension should be installed on machines
    control.compute_vm_guest_configuration_installed,

    # Email notification for high severity alerts should be enabled
    control.securitycenter_notify_alerts_configured,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Flow logs should be configured for every network security group
    control.network_sg_flowlog_enabled,

    # An activity log alert should exist for specific Security operations
    control.an_activity_log_alert_should_exist_for_specific_security_operations,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # Audit VMs that do not use managed disks
    control.audit_vms_that_do_not_use_managed_disks,
    control.compute_vm_utilizing_managed_disk,

    # Microsoft Defender for APIs should be enabled
    control.microsoft_defender_for_apis_should_be_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Azure API Management APIs should be onboarded to Defender for APIs
    control.azure_api_management_apis_should_be_onboarded_to_defender_for_apis,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_11_5_2" {
  title       = "11.5.2 - A change-detection mechanism (for example, file integrity monitoring tools) is deployed."

  description = <<-MARKDOWN
    A change-detection mechanism (for example, file integrity monitoring tools) is deployed as follows:

    * To alert personnel to unauthorized modification (including changes, additions, and deletions) of critical files.
    * To perform critical file comparisons at least once weekly.
  MARKDOWN

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Email notification for high severity alerts should be enabled
    control.securitycenter_notify_alerts_configured,

    # Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'
    control.monitor_log_profile_enabled_for_all_categories,

    # Azure Monitor solution 'Security and Audit' must be deployed
    control.azure_monitor_solution_security_and_audit_must_be_deployed,

    # Flow logs should be configured for every network security group
    control.network_sg_flowlog_enabled,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # Azure Monitor Logs for Application Insights should be linked to a Log Analytics workspace
    control.application_insights_linked_to_log_analytics_workspace,

    # Linux virtual machines should enforce kernel module signature validation
    control.linux_virtual_machines_should_enforce_kernel_module_signature_validation,

    # EDR configuration issues should be resolved on virtual machines
    control.edr_configuration_issues_should_be_resolved_on_virtual_machines,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Virtual machines guest attestation status should be healthy
    control.virtual_machines_guest_attestation_status_should_be_healthy,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # Guest Attestation extension should be installed on supported Linux virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machine_scale_sets,

    # Microsoft Defender for APIs should be enabled
    control.microsoft_defender_for_apis_should_be_enabled,

    # Guest Attestation extension should be installed on supported Windows virtual machines
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines,

    # Containers should only use allowed AppArmor profiles
    control.kubernetes_cluster_container_use_allowed_apparmor_profile,

    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,

    # Azure Local machines should meet Secured-core requirements
    control.azure_local_machines_should_meet_secured_core_requirements,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Secure Boot should be enabled on supported Windows virtual machines
    control.compute_windows_vm_secure_boot_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Code repositories should have infrastructure as code scanning findings resolved
    control.code_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Immutable (read-only) root filesystem should be enforced for containers
    control.kubernetes_cluster_container_with_read_only_root_file_system,

    # Azure API Management APIs should be onboarded to Defender for APIs
    control.azure_api_management_apis_should_be_onboarded_to_defender_for_apis,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # Java should be updated to the latest version for API apps
    control.appservice_web_app_latest_java_version,

    # Linux virtual machines should use Secure Boot
    control.linux_virtual_machines_should_use_secure_boot,

    # Guest Attestation extension should be installed on supported Windows virtual machine scale sets
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets,
  ]

  tags = local.pci_dss_v401_common_tags
}
