locals {
  all_controls_activedirectory_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "all_controls_activedirectory" {
  title       = "Active Directory"
  description = "This section contains recommendations for configuring Active Directory resources."
  children = [
    control.ad_guest_user_reviewed_monthly,
    control.iam_conditional_access_mfa_enabled,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role,
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1,
    control.iam_user_no_built_in_contributor_role,
    control.iam_user_not_allowed_to_create_security_group,
    control.iam_user_not_allowed_to_register_application
  ]

  tags = merge(local.all_controls_activedirectory_common_tags, {
    type = "Benchmark"
  })
}
