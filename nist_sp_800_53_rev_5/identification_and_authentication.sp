benchmark "nist_sp_800_53_rev_5_ia" {
  title       = "Identification and Authentication (IA)"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_2,
    benchmark.nist_sp_800_53_rev_5_ia_4,
    benchmark.nist_sp_800_53_rev_5_ia_5
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_2" {
  title       = "Identification and Authentication (organizational Users) (IA-2)"
  description = "Identify and authenticate organization users and processes."
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_2_1,
    benchmark.nist_sp_800_53_rev_5_ia_2_2,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_read_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_2_1" {
  title       = "Multi-factor Authentication to Privileged Accounts IA-2(1)"
  description = "Implement multi-factor authentication for access to privileged accounts."
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled,
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_2_2" {
  title       = "Multi-factor Authentication to Non-privileged Accounts"
  description = "Implement multi-factor authentication for access to non-privileged accounts."
  children = [
    control.iam_user_with_read_permission_on_subscription_mfa_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_ia_4" {
  title       = "Identifier Management (IA-4)"
  description = "Manage information system identifiers for users and devices. Automate authorizing and disabling users to prevent misuse."
  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5" {
  title       = "Authenticator Management (IA-5)"
  description = "Authenticate users and devices. Automate administrative control. Enforce restrictions. Protect against unauthorized use."
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_5_1,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_password_file_permissions_0644_linux,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_ssh_key_authentication_linux,
    control.keyvault_certificate_validity_12_months,
    control.keyvault_key_expiration_set,
    control.keyvault_secret_expiration_set
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5_1" {
  title       = "Password-based Authentication IA-5(1) "
  description = "The information system, for password-based authentication, enforces minimum password complexity of organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type; enforces at least the organization-defined number of changed characters when new passwords are created; stores and transmits only cryptographically-protected passwords; enforces password minimum and maximum lifetime restrictions of organization-defined numbers for lifetime minimum, lifetime maximum; prohibits password reuse for organization-defined number generations; and allows the use of a temporary password for system logons with an immediate change to a permanent password."
  children = [
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_max_password_age_70_days_windows,
    control.compute_vm_min_password_age_1_day_windows,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows,
    control.compute_vm_password_file_permissions_0644_linux,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows
  ]

  tags = merge(local.nist_sp_800_53_rev_5_common_tags, {
    service = "Azure/Compute"
  })
}
