benchmark "nist_sp_800_171_rev_2_3_5" {
  title       = "3.5 Identification and Authentication"
  description = "This family of requirements ensures only authenticated users can access the organization’s network or systems. The 11 requirements cover password and authentication procedures and policy, alongside the reliable identification of users. Requirements ensure the distinction between privileged and non-privileged accounts is reflected in network access."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_5_1,
    benchmark.nist_sp_800_171_rev_2_3_5_2,
    benchmark.nist_sp_800_171_rev_2_3_5_5,
    benchmark.nist_sp_800_171_rev_2_3_5_6,
    benchmark.nist_sp_800_171_rev_2_3_5_7,
    benchmark.nist_sp_800_171_rev_2_3_5_8,
    benchmark.nist_sp_800_171_rev_2_3_5_10
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_1" {
  title       = "3.5.1 Identify system users, processes acting on behalf of users, and devices"
  description = "Common device identifiers include Media Access Control (MAC), Internet Protocol (IP) addresses, or device-unique token identifiers. Management of individual identifiers is not applicable to shared system accounts. Typically, individual identifiers are the user names associated with the system accounts assigned to those individuals. Organizations may require unique identification of individuals in group accounts or for detailed accountability of individual activity. In addition, this requirement addresses individual identifiers that are not necessarily associated with system accounts. Organizational devices requiring identification may be defined by type, by device, or by a combination of type/device."
  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_2" {
  title       = "3.5.2 Authenticate (or verify) the identities of users, processes, or devices, as a prerequisite to allowing access to organizational systems."
  description = "Individual authenticators include the following: passwords, key cards, cryptographic devices, and one-time password devices. Initial authenticator content is the actual content of the authenticator, for example, the initial password. In contrast, the requirements about authenticator content include the minimum password length. Developers ship system components with factory default authentication credentials to allow for initial installation and configuration. Default authentication credentials are often well known, easily discoverable, and present a significant security risk. Systems support authenticator management by organization-defined settings and restrictions for various authenticator characteristics including minimum password length, validation time window for time synchronous one-time tokens, and number of allowed rejections during the verification stage of biometric authentication. Authenticator management includes issuing and revoking, when no longer needed, authenticators for temporary access such as that required for remote maintenance. Device authenticators include certificates and passwords."
  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_ssh_key_authentication_linux,
    control.keyvault_key_expiration_set,
    control.keyvault_secret_expiration_set,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_5" {
  title       = "3.5.5 Prevent reuse of identifiers for a defined period"
  description = "Identifiers are provided for users, processes acting on behalf of users, or devices (3.5.1). Preventing reuse of identifiers implies preventing the assignment of previously used individual, group, role, or device identifiers to different individuals, groups, roles, or devices."
  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_6" {
  title       = "3.5.6 Disable identifiers after a defined period of inactivity"
  description = "Inactive identifiers pose a risk to organizational information because attackers may exploit an inactive identifier to gain undetected access to organizational devices. The owners of the inactive accounts may not notice if unauthorized access to the account has been obtained."
  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.cognitive_service_local_auth_disabled,
    control.iam_deprecated_account,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_7" {
  title       = "3.5.7 Enforce a minimum password complexity and change of characters when new passwords are created"
  description = "This requirement applies to single-factor authentication of individuals using passwords as individual or group authenticators, and in a similar manner, when passwords are used as part of multifactor authenticators. The number of changed characters refers to the number of changes required with respect to the total number of positions in the current password. To mitigate certain brute force attacks against passwords, organizations may also consider salting passwords."
  children = [
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_min_password_length_14_windows,
    control.compute_vm_password_complexity_setting_enabled_windows
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_8" {
  title       = "3.5.8 Prohibit password reuse for a specified number of generations"
  description = "Password lifetime restrictions do not apply to temporary passwords."
  children = [
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_restrict_previous_24_passwords_resuse_windows
  ]
}

benchmark "nist_sp_800_171_rev_2_3_5_10" {
  title       = "3.5.10 Store and transmit only cryptographically-protected passwords"
  description = "Cryptographically-protected passwords use salted one-way cryptographic hashes of passwords."
  children = [
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows
  ]
}
