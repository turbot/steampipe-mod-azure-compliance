locals {
  all_controls_activedirectory_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "all_controls_activedirectory" {
  title       = "Active Directory"
  description = "This section contains recommendations for configuring Active Directory resources."
  children = [
    control.ad_account_duration_min_60_seconds,
    control.ad_account_lockout_threshold_max_10,
    control.ad_admin_portals_require_mfa,
    control.ad_all_user_mfa_enabled,
    control.ad_authorization_policy_guest_invite_restricted,
    control.ad_authorization_policy_guest_user_access_restricted,
    control.ad_authorization_policy_user_consent_disallowed,
    control.ad_authorization_policy_user_consent_verified_publishers_selected_permissions,
    control.ad_custom_banned_password_enforced,
    control.ad_disabled_user_no_role_assignments,
    control.ad_guest_user_reviewed_monthly,
    control.ad_m365_group_creation_disabled,
    control.ad_mfa_service_mgmt_api,
    control.ad_require_mfa_for_device_join,
    control.ad_security_defaults_policy_enabled,
    control.iam_conditional_access_mfa_enabled,
    control.iam_conditional_access_trusted_location_configured,
    control.iam_deprecated_account_with_owner_roles,
    control.iam_deprecated_account,
    control.iam_external_user_with_owner_role,
    control.iam_external_user_with_read_permission,
    control.iam_external_user_with_write_permission,
    control.iam_no_custom_role,
    control.iam_no_custom_subscription_owner_roles_created,
    control.iam_subscription_owner_between_2_and_3,
    control.iam_subscription_owner_max_3,
    control.iam_subscription_owner_more_than_1,
    control.iam_subscription_tenant_transfer_restricted,
    control.iam_subscriptions_with_custom_roles_no_overly_permissive,
    control.iam_user_access_administrator_role_restricted,
    control.iam_user_no_built_in_contributor_role,
    control.iam_user_not_allowed_to_create_security_group,
    control.iam_user_not_allowed_to_create_tenants,
    control.iam_user_not_allowed_to_register_application,
  ]

  tags = merge(local.all_controls_activedirectory_common_tags, {
    type = "Benchmark"
  })
}
