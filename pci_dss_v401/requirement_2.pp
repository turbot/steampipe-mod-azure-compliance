
benchmark "pci_dss_v401_requirement_2" {
  title       = "2 - Apply Secure Configurations to All System Components"

  description = <<-MARKDOWN
    Malicious individuals, both external and internal to an entity, often use default passwords and other vendor default settings to compromise
    systems. These passwords and settings are well known and are easily determined via public information.

    Applying secure configurations to system components reduces the means available to an attacker to compromise the system. Changing default
    passwords, removing unnecessary software, functions, and accounts, and disabling or removing unnecessary services all help to reduce the
    potential attack surface.

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_2_2,
    benchmark.pci_dss_v401_requirement_2_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_2" {
  title       = "2.2 - System components are configured and managed securely."

  children = [
    benchmark.pci_dss_v401_requirement_2_2_1,
    benchmark.pci_dss_v401_requirement_2_2_2,
    benchmark.pci_dss_v401_requirement_2_2_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_2_1" {
  title       = "2.2.1 - Configuration standards are developed, implemented, and maintained."

  description = <<-MARKDOWN
    Configuration standards are developed, implemented, and maintained to:

    * Cover all system components.
    * Address all known security vulnerabilities.
    * Be consistent with industry-accepted system hardening standards or vendor hardening recommendations.
    * Be updated as new vulnerability issues are identified, as defined in Requirement 6.3.1.
    * Be applied when new systems are configured and verified as in place before or immediately after a system component is connected to a production environment.
  MARKDOWN

  children = [
    # Guest Configuration extension should be installed on machines
    control.compute_vm_guest_configuration_installed,

    # Audit Linux machines that do not have the passwd file permissions set to 0644
    control.audit_linux_machines_passwd_file_permissions_0644,

    # Flow logs should be configured for every network security group
    control.network_sg_flowlog_enabled,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # System updates should be installed on your machines (powered by Azure Update Manager)
    control.compute_vm_system_updates_installed,

    # Windows machines should meet requirements for 'System Audit Policies - Detailed Tracking'
    control.compute_vm_meet_system_audit_policies_requirement_windows,

    # Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)
    control.compute_vm_security_configuration_vulnerabilities_remediated,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,

    # Remote debugging should be turned off for Web Applications
    control.appservice_web_app_remote_debugging_disabled,

    # Privileged containers should be avoided
    control.privileged_containers_should_be_avoided,

    # Machines should be configured securely (powered by MDVM)
    control.compute_vm_configured_securely_mdvm,

    # Windows machines should meet requirements for 'Security Options - Audit'
    control.compute_vm_meet_security_option_audit_requirement_windows,

    # Java should be updated to the latest version for API apps
    control.appservice_web_app_latest_java_version,

    # Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed
    control.kubernetes_cluster_addon_azure_policy_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_2_2" {
  title       = "2.2.2 - Vendor default accounts are managed."

  description = <<-MARKDOWN
    Vendor default accounts are managed as follows:

    * If the vendor default account(s) will be used, the default password is changed per Requirement 8.3.6.
    * If the vendor default account(s) will not be used, the account is removed or disabled.
  MARKDOWN

  children = [
    # Ensure API app has Client Certificates Incoming client certificates set to On
    control.appservice_api_app_client_certificates_on,

    # Azure Database for PostgreSQL should have an Azure Active Directory administrator provisioned
    control.azure_database_for_postgresql_should_have_an_azure_active_directory_administrator_provisioned,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # API Management calls to API backends should be authenticated
    control.api_management_calls_to_api_backends_should_be_authenticated,

    # Managed identity should be enabled on function apps
    control.appservice_function_app_uses_managed_identity,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_2_4" {
  title       = "2.2.4 - Only necessary services, protocols, daemons, and functions are enabled, and all unnecessary functionality is removed or disabled."

  children = [
    # Management ports should be closed on your virtual machines
    control.compute_vm_assessment_mamagement_ports_closed,

    # Deploy the Linux Guest Configuration extension to enable Guest Configuration assignments on Linux VMs
    control.compute_vm_guest_configuration_installed_linux,

    # Audit Linux machines that do not have the passwd file permissions set to 0644
    control.audit_linux_machines_passwd_file_permissions_0644,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # Usage of pod HostPath volume mounts should be restricted to a known list to restrict node access from compromised containers
    control.kubernetes_cluster_pod_host_path_volume_use_allowed_host_path,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # Subnets should be associated with a network security group
    control.network_security_group_subnet_associated,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # Private endpoint should be enabled for MariaDB servers
    control.mariadb_server_private_link_used,

    # Private endpoint should be enabled for PostgreSQL servers
    control.postgres_server_private_link_used,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Remote debugging should be turned off for API App
    control.remote_debugging_should_be_turned_off_for_api_app,

    # Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)
    control.compute_vm_security_configuration_vulnerabilities_remediated,

    # vTPM should be enabled on supported virtual machines
    control.vtpm_should_be_enabled_on_supported_virtual_machines,

    # Azure VPN gateways should not use 'basic' SKU
    control.azure_vpn_gateways_should_not_use_basic_sku,

    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Windows machines should meet requirements for 'Administrative Templates - Network'
    control.windows_machines_should_meet_requirements_for_administrative_templates_network_,

    # Machines should be configured securely (powered by MDVM)
    control.compute_vm_configured_securely_mdvm,

    # API Management subscriptions should not be scoped to all APIs
    control.api_management_subscriptions_should_not_be_scoped_to_all_apis,

    # Container with privilege escalation should be avoided
    control.kubernetes_cluster_container_privilege_escalation_restricted,

    # Deploy network watcher when virtual networks are created
    control.network_watcher_in_regions_with_virtual_network,

    # Immutable (read-only) root filesystem should be enforced for containers
    control.kubernetes_cluster_container_with_read_only_root_file_system,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # Remote debugging should be turned off for Function App
    control.appservice_function_app_remote_debugging_disabled,

    # Azure Kubernetes Service clusters should have the Azure Policy add-on for Kubernetes installed
    control.kubernetes_cluster_addon_azure_policy_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_3" {
  title       = "2.3 - Wireless environments are configured and managed securely."

  children = [
    benchmark.pci_dss_v401_requirement_2_3_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_2_3_1" {
  title       = "2.3.1 - For wireless environments connected to the CDE or transmitting account data, all wireless vendor defaults are changed at installation or are confirmed to be secure."

  description = <<-MARKDOWN
    For wireless environments connected to the CDE or transmitting account data, all wireless vendor defaults are changed at installation or are confirmed to be secure, including but not limited to:

    * Default wireless encryption keys.
    * Passwords on wireless access points.
    * SNMP defaults.
    * Any other security-related wireless vendor defaults.
  MARKDOWN

  children = [
    # Ensure API app has Client Certificates Incoming client certificates set to On
    control.appservice_api_app_client_certificates_on,

    # Azure Database for PostgreSQL should have an Azure Active Directory administrator provisioned
    control.azure_database_for_postgresql_should_have_an_azure_active_directory_administrator_provisioned,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # API Management calls to API backends should be authenticated
    control.api_management_calls_to_api_backends_should_be_authenticated,

    # Managed identity should be enabled on function apps
    control.appservice_function_app_uses_managed_identity,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}
