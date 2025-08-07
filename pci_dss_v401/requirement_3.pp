
benchmark "pci_dss_v401_requirement_3" {
  title       = "3 - Protect Stored Account Data"

  description = <<-MARKDOWN
    Protection methods such as encryption, truncation, masking, and hashing are critical components of account data protection. If an intruder
    circumvents other security controls and gains access to encrypted account data, the data is unreadable without the proper cryptographic keys
    and is unusable to that intruder. Other effective methods of protecting stored data should also be considered as potential risk-mitigation
    opportunities. For example, methods for minimizing risk include not storing account data unless necessary, truncating cardholder data if full
    PAN is not needed, and not sending unprotected PANs using end-user messaging technologies such as e-mail and instant messaging.

    If account data is present in non-persistent memory (for example, RAM, volatile memory), encryption of PAN is not required. However, proper
    controls must be in place to ensure that memory maintains a non-persistent state. Data should be removed from volatile memory once the
    business purpose (for example, the associated transaction) is complete. In the case that data storage becomes persistent, all applicable PCI
    DSS Requirements will apply including encryption of stored data.

    Requirement 3 applies to protection of stored account data unless specifically called out in an individual requirement.

    Refer to Appendix G for definitions of "strong cryptography" and other PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_3_3,
    benchmark.pci_dss_v401_requirement_3_5,
    benchmark.pci_dss_v401_requirement_3_6,
    benchmark.pci_dss_v401_requirement_3_7,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_3" {
  title       = "3.3 - Sensitive authentication data (SAD) is not stored after authorization."

  children = [
    benchmark.pci_dss_v401_requirement_3_3_2,
    benchmark.pci_dss_v401_requirement_3_3_3,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_3_2" {
  title       = "3.3.2 - SAD that is stored electronically prior to completion of authorization is encrypted using strong cryptography."

  children = [
    # App Service apps should have Client Certificates (Incoming client certificates) enabled
    control.appservice_api_app_client_certificates_on,

    # Managed identity should be used in API apps
    control.managed_identity_should_be_used_in_api_apps,

    # Identical Authentication Credentials
    control.identical_authentication_credentials,

    # Windows machines should meet requirements for 'Security Settings - Account Policies'
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_3_3" {
  title       = "3.3.3 - Additional requirement for issuers and companies that support issuing services and store sensitive authentication data: Any storage of sensitive authentication data is limited to that which is needed for a legitimate issuing business need and is secured. Encrypted using strong cryptography."

  children = [
    # App Service apps should have Client Certificates (Incoming client certificates) enabled
    control.appservice_api_app_client_certificates_on,

    # Ensure API app has Client Certificates Incoming client certificates set to On
    control.appservice_web_app_client_certificates_on,

    # Managed identity should be used in API apps
    control.managed_identity_should_be_used_in_api_apps,

    # Azure Database for PostgreSQL should have an Azure Active Directory administrator provisioned
    control.azure_database_for_postgresql_should_have_an_azure_active_directory_administrator_provisioned,

    # Identical Authentication Credentials
    control.identical_authentication_credentials,

    # API Management secret named values should be stored in Azure Key Vault
    control.api_management_secret_named_values_should_be_stored_in_azure_key_vault,

    # Windows machines should meet requirements for 'Security Settings - Account Policies'
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Explicit request authorization should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.explicit_request_authorization_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Audit Windows machines that do not have the password complexity setting enabled
    # control.compute_vm_password_complexity_setting_enabled_windows,

    # API Management calls to API backends should be authenticated
    control.api_management_calls_to_api_backends_should_be_authenticated,

    # Managed identity should be enabled on function apps
    control.appservice_function_app_uses_managed_identity,

    # Azure Cosmos DB accounts should use Azure Active Directory as the only authentication method
    control.cosmosdb_account_uses_aad_and_rbac,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_5" {
  title       = "3.5 - Primary account number (PAN) is secured wherever it is stored."

  children = [
    benchmark.pci_dss_v401_requirement_3_5_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_5_1" {
  title       = "3.5.1 - PAN is rendered unreadable anywhere it is stored"

  description = <<-MARKDOWN
    PAN is rendered unreadable anywhere it is stored by using any of the following approaches:

    * One-way hashes based on strong cryptography of the entire PAN.

    * Truncation (hashing cannot be used to replace the truncated segment of PAN).

      - If hashed and truncated versions of the same PAN, or different truncation formats of the
        same PAN, are present in an environment, additional controls are in place such that the
        different versions cannot be correlated to reconstruct the original PAN.

    * Index tokens.

    * Strong cryptography with associated keymanagement processes and procedures
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_3_5_1_1,
    benchmark.pci_dss_v401_requirement_3_5_1_2,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_5_1_1" {
  title       = "3.5.1.1 - Hashes used to render PAN unreadable (per the first bullet of Requirement 3.5.1) are keyed cryptographic hashes of the entire PAN, with associated keymanagement processes and procedures in accordance with Requirements 3.6 and 3.7."

  children = [
    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL Managed Instance should have the minimal TLS version of 1.2
    control.sql_managed_instance_should_have_the_minimal_tls_version_of_1_2,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Azure SQL Database should be running TLS version 1.2 or newer
    control.azure_sql_database_should_be_running_tls_version_1_2_or_newer,

    # vTPM should be enabled on supported virtual machines
    control.vtpm_should_be_enabled_on_supported_virtual_machines,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Keys using elliptic curve cryptography should have the specified curve names
    control.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names,

    # TLS should be updated to the latest version for API apps
    control.tls_should_be_updated_to_the_latest_version_for_api_apps,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Keys should be the specified cryptographic type RSA or EC
    control.keys_should_be_the_specified_cryptographic_type_rsa_or_ec,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Disk encryption should be enabled on Azure Data Explorer
    control.kusto_cluster_disk_encryption_enabled,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Windows machines should meet requirements for 'Security Options - Network Security'
    control.compute_vm_meet_security_options_network_security_requirement_windows,

    # [Enable if required] PostgreSQL servers should use customer-managed keys to encrypt data at rest
    control.postgres_sql_server_encrypted_at_rest_using_cmk,

    # Windows virtual machines should enable Azure Disk Encryption or EncryptionAtHost.
    control.windows_virtual_machines_should_enable_azure_disk_encryption_or_encryptionathost_,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # Azure Data Explorer encryption at rest should use a customer-managed key
    control.kusto_cluster_encrypted_at_rest_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_5_1_2" {
  title       = "3.5.1.2 - If disk-level or partition-level encryption (rather than file-, column-, or field-level database encryption) is used to render PAN unreadable."

  description = <<-MARKDOWN
    If disk-level or partition-level encryption (rather than file-, column-, or field-level database encryption) is
    used to render PAN unreadable, it is implemented only as follows:

    * On removable electronic media

    OR

    * If used for non-removable electronic media, PAN is also rendered unreadable via another mechanism that meets Requirement 3.5.1.
  MARKDOWN

  children = [
    # Azure Monitor Logs for Application Insights should be linked to a Log Analytics workspace
    control.application_insights_linked_to_log_analytics_workspace,

    # Storage account encryption scopes should use double encryption for data at rest
    control.storage_account_encryption_scopes_should_use_double_encryption_for_data_at_rest,

    # Cognitive Services accounts should enable data encryption
    control.cognitive_account_encrypted_with_cmk,

    # Cognitive Services accounts should use customer owned storage or enable data encryption
    control.cognitive_services_accounts_should_use_customer_owned_storage_or_enable_data_encryption,

    # Windows machines should meet requirements for 'Security Settings - Account Policies'
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Cognitive Services accounts should use customer owned storage
    control.cognitive_services_accounts_should_use_customer_owned_storage,

    # Azure Local instances should have encrypted volumes
    control.azure_local_instances_should_have_encrypted_volumes,

    # Disk encryption should be enabled on Azure Data Explorer
    control.kusto_cluster_disk_encryption_enabled,

    # Windows virtual machines should enable Azure Disk Encryption or EncryptionAtHost.
    control.windows_virtual_machines_should_enable_azure_disk_encryption_or_encryptionathost_,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_6" {
  title       = "3.6 - Cryptographic keys used to protect stored account data are secured."

  children = [
    benchmark.pci_dss_v401_requirement_3_6_1,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_6_1" {
  title       = "3.6.1 - Procedures are defined and implemented to protect cryptographic keys used to protect stored account data against disclosure and misuse"

  description = <<-MARKDOWN
    Procedures are defined and implemented to protect cryptographic keys used to protect stored account data against disclosure and misuse that include:

    * Access to keys is restricted to the fewest number of custodians necessary.
    * Key-encrypting keys are at least as strong as the data-encrypting keys they protect.
    * Key-encrypting keys are stored separately from data-encrypting keys.
    * Keys are stored securely in the fewest possible locations and forms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v401_requirement_3_6_1_1,
    benchmark.pci_dss_v401_requirement_3_6_1_2,
    benchmark.pci_dss_v401_requirement_3_6_1_4,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_6_1_1" {
  title       = "3.6.1.1 - Additional requirement for service providers only: A documented description of the cryptographic architecture is maintained"

  description = <<-MARKDOWN
    Additional requirement for service providers only: A documented description of the cryptographic architecture is maintained that includes:

    * Details of all algorithms, protocols, and keys used for the protection of stored account data, including key strength
      and expiry date.
    * Preventing the use of the same cryptographic keys in production and test environments. This bullet is a best
      practice until its effective date; refer to Applicability Notes below for details.
    * Description of the key usage for each key.
    * Inventory of any hardware security modules (HSMs), key management systems (KMS), and other secure cryptographic
      devices (SCDs) used for key management, including type and location of devices, to support meeting Requirement 12.3.4.
  MARKDOWN

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_6_1_2" {
  title       = "3.6.1.2 - Secret and private keys used to protect stored account data are stored securely."

  description = <<-MARKDOWN
    Secret and private keys used to protect stored account data are stored in one (or more) of the following forms at all times:

    * Encrypted with a key-encrypting key that is at least as strong as the data-encrypting key, and that is stored separately
      from the dataencrypting key.
    * Within a secure cryptographic device (SCD), such as a hardware security module (HSM) or  PTS-approved point-of-interaction device.
    * As at least two full-length key components or key shares, in accordance with an industryaccepted method.
  MARKDOWN

  children = [
    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_6_1_4" {
  title       = "3.6.1.4 - Cryptographic keys are stored in the fewest possible locations."

  children = [
    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7" {
  title       = "3.7 - Where cryptography is used to protect stored account data, key management processes and procedures covering all aspects of the key lifecycle are defined and implemented."

  children = [
    benchmark.pci_dss_v401_requirement_3_7_1,
    benchmark.pci_dss_v401_requirement_3_7_2,
    benchmark.pci_dss_v401_requirement_3_7_3,
    benchmark.pci_dss_v401_requirement_3_7_5,
    benchmark.pci_dss_v401_requirement_3_7_6,
    benchmark.pci_dss_v401_requirement_3_7_7,
    benchmark.pci_dss_v401_requirement_3_7_8,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_1" {
  title       = "3.7.1 - Key-management policies and procedures are implemented to include generation of strong cryptographic keys used to protect stored account data."

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Keys using elliptic curve cryptography should have the specified curve names
    control.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Keys should be the specified cryptographic type RSA or EC
    control.keys_should_be_the_specified_cryptographic_type_rsa_or_ec,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_2" {
  title       = "3.7.2 - Key-management policies and procedures are implemented to include secure distribution of cryptographic keys used to protect stored account data."

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Keys using elliptic curve cryptography should have the specified curve names
    control.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Keys should be the specified cryptographic type RSA or EC
    control.keys_should_be_the_specified_cryptographic_type_rsa_or_ec,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_3" {
  title       = "3.7.3 - Key-management policies and procedures are implemented to include secure storage of cryptographic keys used to protect stored account data."

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_5" {
  title       = "3.7.5 - Key management policies procedures are implemented to include the retirement, replacement, or destruction of keys used to protect stored account data, as deemed necessary."

  description = <<-MARKDOWN
    Key management policies procedures are implemented to include the retirement, replacement, or destruction of keys used to protect stored account data, as deemed necessary when:

    * The key has reached the end of its defined cryptoperiod.
    * The integrity of the key has been weakened, including when personnel with knowledge of a cleartext key component leaves the company, or the role for which the key component was known.
    * The key is suspected of or known to be compromised.

    Retired or replaced keys are not used for encryption operations.
  MARKDOWN

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_6" {
  title       = "3.7.6 - Where manual cleartext cryptographic keymanagement operations are performed by personnel, key-management policies and procedures are implemented, including managing these operations using split knowledge and dual control. "

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # Keys using elliptic curve cryptography should have the specified curve names
    control.keys_using_elliptic_curve_cryptography_should_have_the_specified_curve_names,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Keys should be the specified cryptographic type RSA or EC
    control.keys_should_be_the_specified_cryptographic_type_rsa_or_ec,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_7" {
  title       = "3.7.7 - Key management policies and procedures are implemented to include the prevention of unauthorized substitution of cryptographic keys."

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}

benchmark "pci_dss_v401_requirement_3_7_8" {
  title       = "3.7.8 - Key management policies and procedures are implemented to include that cryptographic key custodians formally acknowledge (in writing or electronically) that they understand and accept their key-custodian responsibilities."

  children = [
    # Storage account keys should not be expired
    control.storage_account_keys_should_not_be_expired,

    # Keys should have a rotation policy ensuring that their rotation is scheduled within the specified number of days after creation.
    control.keyvault_key_automatic_rotation_enabled,

    # SQL servers should use customer-managed keys to encrypt data at rest
    control.sql_server_tde_protector_cmk_encrypted,

    # SQL managed instances should use customer-managed keys to encrypt data at rest
    control.mssql_managed_instance_encryption_at_rest_using_cmk,

    # Client certificate authentication should be enabled on nodes in Azure Kubernetes Services (AKS) clusters
    control.client_certificate_authentication_should_be_enabled_on_aks_nodes,

    # App Configuration should use a customer-managed key
    control.app_configuration_should_use_a_customer_managed_key,

    # Azure Stream Analytics jobs should use customer-managed keys to encrypt data
    control.stream_analytics_job_encrypted_with_cmk,

    # Managed disks should be double encrypted with both platform-managed and customer-managed keys
    control.compute_os_and_data_disk_encrypted_with_cmk_and_platform_managed,

    # Azure Automation accounts should use customer-managed keys to encrypt data at rest
    control.automation_account_encrypted_with_cmk,

    # Azure Container Instance container group should use customer-managed key for encryption
    control.container_instance_container_group_encrypted_using_cmk,

    # Server certificate rotation should be enabled on nodes in Azure Kubernetes Service (AKS) clusters
    control.server_certificate_rotation_should_be_enabled_on_nodes_in_azure_kubernetes_service_aks_clusters,

    # Secure transfer to storage accounts should be enabled
    control.storage_account_secure_transfer_required_enabled,

    # Key Vault keys should have an expiration date
    control.keyvault_key_expiration_set,

    # [Enable if required] SQL servers should use customer-managed keys to encrypt data at rest
    # control.sql_server_tde_protector_cmk_encrypted,

    # Key Vault secrets should have an expiration date
    control.keyvault_secret_expiration_set,

    # [Enable if required] SQL managed instances should use customer-managed keys to encrypt data at rest
    control.enable_if_required_sql_managed_instances_should_use_customer_managed_keys_to_encrypt_data_at_rest,

    # [Preview]: IoT Hub device provisioning service data should be encrypted using customer-managed keys (CMK)
    control.iot_hub_encrypted_with_cmk,
  ]

  tags = local.pci_dss_v401_common_tags
}
