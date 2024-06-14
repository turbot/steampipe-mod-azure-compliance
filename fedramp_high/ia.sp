benchmark "fedramp_high_ia" {
  title       = "Identification and Authentication (IA)"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."

  children = [
    benchmark.fedramp_high_ia_2,
    benchmark.fedramp_high_ia_4,
    benchmark.fedramp_high_ia_5,
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_ia_2" {
  title       = "Identification and Authentication (Organizational users) (IA-2)"
  description = "The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users)."

  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_ia_4" {
  title       = "Identifier Management (IA-4)"
  description = "Manage information system identifiers for users and devices. Automate authorizing and disabling users to prevent misuse."

  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_ia_5" {
  title       = "Authenticator Management (IA-5)"
  description = "Authenticate users and devices. Automate administrative control. Enforce restrictions. Protect against unauthorized use."

  children = [
    benchmark.fedramp_high_ia_5_1,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_ssh_key_authentication_linux,
    control.keyvault_key_expiration_set,
    control.keyvault_secret_expiration_set
  ]
}

benchmark "fedramp_high_ia_5_1" {
  title       = "IA-5(1) Password-Based Authentication"
  description = "The information system, for password-based authentication that enforces  minimum password complexity, stores and transmits only cryptographically-protected passwords, enforces password minimum and maximum lifetime restrictions, prohibits password reuse, allows the use of a temporary password for system logons with an immediate change to a permanent password etc."

  children = [
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_password_complexity_setting_enabled_windows,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows
  ]
}