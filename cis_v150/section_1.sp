locals {
  cis_v150_1_common_tags = merge(local.cis_v150_common_tags, {
    cis_section_id = "1"
  })
}

locals {
  cis_v150_1_1_common_tags = merge(local.cis_v150_1_common_tags, {
    cis_section_id = "1.1"
  })
  cis_v150_1_2_common_tags = merge(local.cis_v150_1_common_tags, {
    cis_section_id = "1.2"
  })
}

benchmark "cis_v150_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v150/docs/cis_v150_1.md")
  children = [
    benchmark.cis_v150_1_1,
    benchmark.cis_v150_1_2,
    control.cis_v150_1_3
  ]

  tags = merge(local.cis_v150_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v150_1_1" {
  title         = "1.1 Security Defaults"
  documentation = file("./cis_v150/docs/cis_v150_1_1.md")
  children = [
    control.cis_v150_1_1_1,
    control.cis_v150_1_1_2,
    control.cis_v150_1_1_3,
    control.cis_v150_1_1_4
  ]

  tags = merge(local.cis_v150_1_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_1_1" {
  title         = "1.1.1 Ensure Security Defaults is enabled on Azure Active Directory"
  description   = "Security defaults in Azure Active Directory (Azure AD) make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks. Microsoft is making security defaults available to everyone. The goal is to ensure that all organizations have a basic level of security enabled at no extra cost. You may turn on security defaults in the Azure portal."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_1_1.md")

  tags = merge(local.cis_v150_1_1_common_tags, {
    cis_item_id = "1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_1_2" {
  title         = "1.1.2 Ensure that 'Multi-Factor Auth Status' is 'Enabled' for all Privileged Users"
  description   = "Enable multi-factor authentication for all roles, groups, and users that have write access or permissions to Azure resources."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_1_2.md")

  tags = merge(local.cis_v150_1_1_common_tags, {
    cis_item_id = "1.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_1_3" {
  title         = "1.1.3 Ensure that 'Multi-Factor Auth Status' is 'Enabled' for all Non-Privileged Users"
  description   = "Enable multi-factor authentication for all non-privileged users."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_1_3.md")

  tags = merge(local.cis_v150_1_1_common_tags, {
    cis_item_id = "1.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_1_4" {
  title         = "1.1.4 Ensure that 'Restore multi-factor authentication on all remembered devices' is Enabled"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_1_4.md")

  tags = merge(local.cis_v150_1_1_common_tags, {
    cis_item_id = "1.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

benchmark "cis_v150_1_2" {
  title         = "1.2 Conditional Access"
  documentation = file("./cis_v150/docs/cis_v150_1_2.md")
  children = [
    control.cis_v150_1_2_1,
    control.cis_v150_1_2_2,
    control.cis_v150_1_2_3,
    control.cis_v150_1_2_4,
    control.cis_v150_1_2_5,
    control.cis_v150_1_2_6
  ]

  tags = merge(local.cis_v150_1_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_1" {
  title         = "1.2.1 Ensure Trusted Locations Are Defined"
  description   = "Azure Active Directory Conditional Access allows an organization to configure Named locations and configure whether those locations are trusted or untrusted. These settings provide organizations the means to specify Geographical locations for use in conditional access policies, or define actual IP addresses and IP ranges and whether or not those IP addresses and/or ranges are trusted by the organization."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_1.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_2" {
  title         = "1.2.2 Ensure that an exclusionary Geographic Access Policy is considered"
  description   = "Conditional Access Policies can be used to block access from geographic locations that are deemed out-of-scope for your organization or application. The scope and variables for this policy should be carefully examined and defined."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_2.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_3" {
  title         = "1.2.3 Ensure that A Multi-factor Authentication Policy Exists for Administrative Groups"
  description   = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on login."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_3.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_4" {
  title         = "1.2.4 Ensure that A Multi-factor Authentication Policy Exists for All Users"
  description   = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on logins."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_4.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_5" {
  title         = "1.2.5 Ensure Multi-factor Authentication is Required for Risky Sign-ins"
  description   = "For designated users, they will be prompted to use their multi-factor authentication (MFA) process on login."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_5.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_6" {
  title         = "1.2.6 Ensure Multi-factor Authentication is Required for Azure Management"
  description   = "For designated users, they will be prompted to use their multi-factor authentication(MFA) process on logins."
  sql           = query.iam_conditional_access_mfa_enabled.sql
  documentation = file("./cis_v150/docs/cis_v150_1_2_6.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_3" {
  title         = "1.3 Ensure Access Review is Set Up for External Users in Azure AD Privileged Identity Management"
  description   = "This recommendation extends guest access review by utilizing the Azure AD Privileged Identity Management feature provided in Azure AD Premium P2. Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data. Work with external partners, large or small, even if they don't have Azure AD or an IT department. A simple invitation and redemption process lets partners use their own credentials to access your company's resources a a guest user."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_3.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_4" {
  title         = "1.4 Ensure Guest Users Are Reviewed on a Regular Basis"
  description   = "Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data. Work with external partners, large or small, even if they don't have Azure AD or an IT department. A simple invitation and redemption process lets partners use their own credentials to access your company's resources as a guest user. Guest users in every subscription should be review on a regular basis to ensure that inactive and unneeded accounts are removed."
  sql           = query.ad_guest_user_reviewed_monthly.sql
  documentation = file("./cis_v150/docs/cis_v150_1_4.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_5" {
  title         = "1.5 Ensure that 'Allow users to remember multi-factor authentication on devices they trust' is 'Disabled'"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_5.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_6" {
  title         = "1.6 Ensure That 'Number of methods required to reset' is set to '2'"
  description   = "Ensures that two alternate forms of identification are provided before allowing a password reset."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_6.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_7" {
  title         = "1.7 Ensure that a Custom Bad Password List is set to 'Enforce' for your Organization"
  description   = "Microsoft Azure creates a default bad password policy that is already applied to Azure administrative and normal user accounts. This is not applied to user accounts that are synced from an on-premise Active Directory unless Azure AD Connect is used and you enable EnforceCloudPasswordPolicyForPasswordSyncedUsers. Please see the list in default values on the specifics of this policy."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_7.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_8" {
  title         = "1.8 Ensure that 'Number of days before users are asked to reconfirm their authentication information' is not set to '0'"
  description   = "Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_8.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_9" {
  title         = "1.9 Ensure that 'Notify users on password resets?' is set to 'Yes'"
  description   = "Ensure that users are notified on their primary and secondary emails on password resets."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_9.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_10" {
  title         = "1.10 Ensure That 'Notify all admins when other admins reset their password?' is set to 'Yes'"
  description   = "Ensure that all administrators are notified if any other administrator resets their password."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_10.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_11" {
  title         = "1.11 Ensure That ‘Users Can Consent to Apps Accessing Company Data on Their Behalf’ Is Set To ‘Allow for Verified Publishers’"
  description   = "Allow users to provide consent for selected permissions when a request is coming from a verified publisher."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_11.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_12" {
  title         = "1.12 Ensure that 'Users can consent to apps accessing company data on their behalf' is set to 'No'"
  description   = "Require administrators to provide consent for the apps before use."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_12.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_13" {
  title         = "1.13 Ensure that 'Users can add gallery apps to My Apps' is set to 'No'"
  description   = "Require administrators to provide consent for the apps before use."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_13.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.13"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_14" {
  title         = "1.14 Ensure That ‘Users Can Register Applications’ Is Set to ‘No’ "
  description   = "Require administrators or appropriately delegated users to register third-party applications."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_14.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_15" {
  title         = "1.15 Ensure That 'Guest users access restrictions' is set to 'Guest user access is restricted to properties and memberships of their own directory objects'"
  description   = "Limit guest user permissions.."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_15.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_16" {
  title         = "1.16 Ensure that 'Guest invite restrictions' is set to 'Only users assigned to specific admin roles can invite guest users'"
  description   = "Restrict invitations to users with specific administrative roles only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_16.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_17" {
  title         = "1.17 Ensure That 'Restrict access to Azure AD administration portal' is Set to 'Yes'"
  description   = "Restrict access to the Azure AD administration portal to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_17.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_18" {
  title         = "1.18 Ensure that 'Restrict user ability to access groups features in the Access Pane' is Set to 'Yes' "
  description   = "Restricts group creation to administrators with permissions only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_18.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.18"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_19" {
  title         = "1.19 Ensure that 'Users can create security groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict security group creation to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_19.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.19"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_20" {
  title         = "1.20 Ensure that 'Owners can manage group membership requests in the Access Panel' is set to 'No'"
  description   = "Restrict security group management to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_20.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.20"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_21" {
  title         = "1.21 Ensure that 'Users can create Microsoft 365 groups in Azure portals, API or PowerShell' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_21.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.21"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_22" {
  title         = "1.22 Ensure that 'Require Multi-Factor Authentication to register or join devices with Azure AD' is set to 'Yes'"
  description   = "Joining or registering devices to the active directory should require Multi-factor authentication."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_22.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.22"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_23" {
  title         = "1.23 Ensure That No Custom Subscription Owner Roles Are Created"
  description   = "Subscription ownership should not include permission to create custom owner roles. The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  sql           = query.iam_no_custom_subscription_owner_roles_created.sql
  documentation = file("./cis_v150/docs/cis_v150_1_23.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.23"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_24" {
  title         = "1.24 Ensure a Custom Role is Assigned Permissions for Administering Resource Locks"
  description   = "Resource locking is a powerful protection mechanism that can prevent inadvertent modification/deletion of resources within Azure subscriptions/Resource Groups and is a recommended NIST configuration."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_24.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.24"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_25" {
  title         = "1.25 Ensure That ‘Subscription Entering AAD Directory’ and ‘Subscription Leaving AAD Directory’ Is Set To ‘Permit No One’"
  description   = "Users who are set as subscription owners are able to make administrative changes to the subscriptions and move them into and out of Azure Active Directories."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v150/docs/cis_v150_1_25.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.25"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}