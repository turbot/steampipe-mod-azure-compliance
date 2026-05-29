
benchmark "pci_dss_v401_requirement_12" {
  title       = "12 - Support Information Security with Organizational Policies and Programs"

  description = <<-MARKDOWN
    The organization's overall information security policy sets the tone for the whole entity and informs personnel what is expected of them. All
    personnel should be aware of the sensitivity of cardholder data and their responsibilities for protecting it.

    For the purposes of Requirement 12, "personnel" refers to full-time and part-time employees, temporary employees, contractors, and
    consultants with security responsibilities for protecting account data or that can impact the security of cardholder data and/or sensitive
    authentication data.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_12_2,
    benchmark.pci_dss_v401_requirement_12_4,
    benchmark.pci_dss_v401_requirement_12_5,
    benchmark.pci_dss_v401_requirement_12_10,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_2" {
  title       = "12.2 - Acceptable use policies for end-user technologies are defined and implemented."

  children = [
    benchmark.pci_dss_v401_requirement_12_2_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_2_1" {
  title       = "12.2.1 - Acceptable use policies for end-user technologies are documented and implemented."

  description = <<-MARKDOWN
    Acceptable use policies for end-user technologies are documented and implemented, including:

    * Explicit approval by authorized parties.
    * Acceptable uses of the technology.
    * List of products approved by the company for employee use, including hardware and software.
  MARKDOWN

  children = [
    # An activity log alert should exist for specific Policy operations
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,

    # An activity log alert should exist for specific Security operations
    control.an_activity_log_alert_should_exist_for_specific_security_operations,

    # An activity log alert should exist for Create or Update SQL Server Firewall Rule
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,

    # CORS should not allow every resource to access Function Apps
    control.appservice_function_app_cors_no_star,

    # Windows machines should meet requirements for 'User Rights Assignment'
    control.network_security_group_rdp_access_restricted,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_4" {
  title       = "12.4 - PCI DSS compliance is manageed."

  children = [
    benchmark.pci_dss_v401_requirement_12_4_1,
    benchmark.pci_dss_v401_requirement_12_4_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_4_1" {
  title       = "12.4.1 - Additional requirement for service providers only: Responsibility is established by executive management for the protection of cardholder data and a PCI DSS compliance program."

  description = <<-MARKDOWN
    Additional requirement for service providers only: Responsibility is established by executive management for the protection of cardholder data and a PCI DSS compliance
    program to include:

    * Overall accountability for maintaining PCI DSS compliance.
    * Defining a charter for a PCI DSS compliance program and communication to executive management.
  MARKDOWN

  children = [
    # Security Center standard pricing tier should be selected
    control.securitycenter_pricing_standard,

    # Microsoft Defender for Resource Manager should be enabled
    control.securitycenter_azure_defender_on_for_resource_manager,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # Microsoft Defender CSPM should be enabled
    control.microsoft_defender_cspm_should_be_enabled,

    # Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,

    # Microsoft Defender for open-source relational databases should be enabled
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,

    # Microsoft Defender for APIs should be enabled
    control.microsoft_defender_for_apis_should_be_enabled,

    # Microsoft Defender for Azure Cosmos DB should be enabled
    control.securitycenter_azure_defender_on_for_cosmosdb,

    # Microsoft Defender for SQL servers on machines should be enabled
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,

    # Microsoft Defender for Azure SQL Database servers should be enabled
    control.securitycenter_azure_defender_on_for_sqldb,

    # Microsoft Defender for servers should be enabled
    control.securitycenter_azure_defender_on_for_server,

    # Machines should be configured securely (powered by MDVM)
    control.compute_vm_configured_securely_mdvm,

    # Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,

    # Microsoft Defender for SQL should be enabled for unprotected Azure SQL servers
    control.sql_server_azure_defender_enabled,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Machines should have vulnerability findings resolved
    control.machines_should_have_vulnerability_findings_resolved,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_4_2" {
  title       = "12.4.2 - Additional requirement for service providers only: Reviews are performed at least once every three months to confirm that personnel are performing their tasks in accordance with all security policies and operational procedures."

  description = <<-MARKDOWN
    Additional requirement for service providers only: Reviews are performed at least once every three months to confirm that personnel
    are performing their tasks in accordance with all security policies and operational procedures. Reviews are performed by personnel other than
    those responsible for performing the given task and include, but are not limited to, the following tasks:

    * Daily log reviews.
    * Configuration reviews for network security controls.
    * Applying configuration standards to new systems.
    * Responding to security alerts.
    * Change-management processes.
  MARKDOWN

  children = [
    # Audit Linux machines that do not have the passwd file permissions set to 0644
    control.audit_linux_machines_passwd_file_permissions_0644,

    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_5" {
  title       = "12.5 - PCI DSS scope is documented and validated."

  children = [
    benchmark.pci_dss_v401_requirement_12_5_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_5_2" {
  title       = "12.5.2 - PCI DSS scope is documented and confirmed by the entity at least once every 12 months and upon significant change to the in-scope environment."

  description = <<-MARKDOWN
    PCI DSS scope is documented and confirmed by the entity at least once every 12 months and upon significant change to the in-scope
    environment. At a minimum, the scoping validation includes:

    * Identifying all data flows for the various payment stages (for example, authorization, capture settlement, chargebacks, and refunds) and
      acceptance channels (for example, cardpresent, card-not-present, and e-commerce).
    * Updating all data-flow diagrams per Requirement 1.2.4.
    * Identifying all locations where account data is stored, processed, and transmitted, including but not limited to: 1) any locations outside
      of the currently defined CDE, 2) applications that process CHD, 3) transmissions between systems and networks, and 4) file backups.
    * Identifying all system components in the CDE, connected to the CDE, or that could impact security of the CDE.
    * Identifying all segmentation controls in use and the environment(s) from which the CDE is segmented, including justification for environments being out of scope.
    * Identifying all connections from third-party entities with access to the CDE.
    * Confirming that all identified data flows, account data, system components, segmentation controls, and connections from third parties with access to the CDE are included in scope.
  MARKDOWN

  children = [
    # Azure Backup should be enabled for virtual machines
    control.compute_vm_azure_backup_enabled,

    # Private endpoint should be enabled for MariaDB servers
    control.mariadb_server_private_link_used,

    # Private endpoint should be enabled for PostgreSQL servers
    control.postgres_server_private_link_used,

    # API App should only be accessible over HTTPS
    control.appservice_api_app_use_https,

    # SQL Managed Instance should have the minimal TLS version of 1.2
    control.sql_managed_instance_should_have_the_minimal_tls_version_of_1_2,

    # Azure SQL Database should be running TLS version 1.2 or newer
    control.azure_sql_database_should_be_running_tls_version_1_2_or_newer,

    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,

    # Private endpoint connections on Azure SQL Database should be enabled
    control.sql_server_uses_private_link,

    # Long-term geo-redundant backup should be enabled for Azure SQL Databases
    control.sql_database_long_term_geo_redundant_backup_enabled,

    # TLS should be updated to the latest version for API apps
    control.tls_should_be_updated_to_the_latest_version_for_api_apps,

    # Key vaults should have deletion protection enabled
    control.keyvault_purge_protection_enabled,

    # API Management subscriptions should not be scoped to all APIs
    control.api_management_subscriptions_should_not_be_scoped_to_all_apis,

    # Geo-redundant backup should be enabled for Azure Database for MariaDB
    control.mariadb_server_geo_redundant_backup_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10" {
  title       = "12.10 - Suspected and confirmed security incidents that could impact the CDE are responded to immediately."

  children = [
    benchmark.pci_dss_v401_requirement_12_10_1,
    benchmark.pci_dss_v401_requirement_12_10_2,
    benchmark.pci_dss_v401_requirement_12_10_3,
    benchmark.pci_dss_v401_requirement_12_10_5,
    benchmark.pci_dss_v401_requirement_12_10_7,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10_1" {
  title       = "12.10.1 - An incident response plan exists and is ready to be activated in the event of a suspected or confirmed security incident."

  description = <<-MARKDOWN
    An incident response plan exists and is ready to be activated in the event of a suspected or confirmed security incident. The plan includes,
    but is not limited to:

    * Roles, responsibilities, and communication and contact strategies in the event of a suspected or confirmed security incident, including notification
      of payment brands and acquirers, at a minimum.
    * Incident response procedures with specific containment and mitigation activities for different types of incidents.
    * Business recovery and continuity procedures.
    * Data backup processes.
    * Analysis of legal requirements for reporting compromises.
    * Coverage and responses of all critical system components.
    * Reference or inclusion of incident response procedures from the payment brands.
  MARKDOWN

  children = [
    # Subscriptions should have a contact email address for security issues
    control.securitycenter_email_configured,

    # Audit virtual machines without disaster recovery configured
    control.compute_vm_disaster_recovery_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10_2" {
  title       = "12.10.2 - At least once every 12 months, the security incident response plan is reviewed and tested."

  description = <<-MARKDOWN
    At least once every 12 months, the security incident response plan is:

    * Reviewed and the content is updated as needed.
    * Tested, including all elements listed in Requirement 12.10.1.
  MARKDOWN

  children = [
    # Subscriptions should have a contact email address for security issues
    control.securitycenter_email_configured,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10_3" {
  title       = "12.10.3 - Specific personnel are designated to be available on a 24/7 basis to respond to suspected or confirmed security incidents."

  children = [
    # Subscriptions should have a contact email address for security issues
    control.securitycenter_email_configured,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10_5" {
  title       = "12.10.5 - The security incident response plan includes monitoring and responding to alerts from security monitoring systems."

  description = <<-MARKDOWN
    The security incident response plan includes monitoring and responding to alerts from security monitoring systems, including but not limited to:

    * Intrusion-detection and intrusion-prevention systems.
    * Network security controls.
    * Change-detection mechanisms for critical files.
    * The change-and tamper-detection mechanism for payment pages. This bullet is a best practice until its effective date; refer to Applicability Notes
      below for details.
    * Detection of unauthorized wireless access points.
  MARKDOWN

  children = [
    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_12_10_7" {
  title       = "12.10.7 - Incident response procedures are in place, to be initiated upon the detection of stored PAN anywhere it is not expected."

  description = <<-MARKDOWN
    Incident response procedures are in place, to be initiated upon the detection of stored PAN anywhere it is not expected, and include:

    * Determining what to do if PAN is discovered outside the CDE, including its retrieval, secure deletion, and/or migration into the currently defined CDE, as applicable.
    * Identifying whether sensitive authentication data is stored with PAN.
    * Determining where the account data came from and how it ended up where it was not expected.
    * Remediating data leaks or process gaps that resulted in the account data being where it was not expected.
  MARKDOWN

  children = [
    # Resource logs in Azure Key Vault Managed HSM should be enabled
    control.keyvault_managed_hms_logging_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}
