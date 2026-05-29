
benchmark "pci_dss_v401_requirement_7" {
  title       = "7 - Restrict Access to System Components and Cardholder Data by Business Need to Know"

  description = <<-MARKDOWN
    Unauthorized individuals may gain access to critical data or systems due to ineffective access control rules and definitions. To ensure critical
    data can only be accessed by authorized personnel, systems and processes must be in place to limit access based on need to know and
    according to job responsibilities.

    "Access" or "access rights" are created by rules that provide users access to systems, applications, and data, while "privileges" allow a user to
    perform a specific action or function in relation to that system, application, or data. For example, a user may have access rights to specific data,
    but whether they can only read that data, or can also change or delete the data is determined by the user’s assigned privileges.

    "Need to know" refers to providing access to only the least amount of data needed to perform a job.

    "Least privileges" refers to providing only the minimum level of privileges needed to perform a job.

    These requirements apply to user accounts and access for employees, contractors, consultants, and internal and external vendors and other
    third parties (for example, for providing support or maintenance services). Certain requirements also apply to application and system accounts
    used by the entity (also called "service accounts").

    These requirements do not apply to consumers (cardholders).

    Refer to Appendix G for definitions of PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_7_2,
    benchmark.pci_dss_v401_requirement_7_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2" {
  title       = "7.2 - Access to system components and data is appropriately defined and assigned."

  children = [
    benchmark.pci_dss_v401_requirement_7_2_1,
    benchmark.pci_dss_v401_requirement_7_2_2,
    benchmark.pci_dss_v401_requirement_7_2_3,
    benchmark.pci_dss_v401_requirement_7_2_4,
    benchmark.pci_dss_v401_requirement_7_2_5,
    benchmark.pci_dss_v401_requirement_7_2_6,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_1" {
  title       = "7.2.1 - An access control model is defined and includes granting access as follows: Appropriate access depending on the entity`s business and access needs. Access to system components and data resources that is based on users` job classification and functions. The least privileges required (for example, user, administrator) to perform a job function"

  description = <<-MARKDOWN
    An access control model is defined and includes granting access as follows:

    * Appropriate access depending on the entity's business and access needs.
    * Access to system components and data resources that is based on users' job classification and functions.
    * The least privileges required (for example, user, administrator) to perform a job function.
  MARKDOWN

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Service Principals should not be assigned with administrative roles at the subscription and resource group level
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # Public network access should be disabled for MySQL servers
    control.mysql_server_public_network_access_disabled,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Public network access should be disabled for PostgreSQL servers
    control.postgresql_server_public_network_access_disabled,

    # Public network access should be disabled for MariaDB servers
    control.mariadb_server_public_network_access_disabled,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # Log Analytics Workspaces should block non-Azure Active Directory based ingestion
    control.log_analytics_workspace_block_non_azure_ingestion,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # Public network access should be disabled for MySQL flexible servers
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,

    # Privileged roles should not have permanent access at the subscription and resource group level
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Public network access should be disabled for PostgreSQL flexible servers
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Audit Windows machines that have extra accounts in the Administrators group
    control.compute_vm_administrators_group_with_extra_accounts_windows,

    # Storage accounts should prevent shared key access
    control.storage_account_shared_key_access_disabled,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Kubernetes clusters should disable automounting API credentials
    control.kubernetes_clusters_should_disable_automounting_api_credentials,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_2" {
  title       = "7.2.2 - Access is assigned to users, including privileged users, based on: Job classification and function. Least privileges necessary to perform job responsibilities"

  description = <<-MARKDOWN
    Access is assigned to users, including privileged users, based on:

    * Job classification and function.
    * Least privileges necessary to perform job responsibilities.
  MARKDOWN

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Service Principals should not be assigned with administrative roles at the subscription and resource group level
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # Public network access should be disabled for MySQL servers
    control.mysql_server_public_network_access_disabled,

    # Azure overprovisioned identities should have only the necessary permissions
    control.azure_overprovisioned_identities_should_have_only_the_necessary_permissions,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Public network access should be disabled for PostgreSQL servers
    control.postgresql_server_public_network_access_disabled,

    # Public network access should be disabled for MariaDB servers
    control.mariadb_server_public_network_access_disabled,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # Log Analytics Workspaces should block non-Azure Active Directory based ingestion
    control.log_analytics_workspace_block_non_azure_ingestion,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # Public network access should be disabled for MySQL flexible servers
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,

    # Privileged roles should not have permanent access at the subscription and resource group level
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Public network access should be disabled for PostgreSQL flexible servers
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Audit Windows machines that have extra accounts in the Administrators group
    control.compute_vm_administrators_group_with_extra_accounts_windows,

    # Storage accounts should prevent shared key access
    control.storage_account_shared_key_access_disabled,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Kubernetes clusters should disable automounting API credentials
    control.kubernetes_clusters_should_disable_automounting_api_credentials,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_3" {
  title       = "7.2.3 - Required privileges are approved by authorized personnel"

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Management ports should be closed on your virtual machines
    control.compute_vm_assessment_mamagement_ports_closed,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # Subnets should be associated with a network security group
    control.network_security_group_subnet_associated,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Azure Cache for Redis should reside within a virtual network
    control.redis_cache_in_virtual_network,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # CORS should not allow every domain to access your API for FHIR
    control.cors_should_not_allow_every_domain_to_access_your_api_for_fhir,

    # Windows machines should meet requirements for 'Security Options - Network Access'
    control.compute_vm_meet_security_options_network_access_requirement_windows,

    # Private endpoint should be enabled for MariaDB servers
    control.mariadb_server_private_link_used,

    # Private endpoint should be enabled for PostgreSQL servers
    control.postgres_server_private_link_used,

    # CORS should not allow every resource to access Function Apps
    control.appservice_function_app_cors_no_star,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Audit Windows machines that have extra accounts in the Administrators group
    control.compute_vm_administrators_group_with_extra_accounts_windows,

    # Storage accounts should prevent shared key access
    control.storage_account_shared_key_access_disabled,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_4" {
  title       = "7.2.4 - All user accounts and related access privileges, including third-party/vendor accounts, are reviewed as follows: At least once every six months. To ensure user accounts and access remain appropriate based on job function. Any inappropriate access is addressed. Management acknowledges that access remains appropriate"

  description = <<-MARKDOWN
    All user accounts and related access privileges, including third-party/vendor accounts, are reviewed as follows:

    * At least once every six months.
    * To ensure user accounts and access remain appropriate based on job function.
    * Any inappropriate access is addressed.
    * Management acknowledges that access remains appropriate.
  MARKDOWN

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Management ports should be closed on your virtual machines
    control.compute_vm_assessment_mamagement_ports_closed,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Service Principals should not be assigned with administrative roles at the subscription and resource group level
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # Subnets should be associated with a network security group
    control.network_security_group_subnet_associated,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # CORS should not allow every domain to access your API for FHIR
    control.cors_should_not_allow_every_domain_to_access_your_api_for_fhir,

    # Windows machines should meet requirements for 'Security Options - Network Access'
    control.compute_vm_meet_security_options_network_access_requirement_windows,

    # Private endpoint should be enabled for MariaDB servers
    control.mariadb_server_private_link_used,

    # Private endpoint should be enabled for PostgreSQL servers
    control.postgres_server_private_link_used,

    # Azure Cache for Redis should reside within a virtual network
    control.redis_cache_in_virtual_network,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # CORS should not allow every resource to access Function Apps
    control.appservice_function_app_cors_no_star,

    # Privileged roles should not have permanent access at the subscription and resource group level
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Audit Windows machines that have extra accounts in the Administrators group
    control.compute_vm_administrators_group_with_extra_accounts_windows,

    # Storage accounts should prevent shared key access
    control.storage_account_shared_key_access_disabled,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Windows machines should meet requirements for 'System Audit Policies - Privilege Use'
    control.windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_5" {
  title       = "7.2.5 - All application and system accounts and related access privileges are assigned and managed."

  description = <<-MARKDOWN
    All application and system accounts and related access privileges are assigned and managed as follows:

    * Based on the least privileges necessary for the operability of the system or application.
    * Access is limited to the systems, applications, or processes that specifically require their use.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_7_2_5_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_5_1" {
  title       = "7.2.5.1 - All access by application and system accounts and related access privileges are reviewed as follows: Periodically (at the frequency defined in the entity`s targeted risk analysis, which is performed according to all elements specified in Requirement 12.3.1). The application/system access remains appropriate for the function being performed. Any inappropriate access is addressed. Management acknowledges that access remains appropriate"

  description = <<-MARKDOWN
    All access by application and system accounts and related access privileges are reviewed as follows:

    * Periodically (at the frequency defined in the entity's targeted risk analysis, which is performed according to
      all elements specified in Requirement 12.3.1).
    * The application/system access remains appropriate for the function being performed.
    * Any inappropriate access is addressed.
    * Management acknowledges that access remains appropriate.
  MARKDOWN

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Management ports should be closed on your virtual machines
    control.compute_vm_assessment_mamagement_ports_closed,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Kubernetes clusters should not use the default namespace
    control.kubernetes_cluster_should_not_use_default_namespace,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # Subnets should be associated with a network security group
    control.network_security_group_subnet_associated,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # CORS should not allow every domain to access your API for FHIR
    control.cors_should_not_allow_every_domain_to_access_your_api_for_fhir,

    # Windows machines should meet requirements for 'Security Options - Network Access'
    control.compute_vm_meet_security_options_network_access_requirement_windows,

    # Private endpoint should be enabled for MariaDB servers
    control.mariadb_server_private_link_used,

    # Private endpoint should be enabled for PostgreSQL servers
    control.postgres_server_private_link_used,

    # Azure Cache for Redis should reside within a virtual network
    control.redis_cache_in_virtual_network,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # CORS should not allow every resource to access Function Apps
    control.appservice_function_app_cors_no_star,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Windows machines should meet requirements for 'System Audit Policies - Privilege Use'
    control.windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_2_6" {
  title       = "7.2.6 - All user access to query repositories of stored cardholder data is restricted as follows: Via applications or other programmatic methods, with access and allowed actions based on user roles and least privileges. Only the responsible administrator(s) can directly access or query repositories of stored CHD"

  description = <<-MARKDOWN
    All user access to query repositories of stored cardholder data is restricted as follows:

    * Via applications or other programmatic methods, with access and allowed actions based on user roles and least privileges.
    * Only the responsible administrator(s) can directly access or query repositories of stored CHD.
  MARKDOWN

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Audit Linux machines that allow remote connections from accounts without passwords
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,

    # Validity period of certificates stored in Azure Key Vault should not exceed 12 months
    control.keyvault_certificate_validity_period_less_equal_12_months,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Service Principals should not be assigned with administrative roles at the subscription and resource group level
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,

    # Azure Event Hub namespaces should have local authentication methods disabled
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Azure SQL Managed Instance authentication mode should be Azure Active Directory Only
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,

    # Windows machines should meet requirements for 'Security Options - Accounts'
    control.compute_vm_meet_security_option_requirement_windows,

    # Public network access should be disabled for MySQL servers
    control.mysql_server_public_network_access_disabled,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Public network access should be disabled for PostgreSQL servers
    control.postgresql_server_public_network_access_disabled,

    # Public network access should be disabled for MariaDB servers
    control.mariadb_server_public_network_access_disabled,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # Log Analytics Workspaces should block non-Azure Active Directory based ingestion
    control.log_analytics_workspace_block_non_azure_ingestion,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # API endpoints in Azure API Management should be authenticated
    control.api_endpoints_in_azure_api_management_should_be_authenticated,

    # Public network access should be disabled for MySQL flexible servers
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,

    # Privileged roles should not have permanent access at the subscription and resource group level
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,

    # Windows machines should meet requirements for 'Security Options - User Account Control'
    control.compute_vm_meet_security_options_user_account_control_requirement_windows,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Public network access should be disabled for PostgreSQL flexible servers
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,

    # Audit Windows machines that do not have the maximum password age set to specified number of days
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Azure Machine Learning Computes should have local authentication methods disabled
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Audit Windows machines that do not have the password complexity setting enabled
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Audit Windows machines that have extra accounts in the Administrators group
    control.compute_vm_administrators_group_with_extra_accounts_windows,

    # Storage accounts should prevent shared key access
    control.storage_account_shared_key_access_disabled,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Kubernetes clusters should disable automounting API credentials
    control.kubernetes_clusters_should_disable_automounting_api_credentials,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_3" {
  title       = "7.3 - Access to system components and data is managed via an access control system(s)."

  children = [
    benchmark.pci_dss_v401_requirement_7_3_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_7_3_1" {
  title       = "7.3.1 - An access control system(s) is in place that restricts access based on a user`s need to know and covers all system components."

  children = [
    # Managed disks should disable public network access
    control.managed_disks_should_disable_public_network_access,

    # Application Insights components should block log ingestion and querying from public networks
    control.application_insights_block_log_ingestion_and_querying_from_public,

    # Log Analytics workspaces should block log ingestion and querying from public networks
    control.log_analytics_workspace_block_log_ingestion_and_querying_from_public,

    # Service Principals should not be assigned with administrative roles at the subscription and resource group level
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,

    # API Management should disable public network access to the service configuration endpoints
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,

    # CORS should not allow every resource to access API Apps
    control.appservice_api_app_cors_no_star,

    # Public network access should be disabled for MySQL servers
    control.mysql_server_public_network_access_disabled,

    # Web Application Firewall (WAF) should use the specified mode for Application Gateway
    control.application_gateway_waf_uses_specified_mode,

    # Public network access should be disabled for PostgreSQL servers
    control.postgresql_server_public_network_access_disabled,

    # Public network access should be disabled for MariaDB servers
    control.mariadb_server_public_network_access_disabled,

    # App Service apps should have authentication enabled
    control.appservice_authentication_enabled,

    # Azure Databricks Clusters should disable public IP
    control.databricks_workspace_no_public_ip_enabled,

    # Azure Machine Learning Workspaces should disable public network access
    control.azure_machine_learning_workspaces_should_disable_public_network_access,

    # Log Analytics Workspaces should block non-Azure Active Directory based ingestion
    control.log_analytics_workspace_block_non_azure_ingestion,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # Public network access should be disabled for MySQL flexible servers
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,

    # Privileged roles should not have permanent access at the subscription and resource group level
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,

    # Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity
    control.compute_vm_guest_configuration_with_system_assigned_managed_identity,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Public network access should be disabled for PostgreSQL flexible servers
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,

    # Storage account public access should be disallowed
    control.storage_account_block_public_access,

    # Event Hub namespaces should use private link
    control.eventhub_namespace_private_link_used,

    # Azure SignalR Service should use private link
    control.signalr_service_private_link_used,

    # Private endpoint connections on Batch accounts should be enabled
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,

    # App Configuration should disable public network access
    control.app_configuration_should_disable_public_network_access,

    # Azure Cache for Redis should use private link
    control.redis_cache_uses_private_link,

    # API Management subscriptions should not be scoped to all APIs
    control.api_management_subscriptions_should_not_be_scoped_to_all_apis,

    # Authorization rules on the Event Hub instance should be defined
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,

    # Azure Arc-enabled Kubernetes clusters should have the Defender extension installed
    control.arc_kubernetes_cluster_azure_defender_extension_installed,

    # Azure Cosmos DB should disable public network access
    control.azure_cosmos_db_should_disable_public_network_access,

    # Kubernetes clusters should disable automounting API credentials
    control.kubernetes_clusters_should_disable_automounting_api_credentials,

    # Private endpoint should be configured for Key Vault
    control.private_endpoint_should_be_configured_for_key_vault,

    # Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Azure Databricks Workspaces should use private link
    control.azure_databricks_workspaces_should_use_private_link,

    # Public network access on Azure SQL Database should be disabled
    control.sql_db_public_network_access_disabled,

    # Least privileged Linux capabilities should be enforced for containers
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,

    # All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,

    # Azure MySQL flexible server should have Azure Active Directory Only Authentication enabled
    control.azure_mysql_flexible_server_should_have_azure_active_directory_only_authentication_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}
