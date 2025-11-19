locals {
  cis_v500_5_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "5"
  })
}

locals {
  cis_v500_5_1_common_tags = merge(local.cis_v500_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v500_5_2_common_tags = merge(local.cis_v500_5_common_tags, {
    cis_section_id = "5.2"
  })
  cis_v500_5_3_common_tags = merge(local.cis_v500_5_common_tags, {
    cis_section_id = "5.3"
  })
}

benchmark "cis_v500_5" {
  title         = "5 Identity Services"
  documentation = file("./cis_v500/docs/cis_v500_5.md")
  children = [
    benchmark.cis_v500_5_1,
    benchmark.cis_v500_5_2,
    benchmark.cis_v500_5_3,
    control.cis_v500_5_4,
    control.cis_v500_5_5,
    control.cis_v500_5_6,
    control.cis_v500_5_7,
    control.cis_v500_5_8,
    control.cis_v500_5_9,
    control.cis_v500_5_10,
    control.cis_v500_5_11,
    control.cis_v500_5_12,
    control.cis_v500_5_13,
    control.cis_v500_5_14,
    control.cis_v500_5_15,
    control.cis_v500_5_16,
    control.cis_v500_5_17,
    control.cis_v500_5_18,
    control.cis_v500_5_19,
    control.cis_v500_5_20,
    control.cis_v500_5_21,
    control.cis_v500_5_22,
    control.cis_v500_5_23,
    control.cis_v500_5_24,
    control.cis_v500_5_25,
    control.cis_v500_5_26,
    control.cis_v500_5_27,
    control.cis_v500_5_28
  ]

  tags = merge(local.cis_v500_5_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v500_5_1" {
  title         = "5.1 Security Defaults (Per-User MFA)"
  documentation = file("./cis_v500/docs/cis_v500_5_1.md")
  children = [
    control.cis_v500_5_1_1,
    control.cis_v500_5_1_2,
    control.cis_v500_5_1_3
  ]

  tags = merge(local.cis_v500_5_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_5_1_1" {
  title         = "5.1.1 Ensure that 'security defaults' is enabled in Microsoft Entra ID"
  description   = "Security defaults in Microsoft Entra ID make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks."
  query         = query.ad_security_defaults_policy_enabled
  documentation = file("./cis_v500/docs/cis_v500_5_1_1.md")

  tags = merge(local.cis_v500_5_1_common_tags, {
    cis_item_id = "5.1.1"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_1_2" {
  title         = "5.1.2 Ensure that 'multifactor authentication' is 'enabled' for all users"
  description   = "Multifactor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multifactor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multifactor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_1_2.md")

  tags = merge(local.cis_v500_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_1_3" {
  title         = "5.1.3 Ensure that 'Allow users to remember multifactor authentication on devices they trust' is disabled"
  description   = "Remembering Multi-Factor Authentication (MFA) for devices and browsers allows users to have the option to bypass MFA for a set number of days after performing a successful sign-in using MFA. This can enhance usability by minimizing the number of times a user may need to perform two-step verification on the same device. However, if an account or device is compromised, remembering MFA for trusted devices may affect security. Hence, it is recommended that users not be allowed to bypass MFA."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_1_3.md")

  tags = merge(local.cis_v500_5_1_common_tags, {
    cis_item_id = "5.1.3"
    cis_level   = "1"
    cis_type    = "manual"
  })
}


benchmark "cis_v500_5_2" {
  title         = "5.2 Conditional Access"
  documentation = file("./cis_v500/docs/cis_v500_5_2.md")
  children = [
    control.cis_v500_5_2_1,
    control.cis_v500_5_2_2,
    control.cis_v500_5_2_3,
    control.cis_v500_5_2_4,
    control.cis_v500_5_2_5,
    control.cis_v500_5_2_6,
    control.cis_v500_5_2_7,
    control.cis_v500_5_2_8
  ]

  tags = merge(local.cis_v500_5_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_5_2_1" {
  title         = "5.2.1 Ensure that 'trusted locations' are defined"
  description   = "Microsoft Entra ID Conditional Access allows an organization to configure Named locations and configure whether those locations are trusted or untrusted. These settings provide organizations the means to specify Geographical locations for use in conditional access policies, or define actual IP addresses and IP ranges and whether or not those IP addresses and/or ranges are trusted by the organization."
  query         = query.iam_conditional_access_trusted_location_configured
  documentation = file("./cis_v500/docs/cis_v500_5_2_1.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.1"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_2" {
  title         = "5.2.2 Ensure that an exclusionary geographic Conditional Access policy is considered"
  description   = "Conditional Access Policies can be used to block access from geographic locations that are deemed out-of-scope for your organization or application. The scope and variables for this policy should be carefully examined and defined."
  query         = query.ad_manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_2_2.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.2"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_3" {
  title         = "5.2.3 Ensure that an exclusionary device code flow policy is considered"
  description   = "Conditional Access Policies can be used to prevent the Device code authentication flow. Device code flow should be permitted only for users that regularly perform duties that explicitly require the use of Device Code to authenticate, such as utilizing Azure with PowerShell."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_2_3.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.3"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_4" {
  title         = "5.2.4 Ensure that a multifactor authentication policy exists for all users"
  description   = "A Conditional Access policy can be enabled to ensure that users are required to use Multifactor Authentication (MFA) to login."
  query         = query.ad_all_user_mfa_enabled
  documentation = file("./cis_v500/docs/cis_v500_5_2_4.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.4"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_5" {
  title         = "5.2.5 Ensure that multifactor authentication is required for risky sign-ins"
  description   = "Entra ID tracks the behavior of sign-in events. If the Entra ID domain is licensed with P2, the sign-in behavior can be used as a detection mechanism for additional scrutiny during the sign-in event. If this policy is set up, then Risky Sign-in events will prompt users to use multi-factor authentication (MFA) tokens on login for additional verification."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_2_5.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.5"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_6" {
  title         = "5.2.6 Ensure that multifactor authentication is required for Windows Azure Service Management API"
  description   = "This recommendation ensures that users accessing the Windows Azure Service Management API (i.e. Azure Powershell, Azure CLI, Azure Resource Manager API, etc.) are required to use multi-factor authentication (MFA) credentials when accessing resources through the Windows Azure Service Management API."
  query         = query.ad_mfa_service_mgmt_api
  documentation = file("./cis_v500/docs/cis_v500_5_2_6.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.6"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_7" {
  title         = "5.2.7 Ensure that multifactor authentication is required to access Microsoft Admin Portals"
  description   = "This recommendation ensures that users accessing Microsoft Admin Portals (i.e. Microsoft 365 Admin, Microsoft 365 Defender, Exchange Admin Center, Azure Portal, etc.) are required to use multi-factor authentication (MFA) credentials when logging into an Admin Portal."
  query         = query.ad_admin_portals_require_mfa
  documentation = file("./cis_v500/docs/cis_v500_5_2_7.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.7"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_2_8" {
  title         = "5.2.8 Ensure a Token Protection Conditional Access policy is considered"
  description   = "This recommendation ensures that issued tokens are only issued to the intended device."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_2_8.md")

  tags = merge(local.cis_v500_5_2_common_tags, {
    cis_item_id = "5.2.8"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

benchmark "cis_v500_5_3" {
  title         = "5.3 Periodic Identity Reviews"
  documentation = file("./cis_v500/docs/cis_v500_5_3.md")
  children = [
    control.cis_v500_5_3_1,
    control.cis_v500_5_3_2,
    control.cis_v500_5_3_3,
    control.cis_v500_5_3_4,
    control.cis_v500_5_3_5,
    control.cis_v500_5_3_6,
    control.cis_v500_5_3_7
  ]

  tags = merge(local.cis_v500_5_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_5_3_1" {
  title         = "5.3.1 Ensure that Azure admin accounts are not used for daily operations"
  description   = "Microsoft Azure admin accounts should not be used for routine, non-administrative tasks."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_3_1.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.1"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_3_2" {
  title         = "5.3.2 Ensure that guest users are reviewed on a regular basis"
  description   = "Microsoft Entra ID has native and extended identity functionality allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities."
  query         = query.ad_guest_user_reviewed_monthly
  documentation = file("./cis_v500/docs/cis_v500_5_3_2.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.2"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_3_3" {
  title         = "5.3.3 Ensure that use of the 'User Access Administrator' role is restricted"
  description   = "The User Access Administrator role grants the ability to view all resources and manage access assignments at any subscription or management group level within the tenant. Due to its high privilege level, this role assignment should be removed immediately after completing the necessary changes at the root scope to minimize security risks."
  query         = query.iam_user_access_administrator_role_restricted
  documentation = file("./cis_v500/docs/cis_v500_5_3_3.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.3"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_3_4" {
  title         = "5.3.4 Ensure that all 'privileged' role assignments are periodically reviewed"
  description   = "Periodic review of privileged role assignments is performed to ensure that the privileged roles assigned to users are accurate and appropriate."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_3_4.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.4"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_3_5" {
  title         = "5.3.5 Ensure disabled user accounts do not have read, write, or owner permissions"
  description   = "Ensure that any roles granting read, write, or owner permissions are removed from disabled Azure user accounts. While an automated assessment procedure exists for this recommendation, the assessment status remains manual. Removing role assignments from disabled user accounts depends on the context and requirements of each organization and environment."
  query         = query.ad_disabled_user_no_role_assignments
  documentation = file("./cis_v500/docs/cis_v500_5_3_5.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.5"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_3_6" {
  title         = "5.3.6 Ensure 'Tenant Creator' role assignments are periodically reviewed"
  description   = "Perform a periodic review of the Tenant Creator role assignment to ensure that the assignments are accurate and appropriate."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_3_6.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.6"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_3_7" {
  title         = "5.3.7 Ensure all non-privileged role assignments are periodically reviewed"
  description   = "Perform a periodic review of non-privileged role assignments to ensure that the nonprivileged roles assigned to users are appropriate."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_3_7.md")

  tags = merge(local.cis_v500_5_3_common_tags, {
    cis_item_id = "5.3.7"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_4" {
  title         = "5.4 Ensure that 'Restrict non-admin users from creating tenants' is set to 'Yes'"
  description   = "Require administrators or appropriately delegated users to create new tenants."
  query         = query.iam_user_not_allowed_to_create_tenants
  documentation = file("./cis_v500/docs/cis_v500_5_4.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_5" {
  title         = "5.5 Ensure that 'Number of methods required to reset' is set to '2'"
  description   = "Ensures that two alternate forms of identification are provided before allowing a password reset."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_5.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_6" {
  title         = "5.6 Ensure that account 'Lockout threshold' is less than or equal to '10'"
  description   = "The account lockout threshold determines how many failed login attempts are permitted prior to placing the account in a locked-out state and initiating a variable lockout duration."
  query         = query.ad_account_lockout_threshold_max_10
  documentation = file("./cis_v500/docs/cis_v500_5_6.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.6"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_7" {
  title         = "5.7 Ensure that account 'Lockout duration in seconds' is greater than or equal to '60'"
  description   = "The account lockout duration value determines how long an account retains the status of lockout, and therefore how long before a user can continue to attempt to login after passing the lockout threshold."
  query         = query.ad_account_duration_min_60_seconds
  documentation = file("./cis_v500/docs/cis_v500_5_7.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.7"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_8" {
  title         = "5.8 Ensure that a 'Custom banned password list' is set to 'Enforce'"
  description   = "Microsoft Azure applies a default global banned password list to all user and admin accounts that are created and managed directly in Microsoft Entra ID. The Microsoft Entra password policy does not apply to user accounts that are synchronized from an on-premises Active Directory environment, unless Microsoft Entra ID Connect is used and EnforceCloudPasswordPolicyForPasswordSyncedUsers is enabled."
  query         = query.ad_custom_banned_password_enforced
  documentation = file("./cis_v500/docs/cis_v500_5_8.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.8"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_9" {
  title         = "5.9 Ensure that 'Number of days before users are asked to re-confirm their authentication information' is not set to '0'"
  description   = "Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_9.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.9"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_10" {
  title         = "5.10 Ensure that 'Notify users on password resets?' is set to 'Yes'"
  description   = "Ensure that users are notified on their primary and alternate emails on password resets."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_10.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.10"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_11" {
  title         = "5.11 Ensure that 'Notify all admins when other admins reset their password?' is set to 'Yes'"
  description   = "Ensure that all Global Administrators are notified if any other administrator resets their password."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_11.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.11"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_12" {
  title         = "5.12 Ensure that 'User consent for applications' is set to 'Do not allow user consent'"
  description   = "Require administrators to provide consent for applications before use."
  query         = query.ad_authorization_policy_user_consent_disallowed
  documentation = file("./cis_v500/docs/cis_v500_5_12.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.12"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_13" {
  title         = "5.13 Ensure that 'User consent for applications' is set to 'Allow user consent for apps from verified publishers, for selected permissions'"
  description   = "Allow users to provide consent for selected permissions when a request is coming from a verified publisher."
  query         = query.ad_authorization_policy_user_consent_verified_publishers_selected_permissions
  documentation = file("./cis_v500/docs/cis_v500_5_13.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.13"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_14" {
  title         = "5.14 Ensure that 'Users can register applications' is set to 'No'"
  description   = "Require administrators or appropriately delegated users to register third-party applications."
  query         = query.iam_user_not_allowed_to_register_application
  documentation = file("./cis_v500/docs/cis_v500_5_14.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.14"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_15" {
  title         = "5.15 Ensure that 'Guest users access restrictions' is set to 'Guest user access is restricted to properties and memberships of their own directory objects'"
  description   = "Limit guest user permissions."
  query         = query.ad_authorization_policy_guest_user_access_restricted
  documentation = file("./cis_v500/docs/cis_v500_5_15.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.15"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_16" {
  title         = "5.16 Ensure that 'Guest invite restrictions' is set to 'Only users assigned to specific admin roles [...]' or 'No one [..]'"
  description   = "Restrict invitations to either users with specific administrative roles or no one."
  query         = query.ad_authorization_policy_guest_invite_restricted
  documentation = file("./cis_v500/docs/cis_v500_5_16.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.16"
    cis_level   = "2"
    cis_type    = "automated"
  })
}

control "cis_v500_5_17" {
  title         = "5.17 Ensure that 'Restrict access to Microsoft Entra admin center' is set to 'Yes'"
  description   = "Restrict access to the Microsoft Entra ID administration center to administrators only."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_17.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.17"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_18" {
  title         = "5.18 Ensure that 'Restrict user ability to access groups features in My Groups' is set to 'Yes'"
  description   = "Restrict access to group web interface in the Access Panel portal."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_18.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.18"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_19" {
  title         = "5.19 Ensure that 'Users can create security groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict security group creation to administrators only."
  query         = query.iam_user_not_allowed_to_create_security_group
  documentation = file("./cis_v500/docs/cis_v500_5_19.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.19"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_20" {
  title         = "5.20 Ensure that 'Owners can manage group membership requests in My Groups' is set to 'No'"
  description   = "Restrict security group management to administrators only."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_20.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.20"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_21" {
  title         = "5.21 Ensure that 'Users can create Microsoft 365 groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  query         = query.ad_m365_group_creation_disabled
  documentation = file("./cis_v500/docs/cis_v500_5_21.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.21"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_22" {
  title         = "5.22 Ensure that 'Require Multifactor Authentication to register or join devices with Microsoft Entra' is set to 'Yes'"
  description   = "This recommendation is only relevant if your subscription is using Per-User MFA. If your organization is licensed to use Conditional Access, the preferred method of requiring MFA to join devices to Entra ID is to use a Conditional Access policy (see additional information below for link)."
  query         = query.ad_require_mfa_for_device_join
  documentation = file("./cis_v500/docs/cis_v500_5_22.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.22"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_23" {
  title         = "5.23 Ensure that no custom subscription administrator roles exist"
  description   = "The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  query         = query.iam_no_custom_subscription_owner_roles_created
  documentation = file("./cis_v500/docs/cis_v500_5_23.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.23"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_24" {
  title         = "5.24 Ensure that a custom role is assigned permissions for administering resource locks"
  description   = "Resource locking is a powerful protection mechanism that can prevent inadvertent modification or deletion of resources within Azure subscriptions and resource groups, and it is a recommended NIST configuration."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_24.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.24"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_25" {
  title         = "5.25 Ensure that 'Subscription leaving Microsoft Entra tenant' and 'Subscription entering Microsoft Entra tenant' is set to 'Permit no one'"
  description   = "Users who are set as subscription owners are able to make administrative changes to the subscriptions and move them into and out of Microsoft Entra ID."
  query         = query.iam_subscription_tenant_transfer_restricted
  documentation = file("./cis_v500/docs/cis_v500_5_25.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.25"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v500_5_26" {
  title         = "5.26 Ensure fewer than 5 users have global administrator assignment"
  description   = "This recommendation aims to maintain a balance between security and operational efficiency by ensuring that a minimum of 2 and a maximum of 4 users are assigned the Global Administrator role in Microsoft Entra ID. Having at least two Global Administrators ensures redundancy, while limiting the number to four reduces the risk of excessive privileged access."
  query         = query.iam_global_administrator_max_5
  documentation = file("./cis_v500/docs/cis_v500_5_26.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.26"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v500_5_27" {
  title         = "5.27 Ensure there are between 2 and 3 subscription owners"
  description   = "The Owner role in Azure grants full control over all resources in a subscription, including the ability to assign roles to others."
  query         = query.iam_subscription_owner_between_2_and_3
  documentation = file("./cis_v500/docs/cis_v500_5_27.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.27"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v500_5_28" {
  title         = "5.28 Ensure passwordless authentication methods are considered"
  description   = "Passwordless authentication methods improve security and user experience by replacing passwords with something you have (e.g., a hardware key), something you are (biometrics), or something you know, offering a convenient and secure way to access resources."
  query         = query.manual_control
  documentation = file("./cis_v500/docs/cis_v500_5_28.md")

  tags = merge(local.cis_v500_5_common_tags, {
    cis_item_id = "5.28"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

