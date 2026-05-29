
benchmark "all_new_controls" {
  title = "All New Controls"

  children = [
    control.default_ip_filter_policy_should_be_deny,
    control.containers_sharing_sensitive_host_namespaces_should_be_avoided,
    control.managed_disks_should_disable_public_network_access,
    control.define_acceptable_and_unacceptable_mobile_code_technologies,
    control.automatic_iptables_management_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,
    control.api_management_should_disable_public_network_access_to_the_service_configuration_endpoints,
    control.azure_machine_learning_workspaces_should_disable_public_network_access,
    control.azure_sql_managed_instances_should_disable_public_network_access,
    control.idle_timeout_should_be_configured_on_nodes_in_azure_kubernetes_service_aks_clusters,
    control.cors_should_not_allow_every_domain_to_access_your_api_for_fhir,
    control.machines_should_have_ports_closed_that_might_expose_attack_vectors,
    control.public_network_access_should_be_disabled_for_mysql_flexible_servers,
    control.public_network_access_should_be_disabled_for_postgresql_flexible_servers,
    control.private_endpoint_connections_on_batch_accounts_should_be_enabled,
    control.app_configuration_should_disable_public_network_access,
    control.azure_cosmos_db_should_disable_public_network_access,
    control.private_endpoint_should_be_configured_for_key_vault,
    control.azure_databricks_workspaces_should_use_private_link,
    control.host_and_vm_networking_should_be_protected_on_azure_local_instances,
    control.public_network_access_should_be_disabled_for_container_registries,
    control.azure_machine_learning_computes_should_be_in_a_virtual_network,
    control.privileged_containers_should_be_avoided,
    control.azure_database_for_postgresql_should_have_an_azure_active_directory_administrator_provisioned,
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,
    control.api_management_calls_to_api_backends_should_be_authenticated,
    control.remote_debugging_should_be_turned_off_for_api_app,
    control.vtpm_should_be_enabled_on_supported_virtual_machines,
    control.azure_vpn_gateways_should_not_use_basic_sku,
    control.windows_machines_should_meet_requirements_for_administrative_templates_network_,
    control.api_management_subscriptions_should_not_be_scoped_to_all_apis,
    control.managed_identity_should_be_used_in_api_apps,
    control.identical_authentication_credentials,
    control.sql_managed_instance_should_have_the_minimal_tls_version_of_1_2,
    control.azure_sql_database_should_be_running_tls_version_1_2_or_newer,
    control.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names,
    control.tls_should_be_updated_to_the_latest_version_for_api_apps,
    control.app_configuration_should_use_a_customer_managed_key,
    control.keys_should_be_the_specified_cryptographic_type_rsa_or_ec,
    control.windows_virtual_machines_should_enable_azure_disk_encryption_or_encryptionathost_,
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,
    control.storage_account_encryption_scopes_should_use_double_encryption_for_data_at_rest,
    control.cognitive_services_accounts_should_use_customer_owned_storage_or_enable_data_encryption,
    control.cognitive_services_accounts_should_use_customer_owned_storage,
    control.azure_local_instances_should_have_encrypted_volumes,
    control.storage_account_keys_should_not_be_expired,
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings,
    control.all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings,
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers,
    control.microsoft_defender_for_open_source_relational_databases_should_be_enabled,
    control.microsoft_defender_for_sql_servers_on_machines_should_be_enabled,
    control.azure_kubernetes_service_clusters_should_have_defender_profile_enabled,
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers,
    control.machines_should_have_vulnerability_findings_resolved,
    control.edr_solution_should_be_installed_on_virtual_machines,
    control.activity_log_should_be_retained_for_at_least_one_year,
    control.machines_should_be_configured_to_periodically_check_for_missing_system_updates,
    control.dependency_agent_should_be_enabled_in_virtual_machine_scale_sets_for_listed_virtual_machine_images,
    control.github_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,
    control.machines_should_be_restarted_to_apply_security_configuration_updates,
    control.azure_machine_learning_compute_instances_should_be_recreated_to_get_the_latest_software_updates,
    control.azure_devops_repositories_should_have_code_scanning_findings_resolved,
    control.code_repositories_should_have_code_scanning_findings_resolved,
    control.azure_running_container_images_should_have_vulnerabilities_resolved,
    control.python_should_be_updated_to_the_latest_version_for_api_apps,
    control.azure_devops_repositories_should_have_secrets_scanning_findings_resolved,
    control.github_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,
    control.function_apps_should_have_vulnerability_findings_resolved,
    control.microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces,
    control.github_repositories_should_have_secrets_scanning_findings_resolved,
    control.github_repositories_should_have_code_scanning_findings_resolved,
    control.microsoft_defender_for_apis_should_be_enabled,
    control.github_repositories_should_have_dependabot_scanning_enabled,
    control.code_repositories_should_have_dependency_vulnerability_scanning_findings_resolved,
    control.azure_resource_manager_deployments_should_have_secrets_findings_resolved,
    control.php_should_be_updated_to_the_latest_version_for_api_apps,
    control.azure_devops_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,
    control.container_images_in_azure_registry_should_have_vulnerability_findings_resolved,
    control.github_security_posture_management_findings_should_be_resolved,
    control.machines_should_have_secrets_findings_resolved,
    control.machines_should_have_a_vulnerability_assessment_solution,
    control.github_repositories_should_have_code_scanning_enabled,
    control.github_repositories_should_have_secret_scanning_enabled,
    control.azure_devops_security_posture_management_findings_should_be_resolved,
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets,
    control.microsoft_defender_for_sql_status_should_be_protected_for_arc_enabled_sql_servers,
    control.microsoft_defender_cspm_should_be_enabled,
    control.service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level,
    control.azure_event_hub_namespaces_should_have_local_authentication_methods_disabled,
    control.azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only,
    control.api_endpoints_in_azure_api_management_should_be_authenticated,
    control.privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level,
    control.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days,
    control.azure_machine_learning_computes_should_have_local_authentication_methods_disabled,
    control.authorization_rules_on_the_event_hub_instance_should_be_defined,
    control.kubernetes_clusters_should_disable_automounting_api_credentials,
    control.anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters,
    control.all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace,
    control.azure_overprovisioned_identities_should_have_only_the_necessary_permissions,
    control.windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_,
    control.azure_mysql_flexible_server_should_have_azure_active_directory_only_authentication_enabled,
    control.transfer_backup_information_to_an_alternate_storage_site,
    control.separately_store_backup_information,
    control.dependency_agent_should_be_enabled_for_listed_virtual_machine_images,
    control.an_activity_log_alert_should_exist_for_specific_policy_operations,
    control.audit_flow_logs_configuration_for_every_virtual_network,
    control.azure_monitor_solution_security_and_audit_must_be_deployed,
    control.an_activity_log_alert_should_exist_for_specific_security_operations,
    control.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines,
    control.linux_virtual_machines_should_use_only_signed_and_trusted_boot_components,
    control.resource_logs_in_azure_databricks_workspaces_should_be_enabled,
    control.windows_machines_should_meet_requirements_for_system_audit_policies_policy_change_,
    control.diagnostic_logs_in_app_service_should_be_enabled,
    control.compute_vm_guest_configuration_with_azure_baseline_system_audit_policies_account_management,
    control.resource_logs_in_azure_machine_learning_workspaces_should_be_enabled,
    control.sql_auditing_settings_should_have_action_groups_configured_to_capture_critical_activities,
    control.audit_resource_location_matches_resource_group_location,
    control.linux_virtual_machines_should_enforce_kernel_module_signature_validation,
    control.edr_configuration_issues_should_be_resolved_on_virtual_machines,
    control.virtual_machines_guest_attestation_status_should_be_healthy,
    control.guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machine_scale_sets,
    control.guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines,
    control.azure_local_machines_should_meet_secured_core_requirements,
    control.code_repositories_should_have_infrastructure_as_code_scanning_findings_resolved,
    control.azure_api_management_apis_should_be_onboarded_to_defender_for_apis,
    control.linux_virtual_machines_should_use_secure_boot,
    control.diagnostic_logs_in_data_lake_analytics_should_be_enabled,
    control.diagnostic_logs_in_azure_data_lake_store_should_be_enabled,
    control.redis_cache_should_allow_access_only_via_ssl,
    control.code_repositories_should_have_secrets_scanning_findings_resolved,
    control.servers_onboarded_with_mde_should_have_vulnerability_findings_resolved,
    control.audit_vms_that_do_not_use_managed_disks,
    control.azure_ai_services_resources_should_use_azure_private_link,
    control.azure_database_for_postgresql_flexible_server_microsoft_entra_authentication_only_enabled,
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,
    control.kubernetes_cluster_should_not_use_default_namespace,
    control.kubernetes_cluster_enforce_least_privileges_for_container_linux,
    control.diagnostic_logs_in_batch_accounts_should_be_enabled,
    control.compute_vm_assessment_mamagement_ports_closed,
    control.audit_linux_machines_passwd_file_permissions_0644,
  ]
}

