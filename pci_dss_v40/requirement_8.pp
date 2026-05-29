benchmark "pci_dss_v40_requirement_8" {
  title       = "Requirement 8 - Identify Users and Authenticate Access to System Components"
  children = [
    benchmark.pci_dss_v40_requirement_8_2,
    benchmark.pci_dss_v40_requirement_8_3,
    benchmark.pci_dss_v40_requirement_8_4
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_2" {
  title       = "8.2 - User identification and related accounts for users and administrators are strictly managed throughout an account’s lifecycle"
  children = [
    benchmark.pci_dss_v40_requirement_8_2_4,
    benchmark.pci_dss_v40_requirement_8_2_5,
    benchmark.pci_dss_v40_requirement_8_2_7
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_2_4" {
  title       = "8.2.4 - Addition, deletion, and modification of user IDs, authentication factors, and other identifier objects are managed"

  description = <<-MARKDOWN
    Addition, deletion, and modification of user IDs, authentication factors, and other identifier objects are managed as follows:

    * Authorized with the appropriate approval.
    * Implemented with only the privileges specified on the documented approval.
  MARKDOWN

  children = [
    control.iam_external_user_with_write_permission,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_owner_role,
    control.iam_disabled_user_with_write_permission,
    control.iam_disabled_user_with_owner_permission
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_2_5" {
  title       = "8.2.5 - Access for terminated users is immediately revoked"

  description = "Access for terminated users is immediately revoked."

  children = [
    control.iam_disabled_user_with_write_permission,
    control.iam_disabled_user_with_owner_permission
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_2_7" {
  title       = "8.2.7 - Accounts used by third parties to access, support, or maintain system components via remote access are managed"
  description = <<-MARKDOWN
    Accounts used by third parties to access, support, or maintain system components via remote access are managed as follows:

    * Enabled only during the time period needed and disabled when not in use.
    * Use is monitored for unexpected activity.
  MARKDOWN
  children = [
    control.iam_external_user_with_write_permission,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_owner_role,
    control.iam_disabled_user_with_write_permission,
    control.iam_disabled_user_with_owner_permission
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_3" {
  title       = "8.3 - Strong authentication for users and administrators is established and managed"
  children = [
    benchmark.pci_dss_v40_requirement_8_3_6
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_3_6" {
  title       = "8.3.6 - Passwords/passphrases meet complexity and strength requirements for authentication"

  description = <<-MARKDOWN
    If passwords/passphrases are used as authentication factors to meet Requirement 8.3.1, they meet the following minimum level of complexity:

    * A minimum length of 12 characters (or IF the system does not support 12 characters, a minimum length of eight characters).
    * Contain both numeric and alphabetic characters.
  MARKDOWN

  children = [
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_4" {
  title       = "8.4 - Multi-factor authentication (MFA) is implemented to secure access into the CDE"
  children = [
    benchmark.pci_dss_v40_requirement_8_4_1
  ]

  tags = local.pci_dss_v40_common_tags
}

benchmark "pci_dss_v40_requirement_8_4_1" {
  title       = "PCI DSS requirement 8.4.1"

  description = <<-MARKDOWN
    MFA is implemented for all non-console access into the CDE for personnel with administrative access.
  MARKDOWN

  children = [
    control.iam_external_user_with_write_permission,
    control.iam_external_user_with_read_permission,
    control.sql_db_active_directory_admin_configured,
    control.iam_external_user_with_owner_role,
    control.iam_no_custom_role
  ]

  tags = local.pci_dss_v40_common_tags
}
