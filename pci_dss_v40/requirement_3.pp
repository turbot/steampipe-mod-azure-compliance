benchmark "pci_dss_v40_requirement_3" {
  title       = "Requirement 3 - Protect Stored Account Data"

  description = <<-MARKDOWN
    Protection methods such as encryption, truncation, masking, and hashing are critical components of account data protection. If an intruder
    circumvents other security controls and gains access to encrypted account data, the data is unreadable without the proper cryptographic keys
    and is unusable to that intruder. Other effective methods of protecting stored data should also be considered as potential risk-mitigation
    opportunities. For example, methods for minimizing risk include not storing account data unless necessary, truncating cardholder data if full
    PAN is not needed, and not sending unprotected PANs using end-user messaging technologies such as e-mail and instant messaging.

    If account data is present in non-persistent memory (for example, RAM, volatile memory), encryption of account data is not required. However,
    proper controls must be in place to ensure that memory maintains a non-persistent state. Data should be removed from volatile memory once
    the business purpose (for example, the associated transaction) is complete. In the case that data storage becomes persistent, all applicable PCI
    DSS Requirements will apply including encryption of stored data.

    Requirement 3 applies to protection of stored account data unless specifically called out in an individual requirement.

    Refer to Appendix G for definitions of “strong cryptography” and other PCI DSS terms.
  MARKDOWN

  children = [
    benchmark.pci_dss_v40_requirement_3_3,
    benchmark.pci_dss_v40_requirement_3_5
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_3_3" {
  title       = "3.3 - Sensitive authentication data (SAD) is not stored after authorization"
  children = [
    benchmark.pci_dss_v40_requirement_3_3_3
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_3_3_3" {
  title       = "3.3.3 - Sensitive authentication data is retained only as required to support issuing functions and is secured from unauthorized access"

  description = <<-MARKDOWN
    Additional requirement for issuers and companies that support issuing services and store sensitive authentication data: Any storage of sensitive authentication data is:

    * Limited to that which is needed for a legitimate issuing business need and is secured.
    * Encrypted using strong cryptography. This bullet is a best practice until its effective date; refer to Applicability Notes below for details.
  MARKDOWN

  children = [
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.sql_db_active_directory_admin_configured,
    control.iam_no_custom_role
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_3_5" {
  title       = "3.5 - Primary account number (PAN) is secured wherever it is stored."
  children = [
    benchmark.pci_dss_v40_requirement_3_5_1_star
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_3_5_1_star" {
  title       = "3.5.1.* - Primary account number (PAN) is secured wherever it is stored"

  description = "Additional assessments for 3.5.1 - Primary account number (PAN) is secured wherever it is stored"

  children = [
    control.appservice_function_app_only_https_accessible,
    control.automation_account_variable_encryption_enabled,
    control.servicefabric_cluster_protection_level_as_encrypt_and_sign,
    control.sql_database_transparent_data_encryption_enabled,
    control.redis_cache_ssl_enabled,
    control.storage_account_secure_transfer_required_enabled,
    control.appservice_api_app_use_https
  ]

  tags = local.pci_dss_v40_common_tags
}
