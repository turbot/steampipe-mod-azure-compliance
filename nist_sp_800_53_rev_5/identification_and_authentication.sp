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
    benchmark.nist_sp_800_53_rev_5_ia_2_2,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_2_2" {
  title       = "IA-2(2) Multi-factor Authentication to Non-privileged Accounts"
  description = "The information system implements multi-factor authentication for network access to non-privileged accounts."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_4" {
  title       = "Identifier Management (IA-4)"
  description = "Manage information system identifiers for users and devices. Automate authorizing and disabling users to prevent misuse."
  children = [
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5" {
  title       = "Authenticator Management (IA-5)"
  description = "Authenticate users and devices. Automate administrative control. Enforce restrictions. Protect against unauthorized use."
  children = [
    benchmark.nist_sp_800_53_rev_5_ia_5_1
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ia_5_1" {
  title       = "IA-5(1) Password-based Authentication"
  description = "The information system, for password-based authentication, enforces minimum password complexity of organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type; enforces at least the organization-defined number of changed characters when new passwords are created; stores and transmits only cryptographically-protected passwords; enforces password minimum and maximum lifetime restrictions of organization-defined numbers for lifetime minimum, lifetime maximum; prohibits password reuse for organization-defined number generations; and allows the use of a temporary password for system logons with an immediate change to a permanent password."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}
