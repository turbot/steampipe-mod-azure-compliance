
benchmark "pci_dss_v401_requirement_1" {
  title       = "1 - Install and Maintain Network Security Controls"

  description = <<-MARKDOWN
    Network security controls (NSCs), such as firewalls and other network security technologies, are network policy enforcement points that
    typically control network traffic between two or more logical or physical network segments (or subnets) based on pre-defined policies or rules.
    NSCs examine all network traffic entering (ingress) and leaving (egress) a segment and decide, based on the policies defined, whether the
    network traffic is allowed to pass or whether it should be rejected. Typically, NSCs are placed between environments with different security
    needs or levels of trust, however in some environments NSCs control the traffic to individual devices irrespective of trust boundaries. Policy
    enforcement generally occurs at layer 3 of the OSI model, but data present in higher layers is also frequently used to determine policy
    decisions.

    Traditionally this function has been provided by physical firewalls; however, now this functionality may be provided by virtual devices, cloud
    access controls, virtualization/container systems, and other software-defined networking technology.

    NSCs are used to control traffic within an entity's own networks—for example, between highly sensitive and less sensitive areas—and also to
    protect the entity's resources from exposure to untrusted networks. The cardholder data environment (CDE) is an example of a more sensitive
    area within an entity's network. Often, seemingly insignificant paths to and from untrusted networks can provide unprotected pathways into
    sensitive systems. NSCs provide a key protection mechanism for any computer network.

    Common examples of untrusted networks include the Internet, dedicated connections such as business-to-business communication channels,
    wireless networks, carrier networks (such as cellular), third-party networks, and other sources outside the entity's ability to control. Furthermore,
    untrusted networks also include corporate networks that are considered out-of-scope for PCI DSS, because they are not assessed, and
    therefore must be treated as untrusted because the existence of security controls has not been verified. While an entity may consider an
    internal network to be trusted from an infrastructure perspective, if a network is out of scope for PCI DSS, that network must be considered
    untrusted for PCI DSS.

    Refer to Appendix G for definitions of PCI DSS terms
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_1_2,
    benchmark.pci_dss_v401_requirement_1_3,
    benchmark.pci_dss_v401_requirement_1_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_2" {
  title       = "1.2 - Network security controls (NSCs) are configured and maintained."

  children = [
    benchmark.pci_dss_v401_requirement_1_2_1,
    benchmark.pci_dss_v401_requirement_1_2_5,
    benchmark.pci_dss_v401_requirement_1_2_7,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_2_1" {
  title       = "1.2.1 - Configuration standards for NSC rulesets are defined, implemented, and maintained."

  children = [
    # [Preview]: Azure Recovery Services vaults should use private link for backup
    control.recovery_service_vault_uses_private_link_for_backup,

    # VPN gateways should use only Azure Active Directory (Azure AD) authentication for point-to-site users
    control.network_virtual_network_gateway_aad_only,

    # Windows machines should meet requirements for 'Security Options - Network Access'
    control.compute_vm_meet_security_options_network_access_requirement_windows,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # [Preview]: Recovery Services vaults should use private link
    control.recovery_service_vault_uses_private_link,

    # Storage Accounts should use a virtual network service endpoint
    control.storage_account_use_virtual_service_endpoint,

    # Storage accounts should allow access from trusted Microsoft services
    control.storage_account_trusted_microsoft_services_enabled,

    # Azure AI Services resources should use Azure Private Link
    control.azure_ai_services_resources_should_use_azure_private_link,

    # Azure Database for PostgreSQL flexible server should have Microsoft Entra authentication only enabled
    control.azure_database_for_postgresql_flexible_server_microsoft_entra_authentication_only_enabled,

    # Windows machines should meet requirements for 'Security Options - Network Security'
    control.compute_vm_meet_security_options_network_security_requirement_windows,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_2_5" {
  title       = "1.2.5 - All services, protocols, and ports allowed are identified, approved, and have a defined business need."

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

    # Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)
    control.compute_vm_security_configuration_vulnerabilities_remediated,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Machines should be configured securely (powered by MDVM)
    control.compute_vm_configured_securely_mdvm,

    # Container with privilege escalation should be avoided
    control.kubernetes_cluster_container_privilege_escalation_restricted,

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

benchmark "pci_dss_v401_requirement_1_2_7" {
  title       = "1.2.7 - Configurations of NSCs are reviewed at least once every six months to confirm they are relevant and effective."

  children = [
    # [Preview]: Azure Recovery Services vaults should use private link for backup
    control.recovery_service_vault_uses_private_link_for_backup,

    # VPN gateways should use only Azure Active Directory (Azure AD) authentication for point-to-site users
    control.network_virtual_network_gateway_aad_only,

    # Windows machines should meet requirements for 'Security Options - Network Access'
    control.compute_vm_meet_security_options_network_access_requirement_windows,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # [Preview]: Recovery Services vaults should use private link
    control.recovery_service_vault_uses_private_link,

    # Storage Accounts should use a virtual network service endpoint
    control.storage_account_use_virtual_service_endpoint,

    # Storage accounts should allow access from trusted Microsoft services
    control.storage_account_trusted_microsoft_services_enabled,

    # Azure AI Services resources should use Azure Private Link
    control.azure_ai_services_resources_should_use_azure_private_link,

    # Azure Database for PostgreSQL flexible server should have Microsoft Entra authentication only enabled
    control.azure_database_for_postgresql_flexible_server_microsoft_entra_authentication_only_enabled,

    # Windows machines should meet requirements for 'Security Options - Network Security'
    control.compute_vm_meet_security_options_network_security_requirement_windows,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_3" {
  title       = "1.3 - Network access to and from the cardholder data environment is restricted."

  children = [
    benchmark.pci_dss_v401_requirement_1_3_1,
    benchmark.pci_dss_v401_requirement_1_3_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_3_1" {
  title       = "1.3.1 - Inbound traffic to the CDE is restricted."

  description = <<-MARKDOWN
    Inbound traffic to the CDE is restricted as follows:

    * To only traffic that is necessary.
    * All other traffic is specifically denied.
  MARKDOWN

  children = [
    # All network ports should be restricted on network security groups associated to your virtual machine
    control.compute_vm_remote_access_restricted_all_ports,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Default IP Filter Policy should be Deny
    control.default_ip_filter_policy_should_be_deny,

    # Azure Cosmos DB accounts should have firewall rules
    control.cosmosdb_account_with_firewall_rules,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_3_2" {
  title       = "1.3.2 - Outbound traffic from the CDE is restricted."

  description = <<-MARKDOWN
    Outbound traffic from the CDE is restricted as follows:

    * To only traffic that is necessary.
    * All other traffic is specifically denied.
  MARKDOWN

  children = [
    # All network ports should be restricted on network security groups associated to your virtual machine
    control.compute_vm_remote_access_restricted_all_ports,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Default IP Filter Policy should be Deny
    control.default_ip_filter_policy_should_be_deny,

    # Azure Cosmos DB accounts should have firewall rules
    control.cosmosdb_account_with_firewall_rules,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_4" {
  title       = "1.4 - Network connections between trusted and untrusted networks are controlled."

  children = [
    benchmark.pci_dss_v401_requirement_1_4_1,
    benchmark.pci_dss_v401_requirement_1_4_2,
    benchmark.pci_dss_v401_requirement_1_4_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_4_1" {
  title       = "1.4.1 - NSCs are implemented between trusted and untrusted networks."

  children = [
    # Containers sharing sensitive host namespaces should be avoided
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_4_2" {
  title       = "1.4.2 - Inbound traffic from untrusted networks to trusted networks is restricted."

  description = <<-MARKDOWN
    Inbound traffic from untrusted networks to trusted networks is restricted to:

    * Communications with system components that are authorized to provide publicly accessible services, protocols, and ports.
    * Stateful responses to communications initiated by system components in a trusted network.
    * All other traffic is denied.
  MARKDOWN

  children = [
    # All network ports should be restricted on network security groups associated to your virtual machine
    control.compute_vm_remote_access_restricted_all_ports,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Default IP Filter Policy should be Deny
    control.default_ip_filter_policy_should_be_deny,

    # Azure Cosmos DB accounts should have firewall rules
    control.cosmosdb_account_with_firewall_rules,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_1_4_4" {
  title       = "1.4.4 - System components that store cardholder data are not directly accessible from untrusted networks."

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # [Preview]: Azure Recovery Services vaults should use private link for backup
    control.recovery_service_vault_uses_private_link_for_backup,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Define acceptable and unacceptable mobile code technologies
    control.define_acceptable_and_unacceptable_mobile_code_technologies,

    # Usage of pod HostPath volume mounts should be restricted to a known list to restrict node access from compromised containers
    control.kubernetes_cluster_pod_host_path_volume_use_allowed_host_path,

    # Web Application Firewall (WAF) should be enabled for Application Gateway
    control.application_gateway_waf_enabled,

    # Automatic iptables management should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.automatic_iptables_management_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Microsoft Defender for Containers should be enabled
    control.securitycenter_azure_defender_on_for_containers,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # Azure SQL Managed Instances should disable public network access
    control.azure_sql_managed_instances_should_disable_public_network_access,

    # Idle timeout should be configured on nodes in Azure Kubernetes Service (AKS) clusters
    control.idle_timeout_should_be_configured_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should be in a virtual network
    control.databricks_workspace_deployed_in_custom_vnet,

    # CORS should not allow every domain to access your API for FHIR
    control.cors_should_not_allow_every_domain_to_access_your_api_for_fhir,

    # Azure Cache for Redis should reside within a virtual network
    control.redis_cache_in_virtual_network,

    # Machines should have ports closed that might expose attack vectors
    control.machines_should_have_ports_closed_that_might_expose_attack_vectors,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Microsoft Defender for Key Vault should be enabled
    control.securitycenter_azure_defender_on_for_keyvault,

    # CORS should not allow every resource to access Function Apps
    control.appservice_function_app_cors_no_star,

    # [Preview]: Recovery Services vaults should use private link
    control.recovery_service_vault_uses_private_link,

    # Public network access should be disabled for MySQL flexible servers
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,

    # Windows machines should meet requirements for 'Windows Firewall Properties'
    control.compute_vm_meet_firewall_properties_windows,

    # Public network access should be disabled for PostgreSQL flexible servers
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,

    # Azure AI Services resources should use Azure Private Link
    control.azure_ai_services_resources_should_use_azure_private_link,

    # SQL Server should use a virtual network service endpoint
    control.sql_server_use_virtual_service_endpoint,

    # [Preview]: Container Registry should use a virtual network service endpoint
    control.container_registry_use_virtual_service_endpoint,

    # Firewall should be enabled on Key Vault
    control.keyvault_firewall_enabled,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Azure Spring Cloud should use network injection
    control.spring_cloud_service_network_injection_enabled,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # Internet-facing virtual machines should be protected with network security groups
    control.compute_vm_tcp_udp_access_restricted_internet,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # App Service apps should use a virtual network service endpoint
    control.appservice_web_app_use_virtual_service_endpoint,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Host and VM networking should be protected on Azure Local instances
    control.host_and_vm_networking_should_be_protected_on_azure_local_instances,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Public network access should be disabled for Container registries
    control.public_network_access_should_be_disabled_for_container_registries,

    # Azure Container Instance container group should deploy into a virtual network
    control.container_instance_container_group_in_virtual_network,

    # Azure Machine Learning Computes should be in a virtual network
    control.azure_machine_learning_computes_should_be_in_a_virtual_network,

    # Remote debugging should be turned off for Function App
    control.appservice_function_app_remote_debugging_disabled,

    # Microsoft Defender for App Service should be enabled
    control.securitycenter_azure_defender_on_for_appservice,
  ]

  tags = local.pci_dss_v401_common_tags
}
