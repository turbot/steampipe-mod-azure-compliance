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
  description   = "Security defaults in Azure Active Directory (Azure AD) make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks."
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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_2_6" {
  title         = "1.2.6 Ensure Multi-factor Authentication is Required for Azure Management"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

  tags = merge(local.cis_v150_1_2_common_tags, {
    cis_item_id = "1.2.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_3" {
  title         = "1.3 Ensure Access Review is Set Up for External Users in Azure AD Privileged Identity Management"
  description   = "This recommendation extends guest access review by utilizing the Azure AD Privileged Identity Management feature provided in Azure AD Premium P2."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_4" {
  title         = "1.4 Ensure Guest Users Are Reviewed on a Regular Basis"
  description   = "Azure AD is extended to include Azure AD B2B collaboration, allowing you to invite people from outside your organization to be guest users in your cloud account and sign in with their own work, school, or social identities. Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data."
  sql           = query.ad_guest_user_reviewed_monthly.sql
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v150_1_7" {
  title         = "1.7 Ensure that a Custom Bad Password List is set to 'Enforce' for your Organization"
  description   = "Microsoft Azure creates a default bad password policy that is already applied to Azure administrative and normal user accounts. This is not applied to user accounts that are synced from an on-premise Active Directory unless Azure AD Connect is used and you enable EnforceCloudPasswordPolicyForPasswordSyncedUsers."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

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
  documentation = file("./cis_v140/docs/cis_v140_3_1.md")

  tags = merge(local.cis_v150_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}