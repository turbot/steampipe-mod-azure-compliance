benchmark "nist_sp_800_53_rev_5_ac" {
  title       = "Access Control (AC)"
  description = "to do."
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_2
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}


benchmark "nist_sp_800_53_rev_5_ac_2" {
  title       = "Account Management (AC-2)"
  description = "to  do"
  children = [
    benchmark.nist_sp_800_53_rev_5_ac_2_1,
    benchmark.nist_sp_800_53_rev_5_ac_2_7,
    benchmark.nist_sp_800_53_rev_5_ac_2_12,
    control.iam_subscription_owner_max_3,
    control.iam_no_custom_role,
    control.iam_deprecated_account,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_web_app_uses_managed_identity,
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "to  do"
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_7" {
  title       = "AC-2(7) Privileged User Accounts"
  description = "to  do"
  children = [
    control.iam_no_custom_role
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}

benchmark "nist_sp_800_53_rev_5_ac_2_12" {
  title       = "AC-2(12) AAccount Monitoring for Atypical Usage"
  description = "to  do."
  children = [
  ]

  tags = local.nist_sp_800_53_rev_5_common_tags
}