locals {
  cis_v400_6_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "6"
  })
}

locals {
  cis_v400_6_1_common_tags = merge(local.cis_v400_6_common_tags, {
    cis_section_id = "6.1"
  })
  cis_v400_6_2_common_tags = merge(local.cis_v400_6_common_tags, {
    cis_section_id = "6.2"
  })
  cis_v400_6_3_common_tags = merge(local.cis_v400_6_common_tags, {
    cis_section_id = "6.3"
  })
}

benchmark "cis_v400_6" {
  title         = "6 Identity Services"
  documentation = file("./cis_v400/docs/cis_v400_6.md")
  children = [
    benchmark.cis_v400_6_1,
    benchmark.cis_v400_6_2,
    benchmark.cis_v400_6_3,
    control.cis_v400_6_4,
    control.cis_v400_6_5,
    control.cis_v400_6_6,
    control.cis_v400_6_7,
    control.cis_v400_6_8,
    control.cis_v400_6_9,
    control.cis_v400_6_10,
    control.cis_v400_6_11,
    control.cis_v400_6_12,
    control.cis_v400_6_13,
    control.cis_v400_6_14,
    control.cis_v400_6_15,
    control.cis_v400_6_16,
    control.cis_v400_6_17,
    control.cis_v400_6_18,
    control.cis_v400_6_19,
    control.cis_v400_6_20,
    control.cis_v400_6_21,
    control.cis_v400_6_22,
    control.cis_v400_6_23,
    control.cis_v400_6_24,
    control.cis_v400_6_25,
    control.cis_v400_6_26
  ]

  tags = merge(local.cis_v400_6_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v400_6_1" {
  title         = "6.1 Security Defaults (Per-User MFA)"
  documentation = file("./cis_v400/docs/cis_v400_6_1.md")
  children = [
    control.cis_v400_6_1_1,
    control.cis_v400_6_1_2,
    control.cis_v400_6_1_3
  ]

  tags = merge(local.cis_v400_6_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/SecurityCenter"
  })
}

