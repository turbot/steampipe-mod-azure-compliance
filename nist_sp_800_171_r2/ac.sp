benchmark "nist_sp_800_171_r2_3_1" {
  title       = "3.1 Access Control"
  description = "This family of requirements deals with access to networks, systems, and information. The 22 different requirements help to ensure only authorized users access the system. Requirements also safeguard the flow of sensitive information within the network and provide guidance on network devices in the system."
  children = [
    benchmark.nist_sp_800_171_r2_3_1_1,
    benchmark.nist_sp_800_171_r2_3_1_12,
    benchmark.nist_sp_800_171_r2_3_1_13,
    benchmark.nist_sp_800_171_r2_3_1_14,
    benchmark.nist_sp_800_171_r2_3_1_2,
    benchmark.nist_sp_800_171_r2_3_1_3,
    benchmark.nist_sp_800_171_r2_3_1_4,
    benchmark.nist_sp_800_171_r2_3_1_5
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_1_1" {
  title       = "3.1.1 Limit system access to authorized users, processes acting on behalf of authorized users, and devices (including other systems)"
  description = "Access control policies (e.g., identity or role-based policies, control matrices, and cryptography) control access between active entities or subjects (i.e., users or processes acting on behalf of users) and passive entities or objects (e.g., devices, files, records, and domains) in systems. Access enforcement mechanisms can be employed at the application and service level to provide increased information security. Other systems include systems internal and external to the organization. This requirement focuses on account management for systems and applications. The definition of and enforcement of access authorizations, other than those determined by account type (e.g., privileged verses non-privileged) are addressed in requirement 3.1.2."
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.sql_server_azure_ad_authentication_enabled,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_web_app_uses_managed_identity,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.compute_vm_account_with_password_linux,
    control.iam_no_custom_role,
    control.compute_vm_ssh_key_authentication_linux,
    control.cognitive_service_local_auth_disabled,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_function_app_uses_managed_identity,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.storage_account_uses_azure_resource_manager,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_uses_azure_resource_manager,
    control.compute_vm_image_builder_uses_private_link
  ]

  tags = local.nist_sp_800_171_r2_common_tags
}

