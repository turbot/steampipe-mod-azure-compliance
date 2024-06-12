benchmark "fedramp_high_identication_and_authentication" {
  title       = "Identification And Authentication"
  description = "The organization manages information system access using identification and authentication mechanisms that are based on attributes of users and objects as a means of ensuring authorized access to organizational information systems."

  children = [
    benchmark.fedramp_high_identication_and_authentication_2,
    benchmark.fedramp_high_identication_and_authentication_4,
    benchmark.fedramp_high_identication_and_authentication_5,
  ]

  tags = local.fedramp_high_common_tags
}

benchmark "fedramp_high_identication_and_authentication_2" {
  title = "Identification And Authentication-2"

  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_identication_and_authentication_4" {
  title = "Identifier Management-4"

  children = [
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
    control.servicefabric_cluster_active_directory_authentication_enabled,
    control.sql_server_azure_ad_authentication_enabled
  ]
}

benchmark "fedramp_high_identication_and_authentication_5" {
  title = "Authenticator Management-5"

  children = [
    benchmark.fedramp_high_identication_and_authentication_5_1,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows,
    control.compute_vm_ssh_key_authentication_linux,
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.keyvault_key_expiration_set,
    control.keyvault_secret_expiration_set,
  ]
}

benchmark "fedramp_high_identication_and_authentication_5_1" {
  title = "Password-Based Authentication-5.1"

  children = [
    control.compute_vm_guest_configuration_installed_linux,
    control.compute_vm_guest_configuration_installed_windows,
    control.compute_vm_guest_configuration_with_no_managed_identity,
    control.compute_vm_guest_configuration_with_user_and_system_assigned_managed_identity,
    control.compute_vm_password_complexity_setting_enabled_windows,
    control.compute_vm_passwords_stored_using_reversible_encryption_windows
  ]
}