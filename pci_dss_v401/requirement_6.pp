
benchmark "pci_dss_v401_requirement_6" {
  title       = "6 - Develop and Maintain Secure Systems and Software"

  description = <<-MARKDOWN
    Actors with bad intentions can use security vulnerabilities to gain privileged access to systems. Many of these vulnerabilities are fixed by vendor
    provided security patches, which must be installed by the entities that manage the systems. All system components must have all appropriate
    software patches to protect against the exploitation and compromise of account data by malicious individuals and malicious software.

    Appropriate software patches are those patches that have been evaluated and tested sufficiently to determine that the patches do not conflict
    with existing security configurations. For bespoke and custom software, numerous vulnerabilities can be avoided by applying software lifecycle
    (SLC) processes and secure coding techniques.

    Code repositories that store application code, system configurations, or other configuration data that can impact the security of cardholder data
    and/or sensitive authentication data are in scope for PCI DSS assessments.

    See Relationship between PCI DSS and PCI SSC Software Standards on page 7 for information about the use of PCI SSC-validated software
    and software vendors, and how use of PCI SSC’s software standards may help with meeting controls in Requirement 6.

    Refer to Appendix G for definitions of PCI DSS terms.

    Note: Requirement 6 applies to all system components, except for section 6.2 for developing software securely, which applies only to bespoke
    and custom software used on any system component included in or connected to the CDE.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_6_3,
    benchmark.pci_dss_v401_requirement_6_4,
    benchmark.pci_dss_v401_requirement_6_5,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_3" {
  title       = "6.3 - Security vulnerabilities are identified and addressed."

  children = [
    benchmark.pci_dss_v401_requirement_6_3_1,
    benchmark.pci_dss_v401_requirement_6_3_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_3_1" {
  title       = "6.3.1 - Security vulnerabilities are identified and managed."

  description = <<-MARKDOWN
    Security vulnerabilities are identified and managed as follows:

    * New security vulnerabilities are identified using industry-recognized sources for security vulnerability information, including alerts
      from international and national computer emergency response teams (CERTs).
    * Vulnerabilities are assigned a risk ranking based on industry best practices and consideration of potential impact.
    * Risk rankings identify, at a minimum, all vulnerabilities considered to be a high-risk or critical to the environment.
    * Vulnerabilities for bespoke and custom, and third-party software (for example operating systems and databases) are covered.
  MARKDOWN

  children = [
    # SQL managed instances should have vulnerability assessment configured
    control.mssql_managed_instance_vulnerability_assessment_enabled,

    # SQL servers should have vulnerability assessment configured
    control.sql_server_and_databases_va_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_3_3" {
  title       = "6.3.3 - All system components are protected from known vulnerabilities by installing applicable security patches/updates."

  description = <<-MARKDOWN
    All system components are protected from known vulnerabilities by installing applicable security patches/updates as follows:

    * Patches/updates for critical vulnerabilities (identified according to the risk ranking process at Requirement 6.3.1) are installed within
      one month of release.
    * All other applicable security patches/updates are installed within an appropriate time frame as determined by the entity’s assessment of the
      criticality of the risk to the environment as identified according to the risk ranking process at Requirement 6.3.1.
  MARKDOWN

  children = [
    # Machines should be configured to periodically check for missing system updates
    control.machines_should_be_configured_to_periodically_check_for_missing_system_updates,

    # Audit virtual machines without disaster recovery configured
    control.compute_vm_disaster_recovery_enabled,

    # Dependency agent should be enabled in virtual machine scale sets for listed virtual machine images
    control.dependency_agent_should_be_enabled_in_virtual_machine_scale_sets_for_listed_virtual_machine_images,

    # SQL servers on machines should have vulnerability findings resolved
    control.compute_vm_vulnerability_findings_resolved_for_sql_server,

    # GitHub repositories should have dependency vulnerability scanning findings resolved
    control.github_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # System updates should be installed on your machines (powered by Azure Update Manager)
    control.compute_vm_system_updates_installed,

    # Machines should be restarted to apply security configuration updates
    control.machines_should_be_restarted_to_apply_security_configuration_updates,

    # Azure Machine Learning compute instances should be recreated to get the latest software updates
    control.azure_machine_learning_compute_instances_should_be_recreated_to_get_the_latest_software_updates,

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

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Function apps should have vulnerability findings resolved
    control.function_apps_should_have_vulnerability_findings_resolved,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # GitHub repositories should have secrets scanning findings resolved
    control.github_repositories_should_have_secrets_scanning_findings_resolved,

    # GitHub repositories should have code scanning findings resolved
    control.github_repositories_should_have_code_scanning_findings_resolved,

    # Microsoft Defender for APIs should be enabled
    control.microsoft_defender_for_apis_should_be_enabled,

    # GitHub repositories should have Dependabot scanning enabled
    control.github_repositories_should_have_dependabot_scanning_enabled,

    # Code repositories should have dependency vulnerability scanning findings resolved
    control.code_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,

    # Microsoft Defender for Azure Cosmos DB should be enabled
    control.securitycenter_azure_defender_on_for_cosmosdb,

    # Azure Resource Manager deployments should have secrets findings resolved
    control.azure_resource_manager_deployments_should_have_secrets_findings_resolved,

    # PHP should be updated to the latest version for API apps
    control.php_should_be_updated_to_the_latest_version_for_api_apps,

    # Azure DevOps repositories should have infrastructure as code scanning findings resolved
    control.azure_devops_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,

    # Kubernetes Services should be upgraded to a non-vulnerable Kubernetes version
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Container images in Azure registry should have vulnerability findings resolved
    control.container_images_in_azure_registry_should_have_vulnerability_findings_resolved,

    # GitHub security posture management findings should be resolved
    control.github_security_posture_management_findings_should_be_resolved,

    # Microsoft Antimalware for Azure should be configured to automatically update protection signatures
    control.compute_vm_malware_agent_automatic_upgrade_enabled,

    # Vulnerability assessment should be enabled on your Synapse workspaces
    control.synapse_workspace_vulnerability_assessment_enabled,

    # SQL servers should have vulnerability assessment configured
    control.sql_server_and_databases_va_enabled,

    # Machines should have secrets findings resolved
    control.machines_should_have_secrets_findings_resolved,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_4" {
  title       = "6.4 - Public-facing web applications are protected against attacks."

  children = [
    benchmark.pci_dss_v401_requirement_6_4_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_4_1" {
  title       = "6.4.1 - For public-facing web applications, new threats and vulnerabilities are addressed on an ongoing basis and these applications are protected against known attacks."

  description = <<-MARKDOWN
    For public-facing web applications, new threats and vulnerabilities are addressed on an ongoing basis and these applications are protected against
    known attacks as follows:

    * Reviewing public-facing web applications via manual or automated application vulnerability security assessment tools or methods as follows:

      - At least once every 12 months and after significant changes.
      - By an entity that specializes in application security.
      - Including, at a minimum, all common software attacks in Requirement 6.2.4.
      - All vulnerabilities are ranked in accordance with requirement 6.3.1.
      - All vulnerabilities are corrected.
      - The application is re-evaluated after the corrections.

    OR

    * Installing an automated technical solution(s) that continually detects and prevents web-based attacks as follows:

      - Installed in front of public-facing web applications to detect and prevent webbased attacks.
      - Actively running and up to date as applicable.
      - Generating audit logs.
      - Configured to either block web-based attacks or generate an alert that is immediately investigated.
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

    # SQL servers should have vulnerability assessment configured
    control.sql_server_and_databases_va_enabled,

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

benchmark "pci_dss_v401_requirement_6_5" {
  title       = "6.5 - Changes to all system components are managed securely."

  children = [
    benchmark.pci_dss_v401_requirement_6_5_1,
    benchmark.pci_dss_v401_requirement_6_5_2,
    benchmark.pci_dss_v401_requirement_6_5_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_5_1" {
  title       = "6.5.1 - Changes to all system components in the production environment are made according to established procedures."

  description = <<-MARKDOWN
    Changes to all system components in the production environment are made according to established procedures that include:

    * Reason for, and description of, the change.
    * Documentation of security impact.
    * Documented change approval by authorized parties.
    * Testing to verify that the change does not adversely impact system security.
    * For bespoke and custom software changes, all updates are tested for compliance with Requirement 6.2.4 before being deployed into production.
    * Procedures to address failures and return to a secure state.
  MARKDOWN

  children = [
    # Guest Configuration extension should be installed on machines
    control.compute_vm_guest_configuration_installed,

    # System updates should be installed on your machines (powered by Azure Update Manager)
    control.compute_vm_system_updates_installed,

    # Python should be updated to the latest version for API apps
    control.python_should_be_updated_to_the_latest_version_for_api_apps,

    # Microsoft Defender for SQL status should be protected for Arc-enabled SQL Servers
    control.microsoft_defender_for_sql_status_should_be_protected_for_arc_enabled_sql_servers,

    # Java should be updated to the latest version for API apps
    control.appservice_web_app_latest_java_version,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_5_2" {
  title       = "6.5.2 - Upon completion of a significant change, all applicable PCI DSS requirements are confirmed to be in place on all new or changed systems and networks, and documentation is updated as applicable."

  children = [
    # Microsoft Defender CSPM should be enabled
    control.microsoft_defender_cspm_should_be_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_6_5_4" {
  title       = "6.5.4 - Roles and functions are separated between production and pre-production environments to provide accountability such that only reviewed and approved changes are deployed."

  children = [
    # Microsoft Defender for SQL status should be protected for Arc-enabled SQL Servers
    control.microsoft_defender_for_sql_status_should_be_protected_for_arc_enabled_sql_servers,
  ]

  tags = local.pci_dss_v401_common_tags
}