benchmark "nist_sp_800_171_r2_3_1_12" {
  title       = "3.1.12 Monitor and control remote access sessions"
  description = "Remote access is access to organizational systems by users (or processes acting on behalf of users) communicating through external networks (e.g., the Internet). Remote access methods include dial-up, broadband, and wireless. Organizations often employ encrypted virtual private networks (VPNs) to enhance confidentiality over remote connections. The use of encrypted VPNs does not make the access non-remote; however, the use of VPNs, when adequately provisioned with appropriate control (e.g., employing encryption techniques for confidentiality protection), may provide sufficient assurance to the organization that it can effectively treat such connections as internal networks. VPNs with encrypted tunnels can affect the capability to adequately monitor network communications traffic for malicious code. Automated monitoring and control of remote access sessions allows organizations to detect cyberattacks and help to ensure ongoing compliance with remote access policies by auditing connection activities of remote users on a variety of system components (e.g., servers, workstations, notebook computers, smart phones, and tablets)."
  children = [
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.app_configuration_private_link_used,
    control.appservice_api_app_remote_debugging_disabled,
    control.compute_vm_restrict_remote_connection_from_accounts_without_password_linux,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.appservice_function_app_remote_debugging_disabled,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_13" {
  title       = "3.1.13 Employ cryptographic mechanisms to protect the confidentiality of remote access sessions"
  description = "Cryptographic standards include FIPS-validated cryptography and NSA-approved cryptography."
  children = [
    control.app_configuration_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_14" {
  title       = "3.1.14 Route remote access via managed access control points"
  description = "Routing remote access through managed access control points enhances explicit, organizational control over such connections, reducing the susceptibility to unauthorized access to organizational systems resulting in the unauthorized disclosure of CUI."
  children = [
    control.app_configuration_private_link_used,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_uses_private_link,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.spring_cloud_service_network_injection_enabled,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.iot_hub_private_link_used,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_uses_private_link,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_2" {
  title       = "3.1.2 Limit system access to the types of transactions and functions that authorized users are permitted to execute"
  description = "Organizations may choose to define access privileges or other attributes by account, by type of account, or a combination of both. System account types include individual, shared, group, system, anonymous, guest, emergency, developer, manufacturer, vendor, and temporary. Other attributes required for authorizing access include restrictions on time-of-day, day-of-week, and point-oforigin. In defining other account attributes, organizations consider system-related requirements (e.g., system upgrades scheduled maintenance,) and mission or business requirements, (e.g., time zone differences, customer requirements, remote access to support travel requirements)."
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.sql_server_azure_ad_authentication_enabled,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_web_app_uses_managed_identity,
    control.iam_no_custom_role,
    control.authorize_access_to_security_functions_and_information,
    control.cognitive_service_local_auth_disabled,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_function_app_uses_managed_identity,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.storage_account_uses_azure_resource_manager,
    control.compute_vm_uses_azure_resource_manager
  ]
}

benchmark "nist_sp_800_171_r2_3_1_3" {
  title       = "3.1.3 Control the flow of CUI in accordance with approved authorizations"
  description = "Information flow control regulates where information can travel within a system and between systems (versus who can access the information) and without explicit regard to subsequent accesses to that information. Flow control restrictions include the following: keeping exportcontrolled information from being transmitted in the clear to the Internet; blocking outside traffic that claims to be from within the organization; restricting requests to the Internet that are not from the internal web proxy server; and limiting information transfers between organizations based on data structures and content. Organizations commonly use information flow control policies and enforcement mechanisms to control the flow of information between designated sources and destinations (e.g., networks, individuals, and devices) within systems and between interconnected systems. Flow control is based on characteristics of the information or the information path. Enforcement occurs in boundary protection devices (e.g., gateways, routers, guards, encrypted tunnels, firewalls) that employ rule sets or establish configuration settings that restrict system services, provide a packetfiltering capability based on header information, or message-filtering capability based on message content (e.g., implementing key word searches or using document characteristics). Organizations also consider the trustworthiness of filtering and inspection mechanisms (i.e., hardware, firmware, and software components) that are critical to information flow enforcement. Transferring information between systems representing different security domains with different security policies introduces risk that such transfers violate one or more domain security policies. In such situations, information owners or stewards provide guidance at designated policy enforcement points between interconnected systems. Organizations consider mandating specific architectural solutions when required to enforce specific security policies. Enforcement includes: prohibiting information transfers between interconnected systems (i.e., allowing access only); employing hardware mechanisms to enforce one-way information flows; and implementing trustworthy regrading mechanisms to reassign security attributes and security labels."
  children = [
    control.network_subnet_protected_by_firewall,
    control.storage_account_block_public_access,
    control.compute_vm_adaptive_network_hardening_recommendation_applied,
    control.compute_vm_remote_access_restricted_all_ports,
    control.apimanagement_service_with_virtual_network,
    control.app_configuration_private_link_used,
    control.appservice_web_app_cors_no_star,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.cognitive_service_local_auth_disabled,
    control.healthcare_fhir_uses_private_link,
    control.redis_cache_uses_private_link,
    control.search_service_uses_sku_supporting_private_link,
    control.search_service_public_network_access_disabled,
    control.search_service_uses_private_link,
    control.cosmosdb_account_with_firewall_rules,
    control.data_factory_uses_private_link,
    control.eventgrid_domain_private_link_used,
    control.eventgrid_topic_private_link_used,
    control.storage_sync_private_link_used,
    control.keyvault_firewall_enabled,
    control.keyvault_vault_private_link_used,
    control.machine_learning_workspace_private_link_used,
    control.servicebus_name_space_private_link_used,
    control.signalr_service_private_link_used,
    control.synapse_workspace_private_link_used,
    control.web_pub_sub_private_link_used,
    control.cognitive_account_private_link_used,
    control.container_registry_restrict_public_access,
    control.container_registry_uses_private_link,
    control.cosmosdb_account_uses_private_link,
    control.compute_disk_access_uses_private_link,
    control.eventhub_namespace_private_link_used,
    control.compute_vm_tcp_udp_access_restricted_internet,
    control.iot_hub_private_link_used,
    control.network_interface_ip_forwarding_disabled,
    control.compute_vm_jit_access_protected,
    control.network_security_group_remote_access_restricted,
    control.compute_vm_non_internet_facing_protected_with_nsg,
    control.sql_server_uses_private_link,
    control.mariadb_server_private_link_used,
    control.mysql_server_private_link_used,
    control.postgres_server_private_link_used,
    control.sql_db_public_network_access_disabled,
    control.mariadb_server_public_network_access_disabled,
    control.mysql_server_public_network_access_disabled,
    control.postgresql_server_public_network_access_disabled,
    control.storage_account_default_network_access_rule_denied,
    control.storage_account_restrict_network_access,
    control.storage_account_uses_private_link,
    control.network_security_group_subnet_associated,
    control.compute_vm_image_builder_uses_private_link
  ]
}

benchmark "nist_sp_800_171_r2_3_1_4" {
  title       = "3.1.4 Separate the duties of individuals to reduce the risk of malevolent activity without collusion"
  description = "Separation of duties addresses the potential for abuse of authorized privileges and helps to reduce the risk of malevolent activity without collusion. Separation of duties includes dividing mission functions and system support functions among different individuals or roles; conducting system support functions with different individuals (e.g., configuration management, quality assurance and testing, system management, programming, and network security); and ensuring that security personnel administering access control functions do not also administer audit functions. Because separation of duty violations can span systems and application domains, organizations consider the entirety of organizational systems and system components when developing policy on separation of duties."
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows,
    control.compute_vm_administrators_group_with_specified_members_windows,
    control.iam_subscription_owner_more_than_1
  ]
}

benchmark "nist_sp_800_171_r2_3_1_5" {
  title       = "3.1.5 Employ the principle of least privilege, including for specific security functions and privileged accounts"
  description = "Organizations employ the principle of least privilege for specific duties and authorized accesses for users and processes. The principle of least privilege is applied with the goal of authorized privileges no higher than necessary to accomplish required organizational missions or business functions. Organizations consider the creation of additional processes, roles, and system accounts as necessary, to achieve least privilege. Organizations also apply least privilege to the development, implementation, and operation of organizational systems. Security functions include establishing system accounts, setting events to be logged, setting intrusion detection parameters, and configuring access authorizations (i.e., permissions, privileges). Privileged accounts, including super user accounts, are typically described as system administrator for various types of commercial off-the-shelf operating systems. Restricting privileged accounts to specific personnel or roles prevents day-to-day users from having access to privileged information or functions. Organizations may differentiate in the application of this requirement between allowed privileges for local accounts and for domain accounts provided organizations retain the ability to control system configurations for key security parameters and as otherwise necessary to sufficiently mitigate risk."
  children = [
    control.iam_subscription_owner_max_3,
    control.iam_no_custom_role,
    control.authorize_access_to_security_functions_and_information
  ]
}