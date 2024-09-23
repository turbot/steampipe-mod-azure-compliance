locals {
  cis_v300_2_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v300_2_1_common_tags = merge(local.cis_v300_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v300_2_2_common_tags = merge(local.cis_v300_2_common_tags, {
    cis_section_id = "2.2"
  })
}

benchmark "cis_v300_2" {
  title         = "2 Identity"
  documentation = file("./cis_v300/docs/cis_v300_2.md")
  children = [
    benchmark.cis_v300_2_1,
    benchmark.cis_v300_2_2,
    control.cis_v300_2_3,
    control.cis_v300_2_4,
    control.cis_v300_2_5,
    control.cis_v300_2_6,
    control.cis_v300_2_7,
    control.cis_v300_2_8,
    control.cis_v300_2_9,
    control.cis_v300_2_10,
    control.cis_v300_2_11,
    control.cis_v300_2_12,
    control.cis_v300_2_13,
    control.cis_v300_2_14,
    control.cis_v300_2_15,
    control.cis_v300_2_16,
    control.cis_v300_2_17,
    control.cis_v300_2_18,
    control.cis_v300_2_19,
    control.cis_v300_2_20,
    control.cis_v300_2_21,
    control.cis_v300_2_22,
    control.cis_v300_2_23,
    control.cis_v300_2_24,
    control.cis_v300_2_25,
    control.cis_v300_2_26
  ]

  tags = merge(local.cis_v300_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v300_2_1" {
  title         = "2.1 Security Defaults (Per-User MFA)"
  documentation = file("./cis_v300/docs/cis_v300_2_1.md")
  children = [
    control.cis_v300_2_1_1,
    control.cis_v300_2_1_2,
    control.cis_v300_2_1_3,
    control.cis_v300_2_1_4
  ]

  tags = merge(local.cis_v300_2_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_1_1" {
  title         = "2.1.1 Ensure Security Defaults is enabled on Microsoft Entra ID"
  description   = "Security defaults in Microsoft Entra ID make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks. Security defaults is available to everyone. The goal is to ensure that all organizations have a basic level of security enabled at no extra cost. You may turn on security defaults in the Azure portal."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_1_1.md")

  tags = merge(local.cis_v300_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_1_2" {
  title         = "2.1.2 Ensure that 'Multi-Factor Auth Status' is 'Enabled' for all Privileged Users"
  description   = "Enable multi-factor authentication for all roles, groups, and users that have write access or permissions to Azure resources."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_1_2.md")

  tags = merge(local.cis_v300_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_1_3" {
  title         = "2.1.3 Ensure that 'Multi-Factor Auth Status' is 'Enabled' for all Non-Privileged Users"
  description   = "Enable multi-factor authentication for all non-privileged users."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_1_3.md")

  tags = merge(local.cis_v300_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_1_4" {
  title         = "2.1.4 Ensure that 'Allow users to remember multi-factor authentication on devices they trust' is Disabled"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_1_4.md")

  tags = merge(local.cis_v300_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v300_2_2" {
  title         = "2.2 Conditional Access"
  documentation = file("./cis_v300/docs/cis_v300_2_2.md")
  children = [
    control.cis_v300_2_2_1,
    control.cis_v300_2_2_2,
    control.cis_v300_2_2_3,
    control.cis_v300_2_2_4,
    control.cis_v300_2_2_5,
    control.cis_v300_2_2_6,
    control.cis_v300_2_2_7,
    control.cis_v300_2_2_8
  ]

  tags = merge(local.cis_v300_2_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_1" {
  title         = "2.2.1 Ensure Trusted Locations Are Defined"
  description   = "Microsoft Entra ID Conditional Access allows an organization to configure Named locations and configure whether those locations are trusted or untrusted. These settings provide organizations the means to specify Geographical locations for use in conditional access policies, or define actual IP addresses and IP ranges and whether or not those IP addresses and/or ranges are trusted by the organization."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_1.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_2" {
  title         = "2.2.2 Ensure that an exclusionary Geographic Access Policy is considered"
  description   = "Conditional Access Policies can be used to block access from geographic locations that are deemed out-of-scope for your organization or application. The scope and variables for this policy should be carefully examined and defined."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_2.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_3" {
  title         = "2.2.3 Ensure that an exclusionary Device code flow policy is considered"
  description   = "Conditional Access Policies can be used to prevent the Device code authentication flow. Device code flow should be permitted only for users that regularly perform duties that explicitly require the use of Device Code to authenticate, such as utilizing Azure with PowerShell."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_3.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_4" {
  title         = "2.2.4 Ensure that A Multi-factor Authentication Policy Exists for Administrative Groups"
  description   = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on login."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_4.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_5" {
  title         = "2.2.5 Ensure that A Multi-factor Authentication Policy Exists for All Users"
  description   = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on logins."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_5.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_6" {
  title         = "2.2.6 Ensure Multi-factor Authentication is Required for Risky Sign-ins"
  description   = "Entra ID tracks the behavior of sign-in events. If the Entra ID domain is licensed with P2, the sign-in behavior can be used as a detection mechanism for additional scrutiny during the sign-in event. If this policy is set up, then Risky Sign-in events will prompt users to use multi-factor authentication (MFA) tokens on login for additional verification."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_2_6.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_7" {
  title         = "2.2.7 Ensure Multifactor Authentication is Required for Windows Azure Service Management API"
  description   = "This recommendation ensures that users accessing the Windows Azure Service Management API (i.e. Azure Powershell, Azure CLI, Azure Resource Manager API, etc.) are required to use multifactor authentication (MFA) credentials when accessing resources through the Windows Azure Service Management API."
  query         = query.iam_conditional_access_mfa_enabled
  documentation = file("./cis_v300/docs/cis_v300_2_2_7.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_2_8" {
  title         = "2.2.8 Ensure Multifactor Authentication is Required to access Microsoft Admin Portals"
  description   = "This recommendation ensures that users accessing Microsoft Admin Portals (i.e. Microsoft 365 Admin, Microsoft 365 Defender, Exchange Admin Center, Azure Portal, etc.) are required to use multifactor authentication (MFA) credentials when logging into an Admin Portal."
  query         = query.iam_conditional_access_mfa_enabled_for_administrators
  documentation = file("./cis_v300/docs/cis_v300_2_2_8.md")

  tags = merge(local.cis_v300_2_2_common_tags, {
    cis_item_id = "2.2.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_3" {
  title         = "2.3 Ensure that 'Restrict non-admin users from creating tenants' is set to 'Yes'"
  description   = "Require administrators or appropriately delegated users to create new tenants."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_3.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_4" {
  title         = "2.4 Ensure Guest Users Are Reviewed on a Regular Basis"
  description   = "Microsoft Entra ID has native and extended identity functionality allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities."
  query         = query.ad_guest_user_reviewed_monthly
  documentation = file("./cis_v300/docs/cis_v300_2_4.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_5" {
  title         = "2.5 Ensure That 'Number of methods required to reset' is set to '2'"
  description   = "Ensures that two alternate forms of identification are provided before allowing a password reset."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_5.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_6" {
  title         = "2.6 Ensure that account 'Lockout Threshold' is less than or equal to '10'"
  description   = "The account lockout threshold determines how many failed login attempts are permitted prior to placing the account in a locked-out state and initiating a variable lockout duration."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_6.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_7" {
  title         = "2.7 Ensure that account 'Lockout duration in seconds' is greater than or equal to '60'"
  description   = "The account lockout duration value determines how long an account retains the status of lockout, and therefore how long before a user can continue to attempt to login after passing the lockout threshold."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_7.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_8" {
  title         = "2.8 Ensure that a Custom Bad Password List is set to 'Enforce' for your Organization"
  description   = "Microsoft Azure provides a Global Banned Password policy that applies to Azure administrative and normal user accounts. This is not applied to user accounts that are synced from an on-premise Active Directory unless Azure AD Connect is used and you enable EnforceCloudPasswordPolicyForPasswordSyncedUsers. Please see the list in default values on the specifics of this policy. To further password security, it is recommended to further define a custom banned password policy."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_8.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_9" {
  title         = "2.9 Ensure that 'Number of days before users are asked to re-confirm their authentication information' is not set to '0'"
  description   = "Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_9.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_10" {
  title         = "2.10 Ensure that 'Notify users on password resets?' is set to 'Yes'"
  description   = "Ensure that users are notified on their primary and alternate emails on password resets."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_10.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_11" {
  title         = "2.11 Ensure That 'Notify all admins when other admins reset their password?' is set to 'Yes'"
  description   = "Ensure that all Global Administrators are notified if any other administrator resets their password."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_11.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_12" {
  title         = "2.12 Ensure 'User consent for applications' is set to 'Do not allow user consent'"
  description   = "Require administrators to provide consent for applications before use."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_12.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_13" {
  title         = "2.13 Ensure 'User consent for applications' Is Set To 'Allow for Verified Publishers'"
  description   = "Allow users to provide consent for selected permissions when a request is coming from a verified publisher."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_13.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.13"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_14" {
  title         = "2.14 Ensure That 'Users Can Register Applications' Is Set to 'No'"
  description   = "Require administrators or appropriately delegated users to register third-party applications."
  query         = query.iam_user_not_allowed_to_register_application
  documentation = file("./cis_v300/docs/cis_v300_2_14.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.14"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_15" {
  title         = "2.15 Ensure That 'Guest users access restrictions' is set to 'Guest user access is restricted to properties and memberships of their own directory objects'"
  description   = "Limit guest user permissions."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_15.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.15"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_16" {
  title         = "2.16 Ensure that 'Guest invite restrictions' is set to 'Only users assigned to specific admin roles can invite guest users'"
  description   = "Restrict invitations to users with specific administrative roles only."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_16.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.16"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_17" {
  title         = "2.17 Ensure That 'Restrict access to Microsoft Entra admin center' is Set to 'Yes'"
  description   = "Restrict access to the Azure AD administration portal to administrators only."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_17.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.17"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_18" {
  title         = "2.18 Ensure that 'Restrict user ability to access groups features in the Access Pane' is Set to 'Yes'"
  description   = "Restrict access to group web interface in the Access Panel portal."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_18.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.18"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_19" {
  title         = "2.19 Ensure that 'Users can create security groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict security group creation to administrators only."
  query         = query.iam_user_not_allowed_to_create_security_group
  documentation = file("./cis_v300/docs/cis_v300_2_19.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.19"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_20" {
  title         = "2.20 Ensure that 'Owners can manage group membership requests in the Access Panel' is set to 'No'"
  description   = "Restrict security group management to administrators only."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_20.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.20"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_21" {
  title         = "2.21 Ensure that 'Users can create Microsoft 365 groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_21.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.21"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_22" {
  title         = "2.22 Ensure that 'Require Multi-Factor Authentication to register or join devices with Microsoft Entra ID' is set to 'Yes'"
  description   = "Joining or registering devices to the active directory should require Multi-factor authentication."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_22.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.22"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_23" {
  title         = "2.23 Ensure That No Custom Subscription Administrator Roles Exist"
  description   = "The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  query         = query.iam_no_custom_subscription_owner_roles_created
  documentation = file("./cis_v300/docs/cis_v300_2_23.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.23"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_24" {
  title         = "2.24 Ensure a Custom Role is Assigned Permissions for Administering Resource Locks"
  description   = "Resource locking is a powerful protection mechanism that can prevent inadvertent modification/deletion of resources within Azure subscriptions/Resource Groups and is a recommended NIST configuration."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_24.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.24"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_25" {
  title         = "2.25 Ensure That `Subscription leaving Microsoft Entra ID directory` and `Subscription entering Microsoft Entra ID directory` Is Set To 'Permit No One'"
  description   = "Users who are set as subscription owners are able to make administrative changes to the subscriptions and move them into and out of Azure Active Directories."
  query         = query.ad_manual_control
  documentation = file("./cis_v300/docs/cis_v300_2_25.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.25"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v300_2_26" {
  title         = "2.26 Ensure fewer than 5 users have global administrator assignment"
  description   = "This recommendation aims to maintain a balance between security and operational efficiency by ensuring that a minimum of 2 and a maximum of 4 users are assigned the Global Administrator role in Microsoft Entra ID. Having at least two Global Administrators ensures redundancy, while limiting the number to four reduces the risk of excessive privileged access."
  query         = query.iam_global_administrator_max_5
  documentation = file("./cis_v300/docs/cis_v300_2_26.md")

  tags = merge(local.cis_v300_2_common_tags, {
    cis_item_id = "2.26"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}