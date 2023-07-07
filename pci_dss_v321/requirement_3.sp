benchmark "pci_dss_v321_requirement_3" {
  title       = "Requirement 3 - Protect stored cardholder data"
  description = "Cardholder data should not be stored unless it's necessary to meet the needs of the business. Sensitive data on the magnetic stripe or chip must never be stored after authorization. If your organization stores PAN, it is crucial to render it unreadable (see 3.4, and table below for guidelines)."
  children = [
    benchmark.pci_dss_v321_requirement_3_2,
    benchmark.pci_dss_v321_requirement_3_4
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_3_2" {
  title       = "PCI DSS requirement 3.2"
  description = "Do not store sensitive authentication data after authorization (even if it is encrypted). Render all sensitive authentication data unrecoverable upon completion of the authorization process. Issuers and related entities may store sensitive authentication data if there is a business justification, and the data is stored securely."
  children = [
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_3_4" {
  title       = "PCI DSS requirement 3.4"
  description = "Render PAN unreadable anywhere it is stored - including on portable digital media, backup media, in logs, and data received from or stored by wireless networks. Technology solutions for this requirement may include strong one-way hash functions of the entire PAN, truncation, index tokens with securely stored pads, or strong cryptography."
  children = [
    control.appservice_api_app_use_https,
    control.appservice_function_app_only_https_accessible,
    control.automation_account_variable_encryption_enabled,
    control.azure_redis_cache_ssl_enabled,
    control.compute_vm_temp_disks_cache_and_data_flows_encrypted,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_database_transparent_data_encryption_enabled,
    control.storage_account_secure_transfer_required_enabled
  ]

  tags = local.pci_dss_v321_common_tags
}