control "cis_v400_6_1_1" {
  title         = "6.1.1 Ensure that 'security defaults' is enabled in Microsoft Entra ID"
  description   = "Security defaults in Microsoft Entra ID make it easier to be secure and help protect your organization."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_1_1.md")

  tags = merge(local.cis_v400_6_1_common_tags, {
    cis_item_id = "6.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v400_6_1_2" {
  title         = "6.1.2 Ensure that 'multifactor authentication' is 'enabled' for all users"
  description   = "Enable multifactor authentication for all users."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_1_2.md")

  tags = merge(local.cis_v400_6_1_common_tags, {
    cis_item_id = "6.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

control "cis_v400_6_1_3" {
  title         = "6.1.3 Ensure that 'Allow users to remember multifactor authentication on devices they trust' is disabled"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_1_3.md")

  tags = merge(local.cis_v400_6_1_common_tags, {
    cis_item_id = "6.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/SecurityCenter"
  })
}

benchmark "cis_v400_6_2" {
  title         = "6.2 Conditional Access"
  documentation = file("./cis_v400/docs/cis_v400_6_2.md")
  children = [
    control.cis_v400_6_2_1,
    control.cis_v400_6_2_2,
    control.cis_v400_6_2_3,
    control.cis_v400_6_2_4,
    control.cis_v400_6_2_5,
    control.cis_v400_6_2_6,
    control.cis_v400_6_2_7
  ]

  tags = merge(local.cis_v400_6_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_1" {
  title         = "6.2.1 Ensure that 'trusted locations' are defined"
  description   = "Microsoft Entra ID Conditional Access allows an organization to configure `Named locations` and configure whether those locations are trusted or untrusted."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_2_1.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_2" {
  title         = "6.2.2 Ensure that an exclusionary geographic Conditional Access policy is considered"
  description   = "Conditional Access Policies can be used to block access from geographic locations that are deemed out-of-scope for your organization or application."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_2_2.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_3" {
  title         = "6.2.3 Ensure that an exclusionary device code flow policy is considered"
  description   = "Conditional Access Policies can be used to prevent the Device code authentication flow."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_2_3.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_4" {
  title         = "6.2.4 Ensure that a multifactor authentication policy exists for all users"
  description   = "A Conditional Access policy can be enabled to ensure that users are required to use Multifactor Authentication (MFA) to login."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_2_4.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.4"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_5" {
  title         = "6.2.5 Ensure that multifactor authentication is required for risky sign-ins"
  description   = "Entra ID tracks the behavior of sign-in events."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_2_5.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_6" {
  title         = "6.2.6 Ensure that multifactor authentication is required for Windows Azure Service Management API"
  description   = "This recommendation ensures that users accessing the Windows Azure Service Management API (i.e. Azure Powershell, Azure CLI, Azure Resource Manager API, etc.) are required to use multifactor authentication (MFA) credentials when accessing resources through the Windows Azure Service Management API."
  query         = query.iam_conditional_access_mfa_enabled
  documentation = file("./cis_v400/docs/cis_v400_6_2_6.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_2_7" {
  title         = "6.2.7 Ensure that multifactor authentication is required to access Microsoft Admin Portals"
  description   = "This recommendation ensures that users accessing Microsoft Admin Portals (i.e. Microsoft 365 Admin, Microsoft 365 Defender, Exchange Admin Center, Azure Portal, etc.) are required to use multifactor authentication (MFA) credentials when logging into an Admin Portal."
  query         = query.iam_conditional_access_mfa_enabled_for_administrators
  documentation = file("./cis_v400/docs/cis_v400_6_2_7.md")

  tags = merge(local.cis_v400_6_2_common_tags, {
    cis_item_id = "6.2.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v400_6_3" {
  title         = "6.3 Periodic Identity Reviews"
  documentation = file("./cis_v400/docs/cis_v400_6_3.md")
  children = [
    control.cis_v400_6_3_1,
    control.cis_v400_6_3_2,
    control.cis_v400_6_3_3,
    control.cis_v400_6_3_4
  ]

  tags = merge(local.cis_v400_6_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_3_1" {
  title         = "6.3.1 Ensure that Azure admin accounts are not used for daily operations"
  description   = "Microsoft Azure admin accounts should not be used for routine, non-administrative tasks."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_3_1.md")

  tags = merge(local.cis_v400_6_3_common_tags, {
    cis_item_id = "6.3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_3_2" {
  title         = "6.3.2 Ensure that guest users are reviewed on a regular basis"
  description   = "Microsoft Entra ID has native and extended identity functionality allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities."
  query         = query.ad_guest_user_reviewed_monthly
  documentation = file("./cis_v400/docs/cis_v400_6_3_2.md")

  tags = merge(local.cis_v400_6_3_common_tags, {
    cis_item_id = "6.3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_3_3" {
  title         = "6.3.3 Ensure that use of the 'User Access Administrator' role is restricted"
  description   = "The User Access Administrator role grants the ability to view all resources and manage access assignments at any subscription or management group level within the tenant."
  query         = query.automated
  documentation = file("./cis_v400/docs/cis_v400_6_3_3.md")

  tags = merge(local.cis_v400_6_3_common_tags, {
    cis_item_id = "6.3.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_3_4" {
  title         = "6.3.4 Ensure that all 'privileged' role assignments are periodically reviewed"
  description   = "Periodic review of privileged role assignments is performed to ensure that the privileged roles assigned to users are accurate and appropriate."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_3_4.md")

  tags = merge(local.cis_v400_6_3_common_tags, {
    cis_item_id = "6.3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_4" {
  title         = "6.4 Ensure that 'Restrict non-admin users from creating tenants' is set to 'Yes'"
  description   = "Require administrators or appropriately delegated users to create new tenants."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_4.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_5" {
  title         = "6.5 Ensure that 'Number of methods required to reset' is set to '2'"
  description   = "Ensures that two alternate forms of identification are provided before allowing a password reset."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_5.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_6" {
  title         = "6.6 Ensure that account 'Lockout threshold' is less than or equal to '10'"
  description   = "The account lockout threshold determines how many failed login attempts are permitted prior to placing the account in a locked-out state and initiating a variable lockout duration."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_6.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_7" {
  title         = "6.7 Ensure that account 'Lockout duration in seconds' is greater than or equal to '60'"
  description   = "The account lockout duration value determines how long an account retains the status of lockout, and therefore how long before a user can continue to attempt to login after passing the lockout threshold."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_7.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_8" {
  title         = "6.8 Ensure that a 'Custom banned password list' is set to 'Enforce'"
  description   = "Microsoft Azure applies a default global banned password list to all user and admin accounts that are created and managed directly in Microsoft Entra ID."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_8.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_9" {
  title         = "6.9 Ensure that 'Number of days before users are asked to re-confirm their authentication information' is not set to '0'"
  description   = "Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_9.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_10" {
  title         = "6.10 Ensure that 'Notify users on password resets?' is set to 'Yes'"
  description   = "Ensure that users are notified on their primary and alternate emails on password resets."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_10.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_11" {
  title         = "6.11 Ensure that 'Notify all admins when other admins reset their password?' is set to 'Yes'"
  description   = "Ensure that all Global Administrators are notified if any other administrator resets their password."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_11.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_12" {
  title         = "6.12 Ensure that 'User consent for applications' is set to 'Do not allow user consent'"
  description   = "Require administrators to provide consent for applications before use."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_12.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_13" {
  title         = "6.13 Ensure that 'User consent for applications' is set to 'Allow user consent for apps from verified publishers, for selected permissions'"
  description   = "Allow users to provide consent for selected permissions when a request is coming from a verified publisher."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_13.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.13"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_14" {
  title         = "6.14 Ensure that 'Users can register applications' is set to 'No'"
  description   = "Require administrators or appropriately delegated users to register third-party applications."
  query         = query.iam_user_not_allowed_to_register_application
  documentation = file("./cis_v400/docs/cis_v400_6_14.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.14"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_15" {
  title         = "6.15 Ensure that 'Guest users access restrictions' is set to 'Guest user access is restricted to properties and memberships of their own directory objects'"
  description   = "Limit guest user permissions."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_15.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.15"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_16" {
  title         = "6.16 Ensure that 'Guest invite restrictions' is set to 'Only users assigned to specific admin roles can invite guest users'"
  description   = "Restrict invitations to users with specific administrative roles only."
  query         = query.ad_manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_16.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.16"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_17" {
  title         = "6.17 Ensure that 'Restrict access to Microsoft Entra admin center' is set to 'Yes'"
  description   = "Restrict access to the Microsoft Entra ID administration center to administrators only."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_17.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.17"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_18" {
  title         = "6.18 Ensure that 'Restrict user ability to access groups features in My Groups' is set to 'Yes'"
  description   = "Restrict access to group web interface in the Access Panel portal."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_18.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.18"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_19" {
  title         = "6.19 Ensure that 'Users can create security groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict security group creation to administrators only."
  query         = query.iam_user_not_allowed_to_create_security_group
  documentation = file("./cis_v400/docs/cis_v400_6_19.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.19"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_20" {
  title         = "6.20 Ensure that 'Owners can manage group membership requests in My Groups' is set to 'No'"
  description   = "Restrict security group management to administrators only."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_20.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.20"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_21" {
  title         = "6.21 Ensure that 'Users can create Microsoft 365 groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_21.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.21"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_22" {
  title         = "6.22 Ensure that 'Require Multifactor Authentication to register or join devices with Microsoft Entra' is set to 'Yes'"
  description   = "Joining or registering devices to Microsoft Entra ID should require multi-factor authentication."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_22.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.22"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_23" {
  title         = "6.23 Ensure that no custom subscription administrator roles exist"
  description   = "The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  query         = query.iam_no_custom_subscription_owner_roles_created
  documentation = file("./cis_v400/docs/cis_v400_6_23.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.23"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_24" {
  title         = "6.24 Ensure that a custom role is assigned permissions for administering resource locks"
  description   = "Resource locking is a powerful protection mechanism that can prevent inadvertent modification or deletion of resources within Azure subscriptions and resource groups, and it is a recommended NIST configuration."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_24.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.24"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_25" {
  title         = "6.25 Ensure that 'Subscription leaving Microsoft Entra tenant' and 'Subscription entering Microsoft Entra tenant' is set to 'Permit no one'"
  description   = "Users who are set as subscription owners are able to make administrative changes to the subscriptions and move them into and out of Microsoft Entra ID."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_6_25.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.25"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v400_6_26" {
  title         = "6.26 Ensure fewer than 5 users have global administrator assignment"
  description   = "This recommendation aims to maintain a balance between security and operational efficiency by ensuring that a minimum of 2 and a maximum of 4 users are assigned the Global Administrator role in Microsoft Entra ID."
  query         = query.iam_global_administrator_max_5
  documentation = file("./cis_v400/docs/cis_v400_6_26.md")

  tags = merge(local.cis_v400_6_common_tags, {
    cis_item_id = "6.26"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}