control "default_ip_filter_policy_should_be_deny" {
  title       = "[ASSESSMENT] Default IP Filter Policy should be Deny"

  description = <<-EOT
    The IP Filter Configuration should be set to deny all traffic by default, and only allow specific traffic as defined by rules.

    This approach means that only authorized traffic can access the system, reducing the risk of unauthorized access or potential attacks.

    If this policy is not implemented, the system could be exposed to unnecessary risks, including potential data breaches and system compromise.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "5a3d6cdd-8eb3-46d2-ba11-d24a0d47fe65",
    healthy_reason = "%s has default IP filter policy set to Deny.",
    no_data_reason = "%s has no assessment data to determine if the default IP filter policy is set to Deny.",
    unhealthy_reason = "%s does not have default IP filter policy set to Deny."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "containers_sharing_sensitive_host_namespaces_should_be_avoided" {
  title       = "[ASSESSMENT] Containers sharing sensitive host namespaces should be avoided"

  description = <<-EOT
    To protect against privilege escalation outside the container, avoid pod access to sensitive host namespaces (host process ID and host IPC)
    in a Kubernetes cluster.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "802c0637-5a8c-4c98-abd7-7c96d89d6010",
    healthy_reason = "%s does not have containers sharing sensitive host namespaces.",
    no_data_reason = "%s has no assessment data to determine if containers are sharing sensitive host namespaces.",
    unhealthy_reason = "%s has containers sharing sensitive host namespaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "managed_disks_should_disable_public_network_access" {
  title       = "[ASSESSMENT] Managed disks should disable public network access"

  description = <<-EOT
    Disabling public network access improves security by ensuring that a managed disk isn't exposed on the public internet.
    Creating private endpoints can limit exposure of managed disks. Learn more at: https://aka.ms/disksprivatelinksdoc.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "f635fb12-4c7f-e9a8-5ed1-c005728ea849",
    healthy_reason = "%s has public network access disabled for managed disks.",
    no_data_reason = "%s has no assessment data to determine if public network access is disabled for managed disks.",
    unhealthy_reason = "%s does not have public network access disabled for managed disks."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# manual control, doesn't seem to be a way to automate it
control "define_acceptable_and_unacceptable_mobile_code_technologies" {
  title       = "Define acceptable and unacceptable mobile code technologies"
  description = "CMA_C1651 - Define acceptable and unacceptable mobile code technologies."
  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "automatic_iptables_management_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters" {
  title       = "[ASSESSMENT] Automatic iptables management should be enabled on nodes in Azure Kubernetes Service (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that iptables are being managed manually on nodes in your AKS clusters.
    This poses a risk of overly permissive or restrictive network policies which can allow unauthorized access
    for attackers or block necessary communication. We recommend enabling the makeIPTablesUtilChains configuration
    option to allow kubelet to manage iptables in your AKS clusters
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ebf866af-4278-4c1e-a105-b2ba3845c22c",
    healthy_reason = "%s has automatic iptables management enabled on nodes in AKS clusters.",
    no_data_reason = "%s has no assessment data to determine if automatic iptables management is enabled on nodes in AKS clusters.",
    unhealthy_reason = "%s does not have automatic iptables management enabled on nodes in AKS clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "api_management_should_disable_public_network_access_to_the_service_configuration_endpoints" {
  title       = "[ASSESSMENT] API Management should disable public network access to the service configuration endpoints"

  description = <<-EOT
    To improve the security of API Management services, restrict connectivity to service configuration endpoints, like direct access
    management API, Git configuration management endpoint, or self-hosted gateways configuration endpoint.

    Related OWASP API Security Top 10 Risks: https://owasp.org/API-Security/editions/2023/en/0xa8-security-misconfiguration/ (API8:2023)
    Security Misconfiguration
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "e50066b7-731c-40c4-a325-9551154ee5ce",
    healthy_reason = "%s has public network access disabled to the service configuration endpoints.",
    no_data_reason = "%s has no assessment data to determine if public network access is disabled to the service configuration endpoints.",
    unhealthy_reason = "%s does not have public network access disabled to the service configuration endpoints."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_machine_learning_workspaces_should_disable_public_network_access" {
  title       = "[ASSESSMENT] Azure Machine Learning Workspaces should disable public network access"

  description = <<-EOT
    Disabling public network access improves security by ensuring that the Machine Learning Workspaces aren't exposed on the public internet.
    You can control exposure of your workspaces by creating private endpoints instead. Learn more at:
    https://learn.microsoft.com/azure/machine-learning/how-to-configure-private-link?view=azureml-api-2&tabs=azure-portal.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "a78ee063-e419-42a9-8d8f-8ec1a94f6b3e",
    healthy_reason = "%s has public network access disabled for Azure Machine Learning Workspaces.",
    no_data_reason = "%s has no assessment data to determine if public network access is disabled for Azure Machine Learning Workspaces.",
    unhealthy_reason = "%s does not have public network access disabled for Azure Machine Learning Workspaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_sql_managed_instances_should_disable_public_network_access" {
  title       = "[ASSESSMENT] Azure SQL Managed Instances should disable public network access"

  description = <<-EOT
    Disabling public network access (public endpoint) on Azure SQL Managed Instances improves security by ensuring that they can only
    be accessed from inside their virtual networks or via Private Endpoints. To learn more about public network access,
    visit https://aka.ms/mi-public-endpoint.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "a2624c52-2937-400c-af9d-3bf2d97382bf",
    healthy_reason = "%s has public network access disabled for Azure SQL Managed Instances.",
    no_data_reason = "%s has no assessment data to determine if public network access is disabled for Azure SQL Managed Instances.",
    unhealthy_reason = "%s does not have public network access disabled for Azure SQL Managed Instances."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "idle_timeout_should_be_configured_on_nodes_in_azure_kubernetes_service_aks_clusters" {
  title       = "[ASSESSMENT] Idle timeout should be configured on nodes in Azure Kubernetes Service (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that the idle timeout is disabled on nodes in your AKS clusters. This poses a risk of denial-of-service
    attacks, inactive connections, and port exhaustion. We recommend configuring an idle timeout on nodes in your clusters.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "8a3cb15a-cd98-4615-b510-bc5f416644af",
    healthy_reason = "%s has idle timeout configured on nodes in AKS clusters.",
    no_data_reason = "%s has no assessment data to determine if idle timeout is configured on nodes in AKS clusters.",
    unhealthy_reason = "%s does not have idle timeout configured on nodes in AKS clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "cors_should_not_allow_every_domain_to_access_your_api_for_fhir" {
  title       = "CORS should not allow every domain to access your API for FHIR"

  description = <<-EOT
    Cross-Origin Resource Sharing (CORS) should not allow all domains to access your API for FHIR. To protect your API
    for FHIR, remove access for all domains and explicitly define the domains allowed to connect.
  EOT

  query       = query.cors_should_not_allow_every_domain_to_access_your_api_for_fhir

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_have_ports_closed_that_might_expose_attack_vectors" {
  title       = "[ASSESSMENT] Machines should have ports closed that might expose attack vectors"

  description = <<-EOT
    Exposed ports can be exploited by threat actors to damage, disable, overburden, or impair Microsoft servers or networks,
    which is against Azure's terms of use.

    If these ports remain open, it could lead to security breaches and potential service disruption.

    Therefore, it's crucial to close these ports to maintain security and compliance with Azure's terms.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "bbff27d2-73db-4c2d-8b1a-5f20b1f1da7e",
    healthy_reason = "%s has ports closed that might expose attack vectors.",
    no_data_reason = "%s has no assessment data to determine if ports that might expose attack vectors are closed.",
    unhealthy_reason = "%s has ports open that might expose attack vectors."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "public_network_access_should_be_disabled_for_mysql_flexible_servers" {
  title       = "Public network access should be disabled for MySQL flexible servers"

  description = <<-EOT
    Disabling the public network access property improves security by ensuring your Azure Database for MySQL flexible
    servers can only be accessed from a private endpoint. This configuration strictly disables access from any public
    address space outside of Azure IP range and denies all logins that match IP or virtual network-based firewall rules.
  EOT

  query       = query.mysql_flexible_server_public_network_access_disabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "public_network_access_should_be_disabled_for_postgresql_flexible_servers" {
  title       = "Public network access should be disabled for PostgreSQL flexible servers"

  description = <<-EOT
    Disabling the public network access property improves security by ensuring your Azure Database for PostgreSQL flexible
    servers can only be accessed from a private endpoint. This configuration strictly disables access from any public address
    space outside of Azure IP range and denies all logins that match IP based firewall rules.
  EOT

  query       = query.postgresql_flexible_server_public_network_access_disabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "private_endpoint_connections_on_batch_accounts_should_be_enabled" {
  title       = "Private endpoint connections on Batch accounts should be enabled"
  description = "Private endpoint connections allow secure communication by enabling private connectivity to Batch accounts without a need for public IP addresses at the source or destination. Learn more about private endpoints in Batch at https://docs.microsoft.com/azure/batch/private-connectivity."
  query       = query.private_endpoint_connections_on_batch_accounts_should_be_enabled_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_cosmos_db_should_disable_public_network_access" {
  title       = "[ASSESSMENT] Azure Cosmos DB should disable public network access"

  description = <<-EOT
    Disabling public network access improves security by ensuring that your CosmosDB account isn't
    exposed on the public internet. Creating private endpoints can limit exposure of your CosmosDB
    account.

    Learn more at: https://docs.microsoft.com/azure/cosmos-db/how-to-configure-private-endpoints#blocking-public-network-access-during-account-creation.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "334a182c-7c2c-41bc-ae1e-55327891ab50",
    healthy_reason = "%s has public network access disabled for Azure Cosmos DB.",
    no_data_reason = "%s has no assessment data to determine if public network access is disabled for Azure Cosmos DB.",
    unhealthy_reason = "%s does not have public network access disabled for Azure Cosmos DB."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "private_endpoint_should_be_configured_for_key_vault" {
  title       = "[ASSESSMENT] Private endpoint should be configured for Key Vault"

  description = <<-EOT
    Private link provides a way to connect Key Vault to your Azure resources without sending
    traffic over the public internet. Private link provides defense in depth protection against
    data exfiltration.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "2e96bc2f-1972-e471-9e70-ae58d41e9d2a",
    healthy_reason = "%s has private endpoint configured for Key Vault.",
    no_data_reason = "%s has no assessment data to determine if private endpoint is configured for Key Vault.",
    unhealthy_reason = "%s does not have private endpoint configured for Key Vault."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_databricks_workspaces_should_use_private_link" {
  title       = "[ASSESSMENT] Azure Databricks Workspaces should use private link"

  description = <<-EOT
    Azure Private Link lets you connect your virtual networks to Azure services without a public IP
    address at the source or destination. The Private Link platform handles the connectivity between
    the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Databricks
    workspaces, you can reduce data leakage risks.

    Learn more about private links at: https://aka.ms/adbpe.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "28ca6fb2-f3b0-4494-bcfb-6600b30fec50",
    healthy_reason = "%s uses private link for Azure Databricks Workspaces.",
    no_data_reason = "%s has no assessment data to determine if private link is used for Azure Databricks Workspaces.",
    unhealthy_reason = "%s does not use private link for Azure Databricks Workspaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "host_and_vm_networking_should_be_protected_on_azure_local_instances" {
  title       = "[ASSESSMENT] Host and VM networking should be protected on Azure Local instances"

  description = <<-EOT
    Protect data on the Azure Local machines network and on virtual machine network connections.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "1e001767-5bd6-423f-9640-f61efa3d77c6",
    healthy_reason = "%s has host and VM networking protected on Azure Local instances.",
    no_data_reason = "%s has no assessment data to determine if host and VM networking is protected on Azure Local instances.",
    unhealthy_reason = "%s does not have host and VM networking protected on Azure Local instances."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "public_network_access_should_be_disabled_for_container_registries" {
  title       = "Public network access should be disabled for Container registries"
  description = "Disabling public network access improves security by ensuring that container registries are not exposed on the public internet. Creating private endpoints can limit exposure of container registry resources. Learn more at: https://aka.ms/acr/portal/public-network and https://aka.ms/acr/private-link."
  query       = query.public_network_access_should_be_disabled_for_container_registries_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_machine_learning_computes_should_be_in_a_virtual_network" {
  title       = "[ASSESSMENT] Azure Machine Learning Computes should be in a virtual network"

  description = <<-EOT
    Azure Virtual Networks provide enhanced security and isolation for your Azure Machine Learning Compute
    Clusters and Instances, as well as subnets, access control policies, and other features to further restrict
    access. When a compute is configured with a virtual network, it is not publicly addressable and can only be
    accessed from virtual machines and applications within the virtual network.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "0b712179-f61f-4e80-9286-f7eed8f08a47",
    healthy_reason = "%s has Azure Machine Learning Computes in a virtual network.",
    no_data_reason = "%s has no assessment data to determine if Azure Machine Learning Computes are in a virtual network.",
    unhealthy_reason = "%s does not have Azure Machine Learning Computes in a virtual network."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "privileged_containers_should_be_avoided" {
  title       = "[ASSESSMENT] Privileged containers should be avoided"

  description = <<-EOT
    To prevent unrestricted host access, avoid privileged containers whenever possible.

    Privileged containers have all of the root capabilities of a host machine. They can be used as entry points for attacks
    and to spread malicious code or malware to compromised applications, hosts and networks.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "5d90913f-a1c5-4429-ad54-2c6c17fb3c73",
    healthy_reason = "%s does not have privileged containers.",
    no_data_reason = "%s has no assessment data to determine if privileged containers are present.",
    unhealthy_reason = "%s has privileged containers."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_database_for_postgresql_should_have_an_azure_active_directory_administrator_provisioned" {
  title       = "[ASSESSMENT] Azure Database for PostgreSQL should have an Azure Active Directory administrator provisioned"

  description = <<-EOT
    Provision an Azure AD administrator for your Azure Database for PostgreSQL to enable Azure AD authentication. Azure AD
    authentication enables simplified permission management and centralized identity management of database users and other
    Microsoft services.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "b20d1b00-11a8-4ce7-b477-4ea6e147c345",
    healthy_reason = "%s has an Azure AD administrator provisioned for Azure Database for PostgreSQL.",
    no_data_reason = "%s has no assessment data to determine if an Azure AD administrator is provisioned for Azure Database for PostgreSQL.",
    unhealthy_reason = "%s does not have an Azure AD administrator provisioned for Azure Database for PostgreSQL."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "api_management_secret_named_values_should_be_stored_in_azure_key_vault" {
  title       = "[ASSESSMENT] API Management secret named values should be stored in Azure Key Vault"

  description = <<-EOT
    Named values are a collection of name and value pairs in each API Management service. Secret values can be stored either
    as encrypted text in API Management (custom secrets) or by referencing secrets in Azure Key Vault. To improve security of
    API Management and secrets, reference secret named values from Azure Key Vault. Azure Key Vault supports granular access
    management and secret rotation policies.

    Related OWASP API Security Top 10 Risks: https://owasp.org/API-Security/editions/2023/en/0xa8-security-misconfiguration/ (API8:2023)
    Security Misconfiguration
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "93b78b68-5f3f-46b2-acf1-c3e9e6e646d1",
    healthy_reason = "%s has API Management secret named values stored in Azure Key Vault.",
    no_data_reason = "%s has no assessment data to determine if API Management secret named values are stored in Azure Key Vault.",
    unhealthy_reason = "%s does not have API Management secret named values stored in Azure Key Vault."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters" {
  title       = "[ASSESSMENT] Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that unauthorized requests are allowed on nodes in your AKS clusters. This poses a risk of unauthorized
    access to your cluster where an attacker can access resources without going through authorization. We recommend enabling explicit request
    authorization in your AKS cluster.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "689f9ab7-5434-4664-8c02-e94c8d8e47f9",
    healthy_reason = "%s has explicit request authorization enabled on nodes in AKS clusters.",
    no_data_reason = "%s has no assessment data to determine if explicit request authorization is enabled on nodes in AKS clusters.",
    unhealthy_reason = "%s does not have explicit request authorization enabled on nodes in AKS clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "api_management_calls_to_api_backends_should_be_authenticated" {
  title       = "[ASSESSMENT] API Management calls to API backends should be authenticated"

  description = <<-EOT
    Calls from API Management to backends should use some form of authentication, whether via certificates or credentials. Does not
    apply to Service Fabric backends.

    Related OWASP API Security Top 10 Risks: https://owasp.org/API-Security/editions/2023/en/0xa2-broken-authentication/ (API2:2023) Broken Authentication,
    https://owasp.org/API-Security/editions/2023/en/0xa8-security-misconfiguration/ (API8:2023) Security Misconfiguration
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name= "2fd6b6c3-f52b-464d-a301-0d81c7b4839c",
    healthy_reason = "%s has API Management calls to API backends authenticated.",
    no_data_reason = "%s has no assessment data to determine if API Management calls to API backends are authenticated.",
    unhealthy_reason = "%s does not have API Management calls to API backends authenticated."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "remote_debugging_should_be_turned_off_for_api_app" {
  title       = "[ASSESSMENT] Remote debugging should be turned off for API App"

  description = <<-EOT
    Remote debugging requires inbound ports to be opened on an API app. Remote debugging should be turned off.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "9172da4e-9571-6e33-2b5b-d742847f3be7",
    healthy_reason = "%s has remote debugging turned off for API App.",
    no_data_reason = "%s has no assessment data to determine if remote debugging is turned off for API App.",
    unhealthy_reason = "%s does not have remote debugging turned off for API App."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "vtpm_should_be_enabled_on_supported_virtual_machines" {
  title       = "[ASSESSMENT] vTPM should be enabled on supported virtual machines"

  description = <<-EOT
    Enable virtual TPM device on supported virtual machines to facilitate Measured Boot and other OS security
    features that require a TPM. Once enabled, vTPM can be used to attest boot integrity. This assessment only
    applies to trusted launch enabled virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "861bbc73-0a55-8d1d-efc6-e92d9e1176e0",
    healthy_reason = "%s has vTPM enabled on supported virtual machines.",
    no_data_reason = "%s has no assessment data to determine if vTPM is enabled on supported virtual machines.",
    unhealthy_reason = "%s does not have vTPM enabled on supported virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - definition available but no assessment
control "azure_vpn_gateways_should_not_use_basic_sku" {
  title       = "Azure VPN gateways should not use 'basic' SKU"
  description = "This policy ensures that VPN gateways do not use 'basic' SKU."
  query       = query.azure_vpn_gateways_should_not_use_basic_sku_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - definition available but no assessment
control "windows_machines_should_meet_requirements_for_administrative_templates_network_" {
  title       = "Windows machines should meet requirements for 'Administrative Templates - Network'"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "api_management_subscriptions_should_not_be_scoped_to_all_apis" {
  title       = "[ASSESSMENT] API Management subscriptions should not be scoped to all APIs"

  description = <<-EOT
    API Management subscriptions should be scoped to a product or an individual API instead of all
    APIs, which could result in an excessive data exposure.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "44aae697-8cc1-4ed1-a136-44a644bfd51f",
    healthy_reason = "%s has API Management subscriptions not scoped to all APIs.",
    no_data_reason = "%s has no assessment data to determine if API Management subscriptions are scoped to all APIs.",
    unhealthy_reason = "%s has API Management subscriptions scoped to all APIs."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "managed_identity_should_be_used_in_api_apps" {
  title       = "[ASSESSMENT] Managed identity should be used in API apps"

  description = <<-EOT
    Using a managed identity in API apps on Azure significantly enhances authentication security.

    Managed identities provide an identity for the Azure resource in Azure AD, which is used to obtain Azure AD
    tokens, eliminating the need for developers to manage credentials.

    Without this, the management of credentials could become complex and potentially lead to security vulnerabilities.

    Therefore, we recommend to use managed identities in API apps to ensure secure and efficient authentication.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "cc6d1865-7617-3cb2-cf7d-4cfc01ece1df",
    healthy_reason = "%s uses managed identity in API apps.",
    no_data_reason = "%s has no assessment data to determine if managed identity is used in API apps.",
    unhealthy_reason = "%s does not use managed identity in API apps."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "identical_authentication_credentials" {
  title       = "[ASSESSMENT] Identical Authentication Credentials"

  description = <<-EOT
    The use of identical authentication credentials across multiple devices connected to the IoT Hub poses a significant
    security risk.

    This practice could allow an illegitimate device to impersonate a legitimate one, or enable an attacker to impersonate a
    device.

    If not addressed, this could lead to unauthorized access and potential manipulation of the IoT Hub and connected devices.

    It is crucial to use unique authentication credentials for each device to prevent such security breaches.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "9d07b7e6-2986-4964-a76c-b2689604e212",
    healthy_reason = "%s does not have identical authentication credentials across multiple devices connected to the IoT Hub.",
    no_data_reason = "%s has no assessment data to determine if identical authentication credentials are used across multiple devices connected to the IoT Hub.",
    unhealthy_reason = "%s has identical authentication credentials across multiple devices connected to the IoT Hub."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "windows_machines_should_meet_requirements_for_security_settings_account_policies_" {
  title       = "Windows machines should meet requirements for 'Security Settings - Account Policies'"
  description = "Windows machines should have the specified Group Policy settings in the category 'Security Settings - Account Policies' for password history, age, length, complexity, and storing passwords using reversible encryption. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol."
  query       = query.windows_machines_should_meet_requirements_for_security_settings_account_policies_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "sql_managed_instance_should_have_the_minimal_tls_version_of_1_2" {
  title       = "SQL Managed Instance should have the minimal TLS version of 1.2"
  description = "Setting minimal TLS version to 1.2 improves security by ensuring your SQL Managed Instance can only be accessed from clients using TLS 1.2. Using versions of TLS less than 1.2 is not recommended since they have well documented security vulnerabilities."
  query       = query.sql_managed_instance_should_have_the_minimal_tls_version_of_1_2_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_sql_database_should_be_running_tls_version_1_2_or_newer" {
  title       = "[ASSESSMENT] Azure SQL Database should be running TLS version 1.2 or newer"

  description = <<-EOT
    Setting TLS version to 1.2 or newer improves security by ensuring your Azure SQL Database
    can only be accessed from clients using TLS 1.2 or newer. Using versions of TLS less than 1.2
    is not recommended since they have well documented security vulnerabilities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "8e9a37b9-2828-4c8f-a24e-7b0ab0e89c78",
    healthy_reason = "%s is running TLS version 1.2 or newer for Azure SQL Database.",
    no_data_reason = "%s has no assessment data to determine if TLS version 1.2 or newer is running for Azure SQL Database.",
    unhealthy_reason = "%s is not running TLS version 1.2 or newer for Azure SQL Database."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names" {
  title       = "Keys using elliptic curve cryptography should have the specified curve names"
  description = "Keys backed by elliptic curve cryptography can have different curve names. Some applications are only compatible with specific elliptic curve keys. Enforce the types of elliptic curve keys that are allowed to be created in your environment."
  query       = query.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "tls_should_be_updated_to_the_latest_version_for_api_apps" {
  title       = "[ASSESSMENT] TLS should be updated to the latest version for API apps"

  description = <<-EOT
    The Transport Layer Security (TLS) protocol provides secure communication between web applications and servers.

    Using outdated versions of TLS can expose the system to vulnerabilities and potential attacks.

    By updating to the latest version, you can ensure the highest level of security for your API apps.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "5a659d57-117d-bb18-65f6-54e51da1bb9b",
    healthy_reason = "%s has TLS updated to the latest version for API apps.",
    no_data_reason = "%s has no assessment data to determine if TLS is updated to the latest version for API apps.",
    unhealthy_reason = "%s does not have TLS updated to the latest version for API apps."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "app_configuration_should_use_a_customer_managed_key" {
  title       = "App Configuration should use a customer-managed key"
  description = "Customer-managed keys provide enhanced data protection by allowing you to manage your encryption keys. This is often required to meet compliance requirements."
  query       = query.app_configuration_should_use_a_customer_managed_key_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "keys_should_be_the_specified_cryptographic_type_rsa_or_ec" {
  title       = "Keys should be the specified cryptographic type RSA or EC"
  description = "Some applications require the use of keys backed by a specific cryptographic type. Enforce a particular cryptographic key type, RSA or EC, in your environment."
  query       = query.keys_should_be_the_specified_cryptographic_type_rsa_or_ec_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "windows_virtual_machines_should_enable_azure_disk_encryption_or_encryptionathost_" {
  title       = "[ASSESSMENT] Windows virtual machines should enable Azure Disk Encryption or EncryptionAtHost."

  description = <<-EOT
    Although a virtual machine's OS and data disks are encrypted-at-rest by default using platform managed keys;
    resource disks (temp disks), data caches, and data flowing between Compute and Storage resources are not encrypted.
    Use Azure Disk Encryption or EncryptionAtHost to remediate. <br> To compare encryption offerings, visit
    https://aka.ms/diskencryptioncomparison.

    This policy uses Guest Configuration and requires two pre-requisites to be deployed to the policy assignment scope.
    For details, visit https://aka.ms/gcpol for guest config onboarding.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "0cb5f317-a94b-6b80-7212-13a9cc8826af",
    healthy_reason = "%s has Azure Disk Encryption or EncryptionAtHost enabled on Windows virtual machines.",
    no_data_reason = "%s has no assessment data to determine if Azure Disk Encryption or EncryptionAtHost is enabled on Windows virtual machines.",
    unhealthy_reason = "%s does not have Azure Disk Encryption or EncryptionAtHost enabled on Windows virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest" {
  title       = "[ASSESSMENT] [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest"

  description = <<-EOT
    Using customer-managed keys for encrypting data at rest provides increased transparency, control over the TDE Protector,
    enhanced security with an HSM-backed external service, and promotes separation of duties.

    This is not assessed by default and should only be applied when required by compliance or restrictive policy requirements.

    If not enabled, the data will be encrypted using platform-managed keys.

    This is particularly relevant for organizations with related compliance requirements.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "06ac6ef4-1e66-1334-5418-6e79ab444ce0",
    healthy_reason = "%s uses customer-managed keys to encrypt data at rest on SQL managed instances.",
    no_data_reason = "%s has no assessment data to determine if customer-managed keys are used to encrypt data at rest on SQL managed instances.",
    unhealthy_reason = "%s does not use customer-managed keys to encrypt data at rest on SQL managed instances."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "storage_account_encryption_scopes_should_use_double_encryption_for_data_at_rest" {
  title       = "Storage account encryption scopes should use double encryption for data at rest"
  description = "Enable infrastructure encryption for encryption at rest of your storage account encryption scopes for added security. Infrastructure encryption ensures that your data is encrypted twice."
  query       = query.storage_account_infrastructure_encryption_enabled

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# NOTE: This is deprecated
control "cognitive_services_accounts_should_use_customer_owned_storage_or_enable_data_encryption" {
  title       = "[ASSESSMENT] Cognitive Services accounts should use customer owned storage or enable data encryption"

  description = <<-EOT
    This policy audits any Cognitive Services account not using customer owned storage nor data encryption.
    For each Cognitive Services account with storage, use either customer owned storage or enable data encryption.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "aa395469-1687-78a7-bf76-f4614ef72977",
    healthy_reason = "%s uses customer owned storage or has data encryption enabled for Cognitive Services accounts.",
    no_data_reason = "%s has no assessment data to determine if customer owned storage is used or data encryption is enabled for Cognitive Services accounts.",
    unhealthy_reason = "%s does not use customer owned storage nor has data encryption enabled for Cognitive Services accounts."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "cognitive_services_accounts_should_use_customer_owned_storage" {
  title       = "Cognitive Services accounts should use customer owned storage"
  description = "Use customer owned storage to control the data stored at rest in Cognitive Services. To learn more about customer owned storage, visit https://aka.ms/cogsvc-cmk."
  query       = query.cognitive_services_accounts_should_use_customer_owned_storage_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_local_instances_should_have_encrypted_volumes" {
  title       = "[ASSESSMENT] Azure Local instances should have encrypted volumes"

  description = <<-EOT
    Use BitLocker to encrypt the OS and data volumes on Azure Local instances.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "3ae946fb-cc91-4074-aa0d-09f0a09751fe",
    healthy_reason = "%s has encrypted volumes on Azure Local instances.",
    no_data_reason = "%s has no assessment data to determine if encrypted volumes are present on Azure Local instances.",
    unhealthy_reason = "%s does not have encrypted volumes on Azure Local instances."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - We get the last rotation time in the azure_storage_account table, but we don't get any expiry period, only for SAS keys
control "storage_account_keys_should_not_be_expired" {
  title       = "Storage account keys should not be expired"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters" {
  title       = "[ASSESSMENT] Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that server certificate rotation is not enabled on your AKS clusters. This poses a risk
    of the kubelet suffering downtime due to an expired certificate. We recommend enabling the RotateKubeletServerCertificate
    setting on your AKS clusters.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "250248d1-640a-46dc-8fd7-e6ea559352bc",
    healthy_reason = "%s has server certificate rotation enabled on nodes in AKS clusters.",
    no_data_reason = "%s has no assessment data to determine if server certificate rotation is enabled on nodes in AKS clusters.",
    unhealthy_reason = "%s does not have server certificate rotation enabled on nodes in AKS clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "all_advanced_threat_protection_types_should_be_enabled_in_sql_server_advanced_data_security_settings" {
  title       = "[ASSESSMENT] All advanced threat protection types should be enabled in SQL server advanced data security settings"

  description = <<-EOT
    It is recommended to enable all advanced threat protection types on your SQL servers. Enabling all types protects
    against SQL injection, database vulnerabilities, and any other anomalous activities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "f7010359-8d21-4598-a9f2-c3e81a17141e",
    healthy_reason = "%s has all advanced threat protection types enabled in SQL server advanced data security settings.",
    no_data_reason = "%s has no assessment data to determine if all advanced threat protection types are enabled in SQL server advanced data security settings.",
    unhealthy_reason = "%s does not have all advanced threat protection types enabled in SQL server advanced data security settings."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "all_advanced_threat_protection_types_should_be_enabled_in_sql_managed_instance_advanced_data_security_settings" {
  title       = "[ASSESSMENT] All advanced threat protection types should be enabled in SQL managed instance advanced data security settings"

  description = <<-EOT
    It is recommended to enable all advanced threat protection types on your SQL managed instances. Enabling all types
    protects against SQL injection, database vulnerabilities, and any other anomalous activities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ebe970fe-9c27-4dd7-a165-1e943d565e10",
    healthy_reason = "%s has all advanced threat protection types enabled in SQL managed instance advanced data security settings.",
    no_data_reason = "%s has no assessment data to determine if all advanced threat protection types are enabled in SQL managed instance advanced data security settings.",
    unhealthy_reason = "%s does not have all advanced threat protection types enabled in SQL managed instance advanced data security settings."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_sql_should_be_enabled_for_unprotected_postgresql_flexible_servers" {
  title       = "[ASSESSMENT] Microsoft Defender for SQL should be enabled for unprotected PostgreSQL flexible servers"

  description = <<-EOT
    Microsoft Defender for SQL is a unified package that provides advanced SQL security capabilities. It surfaces and mitigates
    potential database vulnerabilities, and detects anomalous activities that could indicate a threat to your database. Microsoft Defender
    for SQL is billed as shown on https://aka.ms/pricing-security-center for pricing details per region.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "bf2541d8-2d82-4cf3-a4e8-ed1137c90773",
    healthy_reason = "%s has Microsoft Defender for SQL enabled for unprotected PostgreSQL flexible servers.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for SQL is enabled for unprotected PostgreSQL flexible servers.",
    unhealthy_reason = "%s does not have Microsoft Defender for SQL enabled for unprotected PostgreSQL flexible servers."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_open_source_relational_databases_should_be_enabled" {
  title       = "[ASSESSMENT] Microsoft Defender for open-source relational databases should be enabled"
  description = <<-EOT
    Microsoft Defender for open-source relational databases identifies and alerts on anomalous activities that could indicate attempts to exploit databases.
    Enabling this plan will incur charges for any open-source relational databases on the subscription.
    If there are no open-source relational databases in the subscription, no charges will be applied.
    Future databases created under this subscription will automatically be protected, and charges will apply from that point.
    If this plan is not enabled, the databases may be vulnerable to harmful access or exploitation attempts.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "b6a28450-dd5d-4ba4-8806-245e20ef6632",
    healthy_reason = "%s has Microsoft Defender for open-source relational databases enabled.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for open-source relational databases is enabled.",
    unhealthy_reason = "%s does not have Microsoft Defender for open-source relational databases enabled."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_sql_servers_on_machines_should_be_enabled" {
  title       = "[ASSESSMENT] Microsoft Defender for SQL servers on machines should be enabled"
  description = "Microsoft Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous activities that could indicate threats to SQL databases, and discovering and classifying sensitive data."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "6ac66a74-761f-4a59-928a-d373eea3f028",
    healthy_reason = "%s has Microsoft Defender for SQL servers on machines enabled.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for SQL servers on machines is enabled.",
    unhealthy_reason = "%s does not have Microsoft Defender for SQL servers on machines enabled."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_kubernetes_service_clusters_should_have_defender_profile_enabled" {
  title       = "[ASSESSMENT] Azure Kubernetes Service clusters should have Defender profile enabled"

  description = <<-EOT
    Microsoft Defender for Containers provides cloud-native Kubernetes security capabilities including
    environment hardening, workload protection, and run-time protection.

    When you enable the SecurityProfile.AzureDefender profile on your Azure Kubernetes Service cluster,
    an agent is deployed to your cluster to collect security event data.

    Learn more about [Microsoft Defender for Containers](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-containers-introduction?tabs=defender-for-container-arch-aks#architecture-overview).
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "56a83a6e-c417-42ec-b567-1e6fcb3d09a9",
    healthy_reason = "%s has Defender profile enabled on Azure Kubernetes Service clusters.",
    no_data_reason = "%s has no assessment data to determine if Defender profile is enabled on Azure Kubernetes Service clusters.",
    unhealthy_reason = "%s does not have Defender profile enabled on Azure Kubernetes Service clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_sql_should_be_enabled_for_unprotected_mysql_flexible_servers" {
  title       = "[ASSESSMENT] Microsoft Defender for SQL should be enabled for unprotected MySQL flexible servers"

  description = <<-EOT
    Microsoft Defender for SQL is a unified package that provides advanced SQL security capabilities. It surfaces and
    mitigates potential database vulnerabilities, and detects anomalous activities that could indicate a threat to your
    database. Microsoft Defender for SQL is billed as shown on [pricing details per region](https://aka.ms/pricing-security-center).
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "41f5d060-b585-4780-918e-c31fe9821d02",
    healthy_reason = "%s has Microsoft Defender for SQL enabled for unprotected MySQL flexible servers.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for SQL is enabled for unprotected MySQL flexible servers.",
    unhealthy_reason = "%s does not have Microsoft Defender for SQL enabled for unprotected MySQL flexible servers."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_have_vulnerability_findings_resolved" {
  title       = "[ASSESSMENT] Machines should have vulnerability findings resolved"

  description = <<-EOT
    Resolving vulnerability findings on virtual machines is a recommended step in maintaining a secure environment.

    These findings, identified by vulnerability assessment solutions, highlight potential weaknesses that could be exploited by malicious actors.

    If these vulnerabilities are not addressed, they could lead to unauthorized access, data breaches, or even system failure.

    Therefore, it is important to resolve these findings promptly to ensure the security and integrity of the virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "1195afff-c881-495e-9bc5-1486211ae03f",
    healthy_reason = "%s has vulnerability findings resolved on machines.",
    no_data_reason = "%s has no assessment data to determine if vulnerability findings are resolved on machines.",
    unhealthy_reason = "%s does not have vulnerability findings resolved on machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "edr_solution_should_be_installed_on_virtual_machines" {
  title       = "[ASSESSMENT] EDR solution should be installed on Virtual Machines"

  description = <<-EOT
    Installing an Endpoint Detection and Response (EDR) solution on virtual machines is important for protection against advanced threats.

    EDRs aid in preventing, detecting, investigating, and responding to these threats.

    Microsoft Defender for Servers can be used to deploy Microsoft Defender for Endpoint.

    If a resource is classified as "Unhealthy", it indicates the absence of a
    [supported EDR solution](https://learn.microsoft.com/en-us/azure/defender-for-cloud/endpoint-detection-response#supported-solutions-and-platforms).

    If an EDR solution is installed but not discoverable by this recommendation, it can be exempted.

    Without an EDR solution, the virtual machines are at risk of advanced threats.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "06e3a6db-6c0c-4ad9-943f-31d9d73ecf6c",
    healthy_reason = "%s has an EDR solution installed on Virtual Machines.",
    no_data_reason = "%s has no assessment data to determine if an EDR solution is installed on Virtual Machines.",
    unhealthy_reason = "%s does not have an EDR solution installed on Virtual Machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "activity_log_should_be_retained_for_at_least_one_year" {
  title       = "Activity log should be retained for at least one year"

  description = <<-EOT
    This policy audits the activity log if the retention is not set for 365 days or forever (retention days set to 0).
  EOT

  query       = query.activity_log_should_be_retained_for_at_least_one_year

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_be_configured_to_periodically_check_for_missing_system_updates" {
  title       = "[ASSESSMENT] Machines should be configured to periodically check for missing system updates"

  description = <<-EOT
    To ensure periodic assessments for missing system updates are triggered automatically, the AssessmentMode property should
    be set to 'AutomaticByPlatform'. [Learn more.](https://aka.ms/aumv2documentation)
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "90386950-71ca-4357-a12e-486d1679427c",
    healthy_reason = "%s is configured to periodically check for missing system updates on machines.",
    no_data_reason = "%s has no assessment data to determine if it is configured to periodically check for missing system updates on machines.",
    unhealthy_reason = "%s is not configured to periodically check for missing system updates on machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "dependency_agent_should_be_enabled_in_virtual_machine_scale_sets_for_listed_virtual_machine_images" {
  title       = "Dependency agent should be enabled in virtual machine scale sets for listed virtual machine images"
  description = "This control is currently unimplemented."
  query       = query.dependency_agent_should_be_enabled_in_virtual_machine_scale_sets_for_listed_virtual_machine_images

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_dependency_vulnerability_scanning_findings_resolved" {
  title       = "[ASSESSMENT] GitHub repositories should have dependency vulnerability scanning findings resolved"

  description = <<-EOT
    Dependency vulnerabilities in GitHub repositories pose a significant security risk.

    These vulnerabilities can be exploited by attackers to compromise the code, potentially leading to unauthorized
    access or data breaches.

    Resolving these findings through remediation strategies such as patching or updating the dependencies can significantly
    improve the security posture of the repositories.

    Failure to do so may leave the repositories and the code they contain susceptible to attacks.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "945f7b1c-8def-4ab3-a44d-1416060104b3",
    healthy_reason = "%s has dependency vulnerability scanning findings resolved in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if dependency vulnerability scanning findings are resolved in GitHub repositories.",
    unhealthy_reason = "%s does not have dependency vulnerability scanning findings resolved in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_be_restarted_to_apply_security_configuration_updates" {
  title       = "[ASSESSMENT] Machines should be restarted to apply security configuration updates"

  description = <<-EOT
    Restarting machines is necessary to apply security configuration updates and protect against vulnerabilities.

    This is particularly applicable to Linux virtual machines with the Azure Monitor Agent installed.

    If not done, the system may remain exposed to potential security threats.

    It's crucial to regularly restart these machines to ensure the latest security configurations are in effect and the
    system is safeguarded against known vulnerabilities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "d79a60ef-d490-484e-91ed-f45ceb0e7cfb",
    healthy_reason = "%s has machines restarted to apply security configuration updates.",
    no_data_reason = "%s has no assessment data to determine if machines are restarted to apply security configuration updates.",
    unhealthy_reason = "%s does not have machines restarted to apply security configuration updates."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_machine_learning_compute_instances_should_be_recreated_to_get_the_latest_software_updates" {
  title       = "[ASSESSMENT] Azure Machine Learning compute instances should be recreated to get the latest software updates"

  description = <<-EOT
    Ensure Azure Machine Learning compute instances run on the latest available operating system. Security is improved and
    vulnerabilities reduced by running with the latest security patches. For more information, visit http://aka.ms/azureml-ci-updates/.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ce998c5a-e92a-4893-bbdd-4e1c940363a3",
    healthy_reason = "%s has Azure Machine Learning compute instances recreated to get the latest software updates.",
    no_data_reason = "%s has no assessment data to determine if Azure Machine Learning compute instances are recreated to get the latest software updates.",
    unhealthy_reason = "%s does not have Azure Machine Learning compute instances recreated to get the latest software updates."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_devops_repositories_should_have_code_scanning_findings_resolved" {
  title       = "[ASSESSMENT] Azure DevOps repositories should have code scanning findings resolved"

  description = <<-EOT
    The Azure DevOps repositories contain vulnerabilities which can be exploited by attackers to compromise the system or
    gain unauthorized access.<br>To reduce the risk of security breaches and enhance the security posture, resolve these
    code scanning findings.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "99232bb2-9b21-4bbb-8e3c-763673b9923d",
    healthy_reason = "%s has code scanning findings resolved in Azure DevOps repositories.",
    no_data_reason = "%s has no assessment data to determine if code scanning findings are resolved in Azure DevOps repositories.",
    unhealthy_reason = "%s does not have code scanning findings resolved in Azure DevOps repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - didn't find a definition or assessment
control "code_repositories_should_have_code_scanning_findings_resolved" {
  title       = "Code repositories should have code scanning findings resolved"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_running_container_images_should_have_vulnerabilities_resolved" {
  title       = "[ASSESSMENT] Azure running container images should have vulnerabilities resolved"

  description = <<-EOT
    Container image vulnerability assessment scans your registry for commonly known vulnerabilities (CVEs) and provides
    a detailed vulnerability report for each image. This recommendation provides visibility to vulnerable images currently
    running in your Kubernetes clusters. Remediating vulnerabilities in container images that are currently running is
    key to improving your security posture, significantly reducing the attack surface for your containerized workloads.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "c609cf0f-71ab-41e9-a3c6-9a1f7fe1b8d5",
    healthy_reason = "%s has vulnerabilities resolved in Azure running container images.",
    no_data_reason = "%s has no assessment data to determine if vulnerabilities are resolved in Azure running container images.",
    unhealthy_reason = "%s does not have vulnerabilities resolved in Azure running container images."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "python_should_be_updated_to_the_latest_version_for_api_apps" {
  title       = "[ASSESSMENT] Python should be updated to the latest version for API apps"

  description = <<-EOT
    It's important to regularly update the Python software used in API apps to the latest version. Newer versions often
    include security fixes and additional functionalities.<br> If not updated, the API apps may be exposed to security
    vulnerabilities present in older versions, potentially leading to breaches.

    Staying updated ensures the apps benefit from the latest security patches and features.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "c2c90d64-38e2-e984-1457-7f4a98168c72",
    healthy_reason = "%s has Python updated to the latest version for API apps.",
    no_data_reason = "%s has no assessment data to determine if Python is updated to the latest version for API apps.",
    unhealthy_reason = "%s does not have Python updated to the latest version for API apps."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_devops_repositories_should_have_secrets_scanning_findings_resolved" {
  title       = "[ASSESSMENT] Azure DevOps repositories should have secrets scanning findings resolved"

  description = <<-EOT
    The presence of secrets in Azure DevOps repositories poses a significant security risk.

    If these secrets are leaked or discovered by threat actors, it could lead to a compromise of the application or service.

    The Microsoft Security DevOps credential scanning tool can help identify these secrets, but it only scans builds where
    it has been configured to run.

    Therefore, it's crucial to resolve secret scanning findings to ensure the complete security of your repositories.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "b5ef903f-8655-473b-9784-4f749eeb25c6",
    healthy_reason = "%s has secrets scanning findings resolved in Azure DevOps repositories.",
    no_data_reason = "%s has no assessment data to determine if secrets scanning findings are resolved in Azure DevOps repositories.",
    unhealthy_reason = "%s does not have secrets scanning findings resolved in Azure DevOps repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_infrastructure_as_code_scanning_findings_resolved" {
  title       = "[ASSESSMENT] GitHub repositories should have infrastructure as code scanning findings resolved"

  description = <<-EOT
    The security configuration issues detected in the GitHub repositories' infrastructure as code (IaC) templates need to be resolved.

    These issues can potentially compromise the security posture of the related cloud resources.

    If left unaddressed, they could lead to vulnerabilities in the infrastructure, making it susceptible to attacks.

    Therefore, it's crucial to remediate these issues to enhance the overall security of the cloud resources.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "d9be0ff8-3eb0-4348-82f6-c1e735f85983",
    healthy_reason = "%s has infrastructure as code scanning findings resolved in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if infrastructure as code scanning findings are resolved in GitHub repositories.",
    unhealthy_reason = "%s does not have infrastructure as code scanning findings resolved in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "function_apps_should_have_vulnerability_findings_resolved" {
  title       = "[ASSESSMENT] Function apps should have vulnerability findings resolved"

  description = <<-EOT
    Runtime vulnerability scanning is a crucial security measure for function apps.

    It scans your apps for potential security vulnerabilities and provides detailed findings.

    If these vulnerabilities are not resolved, your serverless applications could be at risk of attacks, compromising
    their security posture.

    Therefore, it is important to address and resolve these findings to protect your applications from potential threats.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "afd071f0-ebaa-422b-bb2f-8a772a31db75",
    healthy_reason = "%s has vulnerability findings resolved in function apps.",
    no_data_reason = "%s has no assessment data to determine if vulnerability findings are resolved in function apps.",
    unhealthy_reason = "%s does not have vulnerability findings resolved in function apps."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_sql_should_be_enabled_for_unprotected_azure_synapse_workspaces" {
  title       = "[ASSESSMENT] Microsoft Defender for SQL should be enabled for unprotected Azure Synapse workspaces"

  description = <<-EOT
    Microsoft Defender for SQL is a unified package that provides advanced SQL security capabilities. It identifies potential
    database vulnerabilities, helps you mitigate those vulnerabilities, and detects anomalous activities that could indicate
    compromises to your database. Microsoft Defender for SQL is billed as shown on [pricing details per region](https://aka.ms/pricing-defender-for-cloud).
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ae7329f0-b676-4c8b-8c69-45f4e29ba304",
    healthy_reason = "%s has Microsoft Defender for SQL enabled for unprotected Azure Synapse workspaces.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for SQL is enabled for unprotected Azure Synapse workspaces.",
    unhealthy_reason = "%s does not have Microsoft Defender for SQL enabled for unprotected Azure Synapse workspaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_secrets_scanning_findings_resolved" {
  title       = "[ASSESSMENT] GitHub repositories should have secrets scanning findings resolved"

  description = <<-EOT
    The presence of secrets in GitHub repositories poses a significant security risk as they can be leaked or discovered by threat
    actors, leading to potential compromise of an application or service.

    The Microsoft Security DevOps credential scanning tool for Azure DevOps only scans builds it's configured to run on, so the complete
    status of secrets in your repositories may not be fully reflected.

    Immediate remediation is necessary to prevent a security breach.

    Resolving secret scanning findings is crucial to maintain the integrity and security of your repositories.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "dd98425c-1407-40cc-8a2c-da5d0a2f80da",
    healthy_reason = "%s has secrets scanning findings resolved in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if secrets scanning findings are resolved in GitHub repositories.",
    unhealthy_reason = "%s does not have secrets scanning findings resolved in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_code_scanning_findings_resolved" {
  title       = "[ASSESSMENT] GitHub repositories should have code scanning findings resolved"

  description = <<-EOT
    The presence of vulnerabilities in GitHub code repositories can pose a significant security risk.

    These vulnerabilities should be resolved to enhance the security posture of the repositories.

    If left unaddressed, these vulnerabilities could be exploited by malicious actors, leading to potential data breaches or system compromises.

    Therefore, it is crucial to perform code scanning and remediate any findings to ensure the security of the repositories.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "18aa4e75-776a-4296-97f0-fe1cf10d679c",
    healthy_reason = "%s has code scanning findings resolved in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if code scanning findings are resolved in GitHub repositories.",
    unhealthy_reason = "%s does not have code scanning findings resolved in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_apis_should_be_enabled" {
  title       = "Microsoft Defender for APIs should be enabled"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_dependabot_scanning_enabled" {
  title       = "[ASSESSMENT] GitHub repositories should have Dependabot scanning enabled"

  description = <<-EOT
    Dependabot scanning in GitHub repositories is a crucial security feature that alerts users to vulnerabilities in code dependencies.

    These vulnerabilities can compromise the confidentiality, integrity, or availability of the project or other projects that use its code.

    If Dependabot scanning is not enabled, these vulnerabilities may go unnoticed, potentially leading to severe security breaches.

    Therefore, it is highly recommend to enable Dependabot scanning to maintain a secure codebase.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "401f9e0b-56f1-4750-bc90-ed8ae093529d",
    healthy_reason = "%s has Dependabot scanning enabled in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if Dependabot scanning is enabled in GitHub repositories.",
    unhealthy_reason = "%s does not have Dependabot scanning enabled in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "code_repositories_should_have_dependency_vulnerability_scanning_findings_resolved" {
  title       = "[ASSESSMENT] Code repositories should have dependency vulnerability scanning findings resolved"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_resource_manager_deployments_should_have_secrets_findings_resolved" {
  title       = "[ASSESSMENT] Azure Resource Manager deployments should have secrets findings resolved"

  description = <<-EOT
    Secrets have been found in Azure Resource Manager deployments. This should be remediated immediately to prevent a security
    breach. Secrets found in deployments can be leaked or discovered by threat actors, leading to compromise of an application
    or service.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "774dd8dd-234d-4581-8dcc-376a53e58a5d",
    healthy_reason = "%s has secrets findings resolved in Azure Resource Manager deployments.",
    no_data_reason = "%s has no assessment data to determine if secrets findings are resolved in Azure Resource Manager deployments.",
    unhealthy_reason = "%s does not have secrets findings resolved in Azure Resource Manager deployments."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "php_should_be_updated_to_the_latest_version_for_api_apps" {
  title       = "[ASSESSMENT] PHP should be updated to the latest version for API apps"

  description = <<-EOT
    It's important to regularly update the PHP software used in API apps to the latest version.

    Newer versions often include security fixes and additional functionalities.

    If not updated, the API apps may be exposed to security vulnerabilities present in older versions, potentially leading to breaches.

    Additionally, staying updated allows the apps to benefit from the new features and improvements introduced in the latest versions.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "6b86d069-b3c3-b4d7-47c7-e73ddf786a63",
    healthy_reason = "%s has PHP updated to the latest version for API apps.",
    no_data_reason = "%s has no assessment data to determine if PHP is updated to the latest version for API apps.",
    unhealthy_reason = "%s does not have PHP updated to the latest version for API apps."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_devops_repositories_should_have_infrastructure_as_code_scanning_findings_resolved" {
  title       = "[ASSESSMENT] Azure DevOps repositories should have infrastructure as code scanning findings resolved"

  description = <<-EOT
    Security configuration issues have been detected in the Infrastructure as Code (IaC) within Azure DevOps repositories.

    These issues, found in template files, can potentially compromise the security posture of related cloud resources.

    To enhance security, we recommend that you resolve these scanning findings.

    If left unresolved, these issues could lead to vulnerabilities that may be exploited, compromising the integrity and security of the cloud resources.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "6588c4d4-fbbb-4fb8-be45-7c2de7dc1b3b",
    healthy_reason = "%s has infrastructure as code scanning findings resolved in Azure DevOps repositories.",
    no_data_reason = "%s has no assessment data to determine if infrastructure as code scanning findings are resolved in Azure DevOps repositories.",
    unhealthy_reason = "%s does not have infrastructure as code scanning findings resolved in Azure DevOps repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "container_images_in_azure_registry_should_have_vulnerability_findings_resolved" {
  title       = "Container images in Azure registry should have vulnerability findings resolved"
  description = "This control is currently unimplemented."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "c0b7cfc6-3172-465a-b378-53c7ff2cc0d5",
    healthy_reason = "%s has vulnerability findings resolved in container images in Azure registry.",
    no_data_reason = "%s has no assessment data to determine if vulnerability findings are resolved in container images in Azure registry.",
    unhealthy_reason = "%s does not have vulnerability findings resolved in container images in Azure registry."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_security_posture_management_findings_should_be_resolved" {
  title       = "[ASSESSMENT] GitHub security posture management findings should be resolved"

  description = <<-EOT
    Defender for DevOps security posture management checks are designed to ensure the secure configuration of GitHub artifacts,
    including repo settings, branch settings, alert configurations, and self-hosted runners.

    If these findings are not resolved, it could lead to potential security vulnerabilities, such as unauthorized access or changes
    to your repositories.

    Therefore, it's crucial to address these findings to maintain a secure GitHub environment.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "fd104c01-29d0-428d-bb62-2c936addd2cf",
    healthy_reason = "%s has GitHub security posture management findings resolved.",
    no_data_reason = "%s has no assessment data to determine if GitHub security posture management findings are resolved.",
    unhealthy_reason = "%s does not have GitHub security posture management findings resolved."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_have_secrets_findings_resolved" {
  title       = "[ASSESSMENT] Machines should have secrets findings resolved"

  description = <<-EOT
    Resolving secrets findings on virtual machines is a critical security measure.

    Secret scanning solutions identify sensitive data such as passwords, API keys, or tokens that may be exposed.

    If these findings are not addressed, it could lead to unauthorized access or misuse of sensitive data.

    Therefore, it is important to resolve these findings to protect the virtual machines from potential security threats.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "17618b1a-ed14-49bb-b37f-9f8ba967be8b",
    healthy_reason = "%s has secrets findings resolved on machines.",
    no_data_reason = "%s has no assessment data to determine if secrets findings are resolved on machines.",
    unhealthy_reason = "%s does not have secrets findings resolved on machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "machines_should_have_a_vulnerability_assessment_solution" {
  title       = "[ASSESSMENT] Machines should have a vulnerability assessment solution"

  description = <<-EOT
    Defender for Cloud regularly checks your connected machines to ensure they're running vulnerability assessment tools.
    Use this recommendation to deploy a vulnerability assessment solution.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ffff0522-1e88-47fc-8382-2a80ba848f5d",
    healthy_reason = "%s has a vulnerability assessment solution on machines.",
    no_data_reason = "%s has no assessment data to determine if it has a vulnerability assessment solution on machines.",
    unhealthy_reason = "%s does not have a vulnerability assessment solution on machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_code_scanning_enabled" {
  title       = "[ASSESSMENT] GitHub repositories should have code scanning enabled"

  description = <<-EOT
    GitHub's code scanning feature is a powerful tool for identifying security vulnerabilities and errors in code.

    It allows for the detection, triage, and prioritization of fixes for existing issues, and can help prevent the introduction of new ones.

    Scans can be scheduled or triggered by specific repository events.

    If a potential vulnerability is found, an alert is displayed in the repository.

    Without this feature enabled, projects may be at risk of exploitation, potentially compromising the confidentiality, integrity, or
    availability of the project.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "f4bb6c3f-781d-4311-a320-6d04465e3f2b",
    healthy_reason = "%s has code scanning enabled in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if code scanning is enabled in GitHub repositories.",
    unhealthy_reason = "%s does not have code scanning enabled in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "github_repositories_should_have_secret_scanning_enabled" {
  title       = "[ASSESSMENT] GitHub repositories should have secret scanning enabled"

  description = <<-EOT
    Secret scanning scans the entire Git history across all branches for any accidentally committed secrets, such as tokens
    and private keys used for authentication.

    If these secrets are exposed in a repository, anyone with read access can potentially misuse them to access external services.

    Therefore, we recommend enabling secret scanning and storing secrets in a secure location outside the project repository to prevent
    unauthorized access and potential fraudulent activities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name ="d9c8a59d-da37-494b-81fa-235f0855cee9",
    healthy_reason = "%s has secret scanning enabled in GitHub repositories.",
    no_data_reason = "%s has no assessment data to determine if secret scanning is enabled in GitHub repositories.",
    unhealthy_reason = "%s does not have secret scanning enabled in GitHub repositories."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_devops_security_posture_management_findings_should_be_resolved" {
  title       = "[ASSESSMENT] Azure DevOps security posture management findings should be resolved"

  description = <<-EOT
    Azure DevOps security posture management findings are crucial for maintaining the security of your Azure DevOps (ADO) artifacts.

    These artifacts include various organization/project settings, build/release configurations, service connections, agent pools, and more.

    If these findings are not resolved, your ADO artifacts may be configured insecurely, potentially leading to vulnerabilities and breaches.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "7b123b34-1f78-4902-abb6-3b813abe9866",
    healthy_reason = "%s has Azure DevOps security posture management findings resolved.",
    no_data_reason = "%s has no assessment data to determine if Azure DevOps security posture management findings are resolved.",
    unhealthy_reason = "%s does not have Azure DevOps security posture management findings resolved."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machine_scale_sets" {
  title       = "[ASSESSMENT] Guest Attestation extension should be installed on supported Windows virtual machine scale sets"

  description = <<-EOT
    Install Guest Attestation extension on supported virtual machine scale sets to allow Microsoft Defender for Cloud to proactively
    attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment
    applies to Trusted Launch and Confidential Windows virtual machine scale sets.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "02e8ca50-0e7e-cc34-0b91-215af2904248",
    healthy_reason = "%s has Guest Attestation extension installed on supported Windows virtual machine scale sets.",
    no_data_reason = "%s has no assessment data to determine if Guest Attestation extension is installed on supported Windows virtual machine scale sets.",
    unhealthy_reason = "%s does not have Guest Attestation extension installed on supported Windows virtual machine scale sets."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_for_sql_status_should_be_protected_for_arc_enabled_sql_servers" {
  title       = "[ASSESSMENT] Microsoft Defender for SQL status should be protected for Arc-enabled SQL Servers"

  description = <<-EOT
    Microsoft Defender for SQL provides functionality for surfacing and mitigating potential database vulnerabilities, detecting anomalous
    activities that could indicate threats to SQL databases, discovering and classifying sensitive data. Once enabled, the protection status
    indicates that the resource is actively monitored. Even when Defender is enabled, multiple configuration settings should be validated on
    the agent, machine, workspace and SQL server to ensure active protection.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "08d649c8-5458-46dd-a13c-e1c5c7b1687c",
    healthy_reason = "%s has Microsoft Defender for SQL status protected for Arc-enabled SQL Servers.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender for SQL status is protected for Arc-enabled SQL Servers.",
    unhealthy_reason = "%s does not have Microsoft Defender for SQL status protected for Arc-enabled SQL Servers."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "microsoft_defender_cspm_should_be_enabled" {
  title       = "[ASSESSMENT] Microsoft Defender CSPM should be enabled"
  description = <<-EOT
    Defender Cloud Security Posture Management (CSPM) provides enhanced posture capabilities and a new intelligent cloud security graph to help identify, prioritize, and reduce risk.
    Defender CSPM is available in addition to the free foundational security posture capabilities turned on by default in Defender for Cloud.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "e0e431eb-22b3-4f34-ae0d-5ec229fc28e7",
    healthy_reason = "%s has Microsoft Defender CSPM enabled.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Defender CSPM is enabled.",
    unhealthy_reason = "%s does not have Microsoft Defender CSPM enabled."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - didn't find a definition or assessment
control "service_principals_should_not_be_assigned_with_administrative_roles_at_the_subscription_and_resource_group_level" {
  title       = "Service Principals should not be assigned with administrative roles at the subscription and resource group level"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - we're not capturing the disableLocalAuth field for this table that we need
control "azure_event_hub_namespaces_should_have_local_authentication_methods_disabled" {
  title       = "Azure Event Hub namespaces should have local authentication methods disabled"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_sql_managed_instance_authentication_mode_should_be_azure_active_directory_only" {
  title       = "[ASSESSMENT] Azure SQL Managed Instance authentication mode should be Azure Active Directory Only"

  description = <<-EOT
    Disabling local authentication methods and allowing only Azure Active Directory Authentication improves security by ensuring
    that Azure SQL Managed Instances can exclusively be accessed by Azure Active Directory identities. Learn more at:
    aka.ms/adonlycreate.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "e2750e59-9a37-4ad5-b584-013932d9682d",
    healthy_reason = "%s has Azure SQL Managed Instance authentication mode set to Azure Active Directory Only.",
    no_data_reason = "%s has no assessment data to determine if Azure SQL Managed Instance authentication mode is set to Azure Active Directory Only.",
    unhealthy_reason = "%s does not have Azure SQL Managed Instance authentication mode set to Azure Active Directory Only."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "api_endpoints_in_azure_api_management_should_be_authenticated" {
  title       = "API endpoints in Azure API Management should be authenticated"
  description = "This control is currently unimplemented."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "91af2040-7874-4659-abf0-578e1f8d07dc",
    healthy_reason = "%s has API endpoints in Azure API Management authenticated.",
    no_data_reason = "%s has no assessment data to determine if API endpoints in Azure API Management are authenticated.",
    unhealthy_reason = "%s does not have API endpoints in Azure API Management authenticated."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "privileged_roles_should_not_have_permanent_access_at_the_subscription_and_resource_group_level" {
  title       = "[ASSESSMENT] Privileged roles should not have permanent access at the subscription and resource group level"
  description = <<-EOT
    Defender for Cloud identified identities that are assigned with privileged admin roles at the resource group or subscription level without a time limit.
    Privileged admin roles are roles that can perform sensitive operations on the resource, such as Owner, Contributor, Role-Based Access Control Administrator, and User Access Administrator.
    It is recommended to use Just-in-Time access through Microsoft Entra Privileged Identity Management (PIM) as well as other protective measures to mitigate the risk of unnecessary or unauthorized access.
    Granting permanent access can be risky, as it could result in human error or hardware hacks.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "706b33f0-129e-4ed0-a179-f450b9ee4145",
    healthy_reason = "%s does not have privileged roles with permanent access at the subscription and resource group level.",
    no_data_reason = "%s has no assessment data to determine if privileged roles have permanent access at the subscription and resource group level.",
    unhealthy_reason = "%s has privileged roles with permanent access at the subscription and resource group level."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days" {
  title       = "Audit Windows machines that do not have the maximum password age set to specified number of days"
  description = "Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol. Machines are non-compliant if Windows machines that do not have the maximum password age set to specified number of days. Default value for maximum password age is 70 days."
  query       = query.audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_machine_learning_computes_should_have_local_authentication_methods_disabled" {
  title       = "[ASSESSMENT] Azure Machine Learning Computes should have local authentication methods disabled"

  description = <<-EOT
    Disabling local authentication methods improves security by ensuring that Machine Learning Computes require Azure Active
    Directory identities exclusively for authentication. Learn more at: https://aka.ms/azure-ml-aad-policy.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "51740d72-1ff9-455d-ace0-c7384e903168",
    healthy_reason = "%s has local authentication methods disabled for Azure Machine Learning Computes.",
    no_data_reason = "%s has no assessment data to determine if local authentication methods are disabled for Azure Machine Learning Computes.",
    unhealthy_reason = "%s does not have local authentication methods disabled for Azure Machine Learning Computes."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "authorization_rules_on_the_event_hub_instance_should_be_defined" {
  title       = "Authorization rules on the Event Hub instance should be defined"
  description = "Audit existence of authorization rules on Event Hub entities to grant least-privileged access."
  query       = query.authorization_rules_on_the_event_hub_instance_should_be_defined_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "kubernetes_clusters_should_disable_automounting_api_credentials" {
  title       = "[ASSESSMENT] Kubernetes clusters should disable automounting API credentials"

  description = <<-EOT
    Disable automounting API credentials to prevent a potentially compromised Pod resource to run API commands against
    Kubernetes clusters. For more information, see https://aka.ms/kubepolicydoc.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "32060ac3-f17f-4848-db8e-e7cf2c9a53eb",
    healthy_reason = "%s has automounting API credentials disabled in Kubernetes clusters.",
    no_data_reason = "%s has no assessment data to determine if automounting API credentials are disabled in Kubernetes clusters.",
    unhealthy_reason = "%s does not have automounting API credentials disabled in Kubernetes clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "anonymous_authentication_should_be_disabled_on_nodes_in_azure_kubernetes_service_aks_clusters" {
  title       = "[ASSESSMENT] Anonymous authentication should be disabled on nodes in Azure Kubernetes Service (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that anonymous authentication is enabled on nodes in your AKS clusters. This poses a risk of
    unauthorized access to your cluster where an attacker can access resources without authenticating. We recommend disabling
    anonymous requests on nodes in your clusters.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "29e9792f-0913-4c74-adc0-1aa05863b97c",
    healthy_reason = "%s has anonymous authentication disabled on nodes in Azure Kubernetes Service (AKS) clusters.",
    no_data_reason = "%s has no assessment data to determine if anonymous authentication is disabled on nodes in Azure Kubernetes Service (AKS) clusters.",
    unhealthy_reason = "%s does not have anonymous authentication disabled on nodes in Azure Kubernetes Service (AKS) clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "all_authorization_rules_except_rootmanagesharedaccesskey_should_be_removed_from_service_bus_namespace" {
  title       = "All authorization rules except RootManageSharedAccessKey should be removed from Service Bus namespace"
  description = "Service Bus clients should not use a namespace level access policy that provides access to all queues and topics in a namespace. To align with the least privilege security model, you should create access policies at the entity level for queues and topics to provide access to only the specific entity."
  query       = query.forbidden_authorization_rules_removed_from_service_bus_namespace_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - didn't find a definition or assessment
control "azure_overprovisioned_identities_should_have_only_the_necessary_permissions" {
  title       = "Azure overprovisioned identities should have only the necessary permissions"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Privilege Use'"
  description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies - Privilege Use' for auditing nonsensitive and other privilege use. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_mysql_flexible_server_should_have_azure_active_directory_only_authentication_enabled" {
  title       = "[ASSESSMENT] Azure MySQL flexible server should have Azure Active Directory Only Authentication enabled"

  description = <<-EOT
    Disabling local authentication methods and allowing only Azure Active Directory Authentication improves security by
    ensuring that Azure MySQL flexible server can exclusively be accessed by Azure Active Directory identities.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "02fb778d-fd6c-4770-81ca-abec3cf36634",
    healthy_reason = "%s has Azure MySQL flexible server authentication mode set to Azure Active Directory Only.",
    no_data_reason = "%s has no assessment data to determine if Azure MySQL flexible server authentication mode is set to Azure Active Directory Only.",
    unhealthy_reason = "%s does not have Azure MySQL flexible server authentication mode set to Azure Active Directory Only."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "transfer_backup_information_to_an_alternate_storage_site" {
  title       = "Transfer backup information to an alternate storage site"

  description = <<-EOT
    The customer is responsible for transferring backup information to an alternate storage site. Azure can support the storage of backup data if the customer configures Microsoft Azure backup services appropriately.
    Microsoft Azure automatically copies the backups of the customer data to the storage site within the same datacenter. These backups are automatically geo-replicated to the alternative storage site in different geographic regions.
    If the datacenter hosting the customer data fails, the customer can utilize the Microsoft Azure Management Portal or programmatic API to restore their data from the geo-replicated backup to any geographic region of their choice.
    Additional information about how customers can restore data can be found here: https://docs.microsoft.com/azure/sql-database/sql-database-recovery-using-backups.
    In the case of failure at the customer's primary datacenter, the customer is responsible for restoring their data from backups to an alternative datacenter.
  EOT

  query       = query.manual_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# Manual control, no assessment found
control "separately_store_backup_information" {
  title       = "Separately store backup information"
  description = <<-EOT
    The customer is responsible for separately storing backup information (e.g., separate facility or fire-rated container that is not collocated).
    Note: if the customer configures Microsoft Azure backup services appropriately, Azure can support the protection of backup data.
  EOT
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "dependency_agent_should_be_enabled_for_listed_virtual_machine_images" {
  title       = "Dependency agent should be enabled for listed virtual machine images"

  description = <<-EOT
    Reports virtual machines as non-compliant if the virtual machine image is in the list defined and the agent is not installed.
    The list of OS images is updated over time as support is updated.
  EOT

  query       = query.dependency_agent_should_be_enabled_for_listed_virtual_machine_images

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "an_activity_log_alert_should_exist_for_specific_policy_operations" {
  title       = "[ASSESSMENT] An activity log alert should exist for specific Policy operations"
  description = "This policy audits specific Policy operations with no activity log alerts configured."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "83c16401-b71c-b1e4-1b30-bf478bd08568",
    healthy_reason = "%s has an activity log alert for specific Policy operations.",
    no_data_reason = "%s has no assessment data to determine if an activity log alert exists for specific Policy operations.",
    unhealthy_reason = "%s does not have an activity log alert for specific Policy operations."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "audit_flow_logs_configuration_for_every_virtual_network" {
  title       = "[ASSESSMENT] Audit flow logs configuration for every virtual network"
  description = <<-EOT
    Audit for virtual network to verify if flow logs are configured.
    Enabling flow logs allows to log information about IP traffic flowing through virtual network.
    It can be used for optimizing network flows, monitoring throughput, verifying compliance, detecting intrusions and more.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "65cb51a1-3e8f-bcac-965a-23bdfbc888f3",
    healthy_reason = "%s has flow logs configured for every virtual network.",
    no_data_reason = "%s has no assessment data to determine if flow logs are configured for every virtual network.",
    unhealthy_reason = "%s does not have flow logs configured for every virtual network."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_monitor_solution_security_and_audit_must_be_deployed" {
  title       = "[ASSESSMENT] Azure Monitor solution 'Security and Audit' must be deployed"
  description = "This policy ensures that Security and Audit is deployed."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "0c22fa4a-e5eb-5b1b-de7c-06c974127e24",
    healthy_reason = "%s has Azure Monitor solution 'Security and Audit' deployed.",
    no_data_reason = "%s has no assessment data to determine if Azure Monitor solution 'Security and Audit' is deployed.",
    unhealthy_reason = "%s does not have Azure Monitor solution 'Security and Audit' deployed."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "an_activity_log_alert_should_exist_for_specific_security_operations" {
  title       = "[ASSESSMENT] An activity log alert should exist for specific Security operations"
  description = "This policy audits specific Security operations with no activity log alerts configured."
  query       = query.assessment_name_with_resource_query

  args = {
    name = "050261fd-ea47-98b8-8347-264600c82bab",
    healthy_reason = "%s has an activity log alert for specific Security operations.",
    no_data_reason = "%s has no assessment data to determine if an activity log alert exists for specific Security operations.",
    unhealthy_reason = "%s does not have an activity log alert for specific Security operations."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machines" {
  title       = "[ASSESSMENT] Guest Attestation extension should be installed on supported Linux virtual machines"

  description = <<-EOT
    Install Guest Attestation extension on supported Linux virtual machines to allow Microsoft Defender for Cloud to
    proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation.
    This assessment applies to Trusted Launch and Confidential Linux virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "e94a7421-fc27-7a4d-e9ba-2ba01384cacd",
    healthy_reason = "%s has Guest Attestation extension installed on supported Linux virtual machines.",
    no_data_reason = "%s has no assessment data to determine if Guest Attestation extension is installed on supported Linux virtual machines.",
    unhealthy_reason = "%s does not have Guest Attestation extension installed on supported Linux virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "linux_virtual_machines_should_use_only_signed_and_trusted_boot_components" {
  title       = "[ASSESSMENT] Linux virtual machines should use only signed and trusted boot components"

  description = <<-EOT
    All OS boot components on Linux machines, including the boot loader, kernel, and kernel drivers, should be signed by trusted publishers.

    This is to protect the machines from potentially harmful components.

    If untrusted components are identified, they should either be added to an allow list or removed.

    If this is not done, the system could be exposed to malicious components, compromising the security and integrity of the Linux virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ad50b498-f90c-451f-886f-d0a169cc5002",
    healthy_reason = "%s uses only signed and trusted boot components on Linux virtual machines.",
    no_data_reason = "%s has no assessment data to determine if only signed and trusted boot components are used on Linux virtual machines.",
    unhealthy_reason = "%s does not use only signed and trusted boot components on Linux virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "resource_logs_in_azure_databricks_workspaces_should_be_enabled" {
  title       = "[ASSESSMENT] Resource logs in Azure Databricks Workspaces should be enabled"

  description = <<-EOT
    Resource logs enable recreating activity trails to use for investigation purposes when a security incident occurs or when your
    network is compromised.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "a59cd763-dbb7-4918-a5e5-b933705c8f74",
    healthy_reason = "%s has resource logs enabled in Azure Databricks Workspaces.",
    no_data_reason = "%s has no assessment data to determine if resource logs are enabled in Azure Databricks Workspaces.",
    unhealthy_reason = "%s does not have resource logs enabled in Azure Databricks Workspaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - no assessment found, definition in azadvertizer but doesn't contain a policyRule key
control "windows_machines_should_meet_requirements_for_system_audit_policies_policy_change_" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Policy Change'"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "diagnostic_logs_in_app_service_should_be_enabled" {
  title       = "[ASSESSMENT] Diagnostic logs in App Service should be enabled"

  description = <<-EOT
    Enabling diagnostic logs in App Service is a crucial step for maintaining a secure and transparent system.

    These logs provide a detailed record of activities, which can be invaluable for investigating security incidents or
    network compromises.

    If diagnostic logs are not enabled, it may be difficult to identify and resolve security issues, potentially leading
    to prolonged system vulnerabilities and increased risk of data breaches.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "40394a2c-60fb-7cc5-1944-065772e94f05",
    healthy_reason = "%s has diagnostic logs enabled in App Service.",
    no_data_reason = "%s has no assessment data to determine if diagnostic logs are enabled in App Service.",
    unhealthy_reason = "%s does not have diagnostic logs enabled in App Service."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "windows_machines_should_meet_requirements_for_system_audit_policies_account_management_" {
  title       = "Windows machines should meet requirements for 'System Audit Policies - Account Management'"
  description = "Windows machines should have the specified Group Policy settings in the category 'System Audit Policies - Account Management' for auditing application, security, and user group management, and other management events. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  query       = query.windows_machines_should_meet_requirements_for_system_audit_policies_account_management_query

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "resource_logs_in_azure_machine_learning_workspaces_should_be_enabled" {
  title       = "[ASSESSMENT] Resource logs in Azure Machine Learning Workspaces should be enabled"

  description = <<-EOT
    Resource logs enable recreating activity trails to use for investigation purposes when a security incident occurs or
    when your network is compromised.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "1b663c6e-6432-4517-9a2b-49f5008e652f",
    healthy_reason = "%s has resource logs enabled in Azure Machine Learning Workspaces.",
    no_data_reason = "%s has no assessment data to determine if resource logs are enabled in Azure Machine Learning Workspaces.",
    unhealthy_reason = "%s does not have resource logs enabled in Azure Machine Learning Workspaces."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "sql_auditing_settings_should_have_action_groups_configured_to_capture_critical_activities" {
  title       = "SQL Auditing settings should have Action-Groups configured to capture critical activities"
  description = "The AuditActionsAndGroups property should contain at least SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP, FAILED_DATABASE_AUTHENTICATION_GROUP, BATCH_COMPLETED_GROUP to ensure a thorough audit logging."
  query       = query.sql_server_auditing_settings_action_group_configured

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - There is no location in the azure_resource_group table, maybe we could add it?
control "audit_resource_location_matches_resource_group_location" {
  title       = "Audit resource location matches resource group location"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "linux_virtual_machines_should_enforce_kernel_module_signature_validation" {
  title       = "[ASSESSMENT] Linux virtual machines should enforce kernel module signature validation"

  description = <<-EOT
    Enforcing kernel module signature validation on supported Linux virtual machines is a key security measure to prevent
    the execution of malicious or unauthorized code in kernel mode.

    This validation ensures that only trusted kernel modules are allowed to run, thereby mitigating potential security risks.

    If this is not enforced, the system could be vulnerable to attacks that could compromise the integrity and security of the virtual machine.

    This recommendation is applicable only to Linux virtual machines that have the Azure Monitor Agent installed.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "e2f798b8-621a-4d46-99d7-1310e09eba26",
    healthy_reason = "%s enforces kernel module signature validation on Linux virtual machines.",
    no_data_reason = "%s has no assessment data to determine if kernel module signature validation is enforced on Linux virtual machines.",
    unhealthy_reason = "%s does not enforce kernel module signature validation on Linux virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "edr_configuration_issues_should_be_resolved_on_virtual_machines" {
  title       = "[ASSESSMENT] EDR configuration issues should be resolved on virtual machines"

  description = <<-EOT
    To protect virtual machines from the latest threats and vulnerabilities, resolve all identified configuration issues
    with the installed Endpoint Detection and Response (EDR) solution.

    Note: Currently, this recommendation only applies to resources with Microsoft Defender for Endpoint (MDE) enabled.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "dc5357d0-3858-4d17-a1a3-072840bff5be",
    healthy_reason = "%s has no EDR configuration issues on virtual machines.",
    no_data_reason = "%s has no assessment data to determine if there are EDR configuration issues on virtual machines.",
    unhealthy_reason = "%s has EDR configuration issues on virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "virtual_machines_guest_attestation_status_should_be_healthy" {
  title       = "[ASSESSMENT] Virtual machines guest attestation status should be healthy"

  description = <<-EOT
    Guest attestation is a process that assesses the trustworthiness of boot components in virtual machines, aiming to
    detect potential compromises such as bootkit or rootkit infections.

    This is achieved by sending a trusted log to an attestation server.

    This recommendation is particularly applicable to Trusted Launch and Confidential virtual machines that have the Guest
    Attestation extension installed.

    If the guest attestation status is not healthy, it indicates potential security threats that could compromise the
    integrity and security of the virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "b7604066-ed76-45f9-a5c1-c97e4812dc55",
    healthy_reason = "%s has a healthy guest attestation status on virtual machines.",
    no_data_reason = "%s has no assessment data to determine if the guest attestation status is healthy on virtual machines.",
    unhealthy_reason = "%s does not have a healthy guest attestation status on virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "guest_attestation_extension_should_be_installed_on_supported_linux_virtual_machine_scale_sets" {
  title       = "[ASSESSMENT] Guest Attestation extension should be installed on supported Linux virtual machine scale sets"

  description = <<-EOT
    Install Guest Attestation extension on supported Linux virtual machine scale sets to allow Microsoft Defender for Cloud
    to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation.
    This assessment applies to Trusted Launch and Confidential Linux virtual machine scale sets
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "a9a53f4f-26b6-3d68-33f3-2ec1f2452b5d",
    healthy_reason = "%s has Guest Attestation extension installed on supported Linux virtual machine scale sets.",
    no_data_reason = "%s has no assessment data to determine if Guest Attestation extension is installed on supported Linux virtual machine scale sets.",
    unhealthy_reason = "%s does not have Guest Attestation extension installed on supported Linux virtual machine scale sets."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "guest_attestation_extension_should_be_installed_on_supported_windows_virtual_machines" {
  title       = "[ASSESSMENT] Guest Attestation extension should be installed on supported Windows virtual machines"

  description = <<-EOT
    Install Guest Attestation extension on supported virtual machines to allow Microsoft Defender for Cloud to proactively
    attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This
    assessment applies to Trusted Launch and Confidential Windows virtual machines.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "874b14bd-b49e-495a-88c6-46acb89b0a33",
    healthy_reason = "%s has Guest Attestation extension installed on supported Windows virtual machines.",
    no_data_reason = "%s has no assessment data to determine if Guest Attestation extension is installed on supported Windows virtual machines.",
    unhealthy_reason = "%s does not have Guest Attestation extension installed on supported Windows virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_local_machines_should_meet_secured_core_requirements" {
  title       = "[ASSESSMENT] Azure Local machines should meet Secured-core requirements"

  description = <<-EOT
    Ensure that all Azure Local machines meet the Secured-core requirements.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "7a9de0cb-4c14-4528-a783-5123a6787dc9",
    healthy_reason = "%s meets Secured-core requirements on Azure Local machines.",
    no_data_reason = "%s has no assessment data to determine if it meets Secured-core requirements on Azure Local machines.",
    unhealthy_reason = "%s does not meet Secured-core requirements on Azure Local machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "code_repositories_should_have_infrastructure_as_code_scanning_findings_resolved" {
  title       = "Code repositories should have infrastructure as code scanning findings resolved"
  description = <<-EOT
    Security configuration issues have been detected in the infrastructure as code (IaC) within your repositories.
    These issues, found in template files, can potentially compromise the security posture of your cloud resources.
    To mitigate this risk, we recommend resolving these findings.
    If left unresolved, these issues could lead to vulnerabilities in your infrastructure, making it susceptible to attacks.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "2ebc815f-7bc7-4573-994d-e1cc46fb4a35",
    healthy_reason = "%s has infrastructure as code scanning findings resolved.",
    no_data_reason = "%s has no assessment data to determine if infrastructure as code scanning findings are resolved.",
    unhealthy_reason = "%s does not have infrastructure as code scanning findings resolved."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_api_management_apis_should_be_onboarded_to_defender_for_apis" {
  title       = "[ASSESSMENT] Azure API Management APIs should be onboarded to Defender for APIs"
  description = <<-EOT
    Microsoft Defender for APIs protects your APIs from attacks and security misconfigurations.
    Defender for APIs may increase the compute, memory, and network utilization of your Azure API Management service.
    Therefore, we recommend gradually onboard APIs, especially if your service is running at high utilization, while monitoring the capacity, and scaling out as needed.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "1c0ba94f-e732-43c7-bf3a-05e80f45d642",
    healthy_reason = "%s are onboarded to Defender for APIs.",
    no_data_reason = "%s has no assessment data to determine if they are onboarded to Defender for APIs.",
    unhealthy_reason = "%s are not onboarded to Defender for APIs."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "linux_virtual_machines_should_use_secure_boot" {
  title       = "[ASSESSMENT] Linux virtual machines should use Secure Boot"

  description = <<-EOT
    Secure Boot should be enabled on supported Linux virtual machines to guard against the installation of malware-based
    rootkits and boot kits.

    Secure Boot ensures that only signed operating systems and drivers are allowed to run, providing an additional layer
    of security.

    If Secure Boot is not enabled, the system may be vulnerable to attacks that could compromise the integrity of the
    operating system and installed drivers.

    This recommendation is specifically applicable to Linux virtual machines that have the Azure Monitor Agent installed.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "0396b18c-41aa-489c-affd-4ee5d1714a59",
    healthy_reason = "%s uses Secure Boot on Linux virtual machines.",
    no_data_reason = "%s has no assessment data to determine if Secure Boot is used on Linux virtual machines.",
    unhealthy_reason = "%s does not use Secure Boot on Linux virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "diagnostic_logs_in_data_lake_analytics_should_be_enabled" {
  title       = "[ASSESSMENT] Diagnostic logs in Data Lake Analytics should be enabled"

  description = <<-EOT
    Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation
    purposes when a security incident occurs or your network is compromised.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "c6dad669-efd7-cd72-61c5-289935607791",
    healthy_reason = "%s has diagnostic logs enabled in Data Lake Analytics.",
    no_data_reason = "%s has no assessment data to determine if diagnostic logs are enabled in Data Lake Analytics.",
    unhealthy_reason = "%s does not have diagnostic logs enabled in Data Lake Analytics."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "diagnostic_logs_in_azure_data_lake_store_should_be_enabled" {
  title       = "[ASSESSMENT] Diagnostic logs in Azure Data Lake Store should be enabled"

  description = <<-EOT
    Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes
    when a security incident occurs or your network is compromised.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ad5bbaeb-7632-5edf-f1c2-752075831ce8",
    healthy_reason = "%s has diagnostic logs enabled in Azure Data Lake Store.",
    no_data_reason = "%s has no assessment data to determine if diagnostic logs are enabled in Azure Data Lake Store.",
    unhealthy_reason = "%s does not have diagnostic logs enabled in Azure Data Lake Store."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "redis_cache_should_allow_access_only_via_ssl" {
  title       = "[ASSESSMENT] Redis Cache should allow access only via SSL"

  description = <<-EOT
    Enable only connections via SSL to Redis Cache. Use of secure connections ensures authentication between the server
    and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping,
    and session-hijacking.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "35b25be2-d08a-e340-45ed-f08a95d804fc"
    healthy_reason = "%s allows access only via SSL to Redis Cache.",
    no_data_reason = "%s has no assessment data to determine if access is allowed only via SSL to Redis Cache.",
    unhealthy_reason = "%s does not allow access only via SSL to Redis Cache."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "code_repositories_should_have_secrets_scanning_findings_resolved" {
  title       = "[ASSESSMENT] Code repositories should have secrets scanning findings resolved"
  description = <<-EOT
    The presence of secrets in code repositories poses a significant security risk.
    If these secrets are leaked or discovered by threat actors, it could lead to the compromise of an application or service.
    The Microsoft Security DevOps credential scanning tool for Azure DevOps only scans builds it's configured to run on, so the current status may not reflect the complete status of secrets in your repositories.
    It's crucial to resolve secret scanning findings promptly to prevent potential security breaches.
  EOT
  query       = query.assessment_name_with_resources_query

  args = {
    name = ["67279c29-fa4c-4f09-ae59-cb149156599", "dd98425c-1407-40cc-8a2c-da5d0a2f80da"],
    healthy_reason = "%s has secrets scanning findings resolved.",
    no_data_reason = "%s has no assessment data to determine if secrets scanning findings are resolved.",
    unhealthy_reason = "%s does not have secrets scanning findings resolved."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

# TODO - was unable to find this in azadvertizer.net or assessment table, policy name/id is 44d12760-2cf2-4e6d-8613-8451c11c1abc
control "servers_onboarded_with_mde_should_have_vulnerability_findings_resolved" {
  title       = "Servers onboarded with MDE should have vulnerability findings resolved"
  description = "This control is currently unimplemented."
  query       = query.unimplemented_control

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "audit_vms_that_do_not_use_managed_disks" {
  title       = "Audit VMs that do not use managed disks"
  description = "This policy audits VMs that do not use managed disks"
  query       = query.audit_vms_that_do_not_use_managed_disks

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_ai_services_resources_should_use_azure_private_link" {
  title       = "[ASSESSMENT] Azure AI Services resources should use Azure Private Link"

  description = <<-EOT
    Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source
    or destination.

    The Private Link platform reduces data leakage risks by handling the connectivity between the consumer and services
    over the Azure backbone network.

    Learn more about private links at: https://aka.ms/AzurePrivateLink/Overview
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "67279c29-fa4c-4f09-ae59-cb1491565995",
    healthy_reason = "%s uses Azure Private Link for Azure AI Services resources.",
    no_data_reason = "%s has no assessment data to determine if Azure Private Link is used for Azure AI Services resources.",
    unhealthy_reason = "%s does not use Azure Private Link for Azure AI Services resources."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "azure_database_for_postgresql_flexible_server_microsoft_entra_authentication_only_enabled" {
  title       = "[ASSESSMENT] Azure Database for PostgreSQL flexible server should have Microsoft Entra authentication only enabled"

  description = <<-EOT
    Disabling local authentication methods and requiring Microsoft Entra authentication improves security by ensuring that
    Azure Database for PostgreSQL flexible server can be accessed by Microsoft Entra identities only.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "5d19e32c-489d-407c-9549-15d9ea36a8e0",
    healthy_reason = "%s has Microsoft Entra authentication only enabled for Azure Database for PostgreSQL flexible server.",
    no_data_reason = "%s has no assessment data to determine if Microsoft Entra authentication only is enabled for Azure Database for PostgreSQL flexible server.",
    unhealthy_reason = "%s does not have Microsoft Entra authentication only enabled for Azure Database for PostgreSQL flexible server."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "client_certificate_authentication_should_be_enabled_on_aks_nodes" {
  title       = "[ASSESSMENT] Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters"

  description = <<-EOT
    Defender for Cloud identified that a client certificate file is not configured and authentication using client
    certificates is not enabled on nodes in your AKS clusters. This poses a risk of unauthorized access and potential
    manipulation of the kubelet. Without proper authentication, attackers can potentially execute commands or perform
    actions with the same privileges as the kubelet itself. We recommend enabling client certificate authentication on
    nodes in your AKS clusters.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "83733586-9f9a-42dc-9049-90a276e2fe38",
    healthy_reason = "%s has client certificate authentication enabled on nodes in Azure Kubernetes Services (AKS) clusters.",
    no_data_reason = "%s has no assessment data to determine if client certificate authentication is enabled on nodes in Azure Kubernetes Services (AKS) clusters.",
    unhealthy_reason = "%s does not have client certificate authentication enabled on nodes in Azure Kubernetes Services (AKS) clusters."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "kubernetes_cluster_should_not_use_default_namespace" {
  title       = "[ASSESSMENT] Kubernetes clusters should not use the default namespace"

  description = <<-EOT
    Prevent usage of the default namespace in Kubernetes clusters to protect against unauthorized access for ConfigMap, Pod,
    Secret, Service, and ServiceAccount resource types. For more information, see https://aka.ms/kubepolicydoc.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "ff87e0b4-17df-d338-5b19-80e71e0dcc9d",
    healthy_reason = "%s does not use the default namespace in Kubernetes clusters.",
    no_data_reason = "%s has no assessment data to determine if the default namespace is used in Kubernetes clusters.",
    unhealthy_reason = "%s uses the default namespace in Kubernetes clusters."
  }

  tags = local.regulatory_compliance_kubernetes_common_tags
}

control "kubernetes_cluster_enforce_least_privileges_for_container_linux" {
  title       = "[ASSESSMENT] Kubernetes clusters should enforce least privileges for Linux containers"
  description = <<-EOT
    Restrict the capabilities to reduce the attack surface of containers in a Kubernetes cluster.
    This recommendation is part of CIS 5.2.8 and CIS 5.2.9 which are intended to improve the security of your Kubernetes environments.
    This policy is generally available for Kubernetes Service (AKS), and preview for Azure Arc enabled Kubernetes.
    For more information, see https://aka.ms/kubepolicydoc.
  EOT
  query       = query.assessment_name_with_resource_query

  args = {
    name = "11c95609-3553-430d-b788-fd41cde8b2db",
    healthy_reason = "%s does enforce least privileges in Kubernetes clusters.",
    no_data_reason = "%s has no assessment data to determine if least privileges are enforced in Kubernetes clusters.",
    unhealthy_reason = "%s uses the default namespace in Kubernetes clusters."
  }

  tags = local.regulatory_compliance_kubernetes_common_tags
}

control "diagnostic_logs_in_batch_accounts_should_be_enabled" {
  title       = "[ASSESSMENT] Diagnostic logs in Batch Accounts should be enabled"

  description = <<-EOT
    Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes
    when a security incident occurs or your network is compromised.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "32771b45-220c-1a8b-584e-fdd5a2584a66",
    healthy_reason = "%s has diagnostic logs enabled in Batch Accounts.",
    no_data_reason = "%s has no assessment data to determine if diagnostic logs are enabled in Batch Accounts.",
    unhealthy_reason = "%s does not have diagnostic logs enabled in Batch Accounts."
  }
}

control "compute_vm_assessment_mamagement_ports_closed" {
  title      = "[ASSESSMENT] Management ports should be closed on virtual machines"

  description = <<-EOT
    Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks
    attempt to brute force credentials to gain admin access to the machine.
  EOT

  query       = query.assessment_name_with_resource_query

  args = {
    name = "bc303248-3d14-44c2-96a0-55f5c326b5fe",
    healthy_reason = "%s has management ports closed on virtual machines.",
    no_data_reason = "%s has no assessment data to determine if management ports are closed on virtual machines.",
    unhealthy_reason = "%s does not have management ports closed on virtual machines."
  }

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

control "audit_linux_machines_passwd_file_permissions_0644" {
  title      = "[ASSESSMENT] Audit Linux machines that do not have the passwd file permissions set to 0644"

  description = <<-EOT
    Requires that prerequisites are deployed to the policy assignment scope. For details, visit https://aka.ms/gcpol.
    Machines are non-compliant if Linux machines that do not have the passwd file permissions set to 0644
  EOT

  query       = query.audit_linux_machines_passwd_file_permissions_0644

  tags = merge(local.regulatory_compliance_compute_common_tags, {})
}

locals {
  assessment_name_with_resource_query = <<-EOQ
    with assessments as (
      select
        distinct name as assessment_name,
        resource_name,
        status_code
      from
        azure_security_center_assessment
      where
        name = $1
    ),
    azure_resource as materialized (
      select
        *
      from
        azure_resource
    )
    select
      ar.title as resource,
      case
        when assessments.status_code = 'Healthy' then 'ok'
        else 'alarm'
      end as status,
      case
        when assessments.status_code = 'Healthy' then format($2, ar.title)
        when assessments is null then format($3, ar.title)
        else format($4, ar.title)
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "ar.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "ar.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_resource as ar
      join assessments on lower(ar.title) = lower(assessments.resource_name)
      left join azure_subscription as sub on sub.subscription_id = ar.subscription_id;
  EOQ

  assessment_name_with_resources_query = <<-EOQ
    with assessments as (
      select
        distinct name as assessment_name,
        resource_name,
        status_code
      from
        azure_security_center_assessment
      where
        name = any($1)
    ),
    azure_resource as materialized (
      select
        *
      from
        azure_resource
    )
    select
      ar.title as resource,
      case
        when assessments.status_code = 'Healthy' then 'ok'
        else 'alarm'
      end as status,
      case
        when assessments.status_code = 'Healthy' then format($2, ar.title)
        when assessments is null then format($3, ar.title)
        else format($4, ar.title)
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "ar.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "ar.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_resource as ar
      join assessments on exists (
        select 1
        from assessments
        where lower(ar.title) = lower(assessments.resource_name)
      )
      left join azure_subscription as sub on sub.subscription_id = ar.subscription_id;
  EOQ
}

query "assessment_name_with_resource_query" {
  sql = local.assessment_name_with_resource_query

  param "name" {
    default = "Not specified"
  }

  param "healthy_reason" {
    default = "%s is ok."
  }

  param "no_data_reason" {
    default = "%s has no assessment data to determine status."
  }

  param "unhealthy_reason" {
    default = "%s is not ok."
  }
}

query "audit_windows_machines_that_do_not_have_the_maximum_password_age_set_to_specified_number_of_days_query" {
  sql = <<-EOQ
    with vm_password_complexity_setting as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'MaximumPasswordAge'
        and b ->> 'complianceStatus' = 'Compliant'
        and b -> 'guestConfiguration' -> 'configurationParameter' ->> 'value' !~ '^[0-9]+$'
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
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
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

query "windows_machines_should_meet_requirements_for_security_settings_account_policies_query" {
  sql = <<-EOQ
    with maximum_password_age_compliant_vms as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        (b -> 'guestConfiguration' ->> 'name'= 'MaximumPasswordAge' and b ->> 'complianceStatus' = 'Compliant')
    ), complexity_requirements_compliant_vms as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        (b -> 'guestConfiguration' ->> 'name'= 'PasswordMustMeetComplexityRequirements' and b ->> 'complianceStatus' = 'Compliant')
    ), enforce_password_history_compliant_vms as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        (b -> 'guestConfiguration' ->> 'name'= 'EnforcePasswordHistory' and b ->> 'complianceStatus' = 'Compliant')
    ), min_password_age_compliant_vms as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        (b -> 'guestConfiguration' ->> 'name'= 'MinimumPasswordAge' and b ->> 'complianceStatus' = 'Compliant')
    ), min_password_length_compliant_vms as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        (b -> 'guestConfiguration' ->> 'name'= 'MinimumPasswordLength' and b ->> 'complianceStatus' = 'Compliant')
    )
    select
      a.vm_id as resource,
      case
        when a.os_type <> 'Windows' then 'skip'
        when num_nulls(b.vm_id, c.vm_id, d.vm_id, e.vm_id, f.vm_id) = 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when a.os_type <> 'Windows' then a.title || ' is of ' || a.os_type || ' operating system.'
        when num_nulls(b.vm_id, c.vm_id, d.vm_id, e.vm_id, f.vm_id) = 0 then a.title || ' meets requirements for Security Settings - Account Policies.'
        else a.title || ' does not meet requirements for Security Settings - Account Policies.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_compute_virtual_machine as a
      left join maximum_password_age_compliant_vms as b on a.vm_id = b.vm_id
      left join complexity_requirements_compliant_vms as c on a.vm_id = c.vm_id
      left join enforce_password_history_compliant_vms as d on a.vm_id = d.vm_id
      left join min_password_age_compliant_vms as e on a.vm_id = e.vm_id
      left join min_password_length_compliant_vms as f on a.vm_id = f.vm_id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "windows_machines_should_meet_requirements_for_system_audit_policies_privilege_use_query" {
  sql = <<-EOQ
    with vm_password_complexity_setting as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'AzureBaseline_SystemAuditPoliciesPrivilegeUse'
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
        when a.os_type <> 'Windows' then a.title || ' no Windows virtual machines detected.'
        when b.vm_id is not null then a.title || ' meets requirements for system audit policies privileged use.'
        else a.title || ' does not meet requirements for system audit policies privileged use.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
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

query "windows_machines_should_meet_requirements_for_system_audit_policies_account_management_query" {
  sql = <<-EOQ
    with vm_password_complexity_setting as (
      select
        distinct a.vm_id
      from
        azure_compute_virtual_machine as a,
        jsonb_array_elements(guest_configuration_assignments) as b
      where
        b -> 'guestConfiguration' ->> 'name'= 'AzureBaseline_SystemAuditPoliciesAccountManagement'
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
        when a.os_type <> 'Windows' then a.title || ' no Windows virtual machines detected.'
        when b.vm_id is not null then a.title || ' meets requirements for system audit policies account management.'
        else a.title || ' does notmeet requirements for system audit policies account management.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
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

query "sql_managed_instance_should_have_the_minimal_tls_version_of_1_2_query" {
  sql = <<-EOQ
    select
        ammi.name as resource,
        case
          when ammi.minimal_tls_version is not null and ammi.minimal_tls_version = '1.2' then 'ok'
          else 'alarm'
        end as status,
        case
          when ammi.minimal_tls_version is not null and ammi.minimal_tls_version = '1.2' then name || ' has TLS version 1.2'
          else name || ' does not have TLS version 1.2'
        end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "ammi.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "ammi.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_mssql_managed_instance ammi,
        azure_subscription as sub
      where
        sub.subscription_id = ammi.subscription_id;
  EOQ
}

query "keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names_query" {
  sql = <<-EOQ
    select
        k.name as resource,
        case
          when k.curve_name = ANY('{P-256,P-256K,P-384,P-521}') and k.key_type = ANY('{RSA,RSA-HSM,EC,EC-HSM}') then 'ok'
          else 'alarm'
        end as status,
        case
          when k.curve_name = ANY('{P-256,P-256K,P-384,P-521}') and k.key_type = ANY('{RSA,RSA-HSM,EC,EC-HSM}') then name || ' is one of the allowed elliptic curve cryptography names'
          else name || ' is not one of the allowed elliptic curve cryptography names'
        end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "k.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "k.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_key_vault_key as k,
        azure_subscription as sub
      where
        sub.subscription_id = k.subscription_id;
  EOQ
}

query "forbidden_authorization_rules_removed_from_service_bus_namespace_query" {
  sql = <<-EOQ
    select
      asn.id as resource,
      case
        when exists(
          select 1 from azure_subscription asub
          left join azure_servicebus_namespace azsn on asub.subscription_id = azsn.subscription_id
          where name != 'RootManageSharedAccessKey'
        ) then 'alarm'
        when exists(
          select 1 from azure_subscription asub
          left join azure_servicebus_namespace azsn on asub.subscription_id = azsn.subscription_id
          where name = 'RootManageSharedAccessKey'
        ) then 'ok'
        else 'skip'
      end as status,
      case
        when exists(
          select 1 from azure_subscription asub
          left join azure_servicebus_namespace azsn on asub.subscription_id = azsn.subscription_id
          where name != 'RootManageSharedAccessKey'
        ) then name || ' forbidden authorization rules have not been removed from Service Bus namespace'
        when exists(
          select 1 from azure_subscription asub
          left join azure_servicebus_namespace azsn on asub.subscription_id = azsn.subscription_id
          where name = 'RootManageSharedAccessKey'
        ) then name || ' forbidden authorization rules have been removed from Service Bus namespace'
        else 'No service bus namespace detected'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "asn.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "asn.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from azure_subscription sub left join azure_servicebus_namespace asn on sub.subscription_id = asn.subscription_id;
  EOQ
}

query "sql_server_auditing_settings_action_group_configured" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when audit @> '{"properties": {"auditActionsAndGroups": ["SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP"]}}' then 'ok'
        when audit @> '{"properties": {"auditActionsAndGroups": ["FAILED_DATABASE_AUTHENTICATION_GROUP"]}}' then 'ok'
        when audit @> '{"properties": {"auditActionsAndGroups": ["BATCH_COMPLETED_GROUP"]}}' then 'ok'
        else 'alarm'
      end as status,
      case
	    when audit @> '{"properties": {"auditActionsAndGroups": ["SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP"]}}' then name || ' action group configured.'
        when audit @> '{"properties": {"auditActionsAndGroups": ["FAILED_DATABASE_AUTHENTICATION_GROUP"]}}' then name || ' action group configured.'
        when audit @> '{"properties": {"auditActionsAndGroups": ["BATCH_COMPLETED_GROUP"]}}' then name || ' action group configured.'
        else name || ' action group not configured.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_sql_server s,
      jsonb_array_elements(server_audit_policy) audit,
      azure_subscription sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "authorization_rules_on_the_event_hub_instance_should_be_defined_query" {
  sql = <<-EOQ
    select
      sub.id as resource,
      case
        when exists(
          select 1 from azure_subscription asub
          left join azure_eventhub_namespace azev on asub.subscription_id = azev.subscription_id
          where azev.type = 'Microsoft.EventHub/namespaces/eventhubs'
        ) then 'ok'
        else 'alarm'
      end as status,
      case
        when exists(
          select 1 from azure_subscription asub
          left join azure_eventhub_namespace azev on asub.subscription_id = azev.subscription_id
          where azev.type = 'Microsoft.EventHub/namespaces/eventhubs'
        ) then 'Authorization rules on the Event Hub instance are defined'
        else 'Authorization rules on the Event Hub instance are not defined'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "aen.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "aen.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from azure_subscription sub left join azure_eventhub_namespace aen on sub.subscription_id = aen.subscription_id;
  EOQ
}

query "cognitive_services_accounts_should_use_customer_owned_storage_query" {
  sql = <<-EOQ
    select
        a.name as resource,
        case
          when jsonb_array_length(a.user_owned_storage) > 0 then 'alarm'
          when c ->> 'name' = 'CustomerManagedStorage' then 'ok'
        end as status,
        case
          when jsonb_array_length(a.user_owned_storage) > 0 then a.name || ' is not using customer owned storage'
          when c ->> 'name' = 'CustomerManagedStorage' then a.name || ' is using customer owned storage'
        end as reason
        ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
        ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_cognitive_account as a,
        jsonb_array_elements(capabilities) as c,
        azure_subscription as sub
      where
        sub.subscription_id = a.subscription_id;
  EOQ
}

query "keys_should_be_the_specified_cryptographic_type_rsa_or_ec_query" {
  sql = <<-EOQ
    select
        k.name as resource,
        case
          when k.key_type = ANY('{RSA,RSA-HSM,EC,EC-HSM}') then 'ok'
          else 'alarm'
        end as status,
        case
          when k.key_type = ANY('{RSA,RSA-HSM,EC,EC-HSM}') then name || ' has cryptographic type RSA or EC'
          else name || ' does not have cryptographic type RSA or EC'
        end as reason
        ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "k.")}
        ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "k.")}
        ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_key_vault_key as k,
        azure_subscription as sub
      where
        sub.subscription_id = k.subscription_id;
  EOQ
}

query "app_configuration_should_use_a_customer_managed_key_query" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when encryption -> 'keyVaultProperties' ->> 'keyIdentifier' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption -> 'keyVaultProperties' ->> 'keyIdentifier' is not null then a.name ||  ' use a customer-managed key.'
        else a.name || ' does not use a customer-managed key.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration a
      left join azure_subscription sub on a.subscription_id = sub.subscription_id;
  EOQ
}

query "private_endpoint_connections_on_batch_accounts_should_be_enabled_query" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when sku_name = 'free' then 'skip'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then 'ok'
        else 'alarm'
      end as status,
      case
        when sku_name = 'free' then a.name || ' is of ' || sku_name || ' tier.'
        when private_endpoint_connections @> '[{"privateLinkServiceConnectionStateStatus": "Approved"}]'::jsonb then a.name || ' is using private endpoint connections on batch accounts.'
        else a.name || ' is not using private endpoint connections on batch accounts'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_configuration a
      left join azure_subscription sub on a.subscription_id = sub.subscription_id;
  EOQ
}

query "azure_vpn_gateways_should_not_use_basic_sku_query" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when gateway_type != 'Vpn' then 'skip'
        when sku_tier = 'Basic' then 'alarm'
        else 'ok'
      end as status,
      case
        when gateway_type != 'Vpn' then a.name || ' is of ' || gateway_type || ' gateway type.'
        when sku_tier = 'Basic' then a.name || ' gateway is using the "Basic" SKU.'
        else a.name || ' gateway is not using the "Basic" SKU.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_virtual_network_gateway a
      left join azure_subscription sub on a.subscription_id = sub.subscription_id;
  EOQ
}

query "public_network_access_should_be_disabled_for_container_registries_query" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when public_network_access != 'Disabled' then 'alarm'
        else 'ok'
      end as status,
      case
        when public_network_access != 'Disabled' then a.name || ' does not have public network access disabled'
        else a.name || ' has public network access disabled'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_container_registry a
      left join azure_subscription sub on a.subscription_id = sub.subscription_id;
  EOQ
}

query "assessment_name_with_resources_query" {
  sql = local.assessment_name_with_resources_query

  param "name" {
    default = "Not specified"
  }

  param "healthy_reason" {
    default = "%s is ok."
  }

  param "no_data_reason" {
    default = "%s has no assessment data to determine status."
  }

  param "unhealthy_reason" {
    default = "%s is not ok."
  }
}
