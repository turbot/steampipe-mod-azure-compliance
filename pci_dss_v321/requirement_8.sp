benchmark "pci_dss_v321_requirement_8" {
  title       = "Requirement 8: Identify and authenticate access to system components"
  description = "Assigning a unique identification (ID) to each person with access ensures that actions taken on critical data and systems are performed by, and can be traced to, known and authorized users. Requirements apply to all accounts, including point of sale accounts, with administrative capabilities and all accounts with access to stored cardholder data. Requirements do not apply to accounts used by consumers (eg.,cardholders)."
  children = [
    benchmark.pci_dss_v321_requirement_8_1,
    benchmark.pci_dss_v321_requirement_8_2,
    benchmark.pci_dss_v321_requirement_8_3
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_1" {
  title       = "Define and implement policies and procedures to ensure proper user identification management for users and administrators on all system components. Assign all users a unique user name before allowing them to access system components or cardholder data"
  children = [
    benchmark.pci_dss_v321_requirement_8_1_2,
    benchmark.pci_dss_v321_requirement_8_1_3,
    benchmark.pci_dss_v321_requirement_8_1_5
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_1_2" {
  title       = "Control addition, deletion, and modification of user IDs, credentials, and other identifier objects"
  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission
    // control 5
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_1_3" {
  title       = "Immediately revoke access for any terminated users"
  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_1_5" {
  title       = "Manage IDs used by thid parties to access, support, or maintain system components via remote access as follows: - Enabled only during the time period needed and disabled when not in use. - Monitored when in use"
  children = [
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission
    // control 5
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_2" {
  title       = "Employ at least one of these to authenticate all users: something you know, such as a password or passphrase; something you have, such as a token device or smart card; or something you are, such as a biometric. Use strong authentication methods and render all passwords/passphrases unreadable during transmission and storage using strong cryptography"
  children = [
    benchmark.pci_dss_v321_requirement_8_2_3,
    benchmark.pci_dss_v321_requirement_8_2_5
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_2_3" {
  title       = "Passwords/phrases must meet the following: - Require a minimum length of at least seven characters. - Contain both numeric and alphabetic characters. Alternatively, the passwords/phrases must have complexity and strength at least equivalent to the parameters specified above"
  children = [
    // control 1
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_guest_configuration_installed_windows
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_2_5" {
  title       = "Do not allow an individual to submit a new password/phrase that is the same as any of the last four passwords/phrases he or she has used"
  children = [
    // control 1
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_guest_configuration_installed_windows
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_3" {
  title       = "Secure all individual non-console administrative access and all remote access to the cardholder data environment using multi-factor authentication. This requires at least two of the three authentication methods described in 8.2 are used for authentication. Using one factor twice (e.g. using two separate passwords) is not considered multi-factor authentication. This requirement applies to administrative personnel with non-console access to the CDE from within the entity's network, and all remote network access (including for users, administrators, and third-parties) originating from outside the entity's network"
  children = [
    benchmark.pci_dss_v321_requirement_8_3_1
  ]

  tags = local.pci_dss_v321_common_tags
}

benchmark "pci_dss_v321_requirement_8_3_1" {
  title       = "Incorporate multi-factor authentication for all non-console access into the CDE for personnel with administrative access"
  children = [
    control.sql_server_azure_ad_authentication_enabled,
    control.iam_no_custom_role,
    control.iam_external_user_with_owner_role
    // control 4
    // control 5
    // control 6
  ]

  tags = local.pci_dss_v321_common_tags
}

