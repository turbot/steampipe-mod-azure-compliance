locals {
  cis_v130_1_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v130_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v130/docs/cis_v130_1.md")
  children = [
    control.cis_v130_1_1,
    control.cis_v130_1_2,
    control.cis_v130_1_3,
    control.cis_v130_1_4,
    control.cis_v130_1_5,
    control.cis_v130_1_6,
    control.cis_v130_1_7,
    control.cis_v130_1_8,
    control.cis_v130_1_9,
    control.cis_v130_1_10,
    control.cis_v130_1_11,
    control.cis_v130_1_12,
    control.cis_v130_1_13,
    control.cis_v130_1_14,
    control.cis_v130_1_15,
    control.cis_v130_1_16,
    control.cis_v130_1_17,
    control.cis_v130_1_18,
    control.cis_v130_1_19,
    control.cis_v130_1_20,
    control.cis_v130_1_21,
    control.cis_v130_1_22,
    control.cis_v130_1_23
  ]

  tags = merge(local.cis_v130_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_1" {
  title         = "1.1 Ensure that multi-factor authentication is enabled for all privileged users"
  description   = "Enable multi-factor authentication for all user credentials who have write access to Azure resources. These include roles like 'Service Co-Administrators',  'Subscription Owners', 'Contributors'."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_1.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_2" {
  title         = "1.2 Ensure that multi-factor authentication is enabled for all non- privileged users"
  description   = "Enable multi-factor authentication for all non-privileged users."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_2.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_3" {
  title         = "1.3 Ensure guest users are reviewed on a monthly basis"
  description   = "Guest users allow you to share your company's applications and services with users from any other organization, while maintaining control over your own corporate data. Guest users should be review on a monthly basis to ensure that inactive and unneeded accounts are removed."
  sql           = query.ad_guest_user_reviewed_monthly.sql
  documentation = file("./cis_v130/docs/cis_v130_1_3.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_4" {
  title         = "1.4 Ensure that 'Allow users to remember multi-factor authentication on devices they trust' is 'Disabled'"
  description   = "Do not allow users to remember multi-factor authentication on devices."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_4.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_5" {
  title         = "1.5 Ensure that 'Number of methods required to reset' is set to '2'"
  description   = "Ensure that two alternate forms of identification are provided before allowing a password reset."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_5.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_6" {
  title         = "1.6 Ensure that 'Number of days before users are asked to re-confirm their authentication information' is not set to \"0\""
  description   = "Ensure that the number of days before users are asked to re-confirm their authentication information is not set to 0."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_6.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_7" {
  title         = "1.7 Ensure that 'Notify users on password resets?' is set to 'Yes'"
  description   = "Ensure that users are notified on their primary and secondary emails on password resets."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_7.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectoryM"
  })
}

control "cis_v130_1_8" {
  title         = "1.8 Ensure that 'Notify all admins when other admins reset their password?' is set to 'Yes'"
  description   = "Ensure that all administrators are notified if any other administrator resets their password."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_8.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_9" {
  title         = "1.9 Ensure that 'Users can consent to apps accessing company data on their behalf' is set to 'No'"
  description   = "Require administrators to provide consent for the apps before use."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_9.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_10" {
  title         = "1.10 Ensure that 'Users can add gallery apps to their Access Panel' is set to 'No'"
  description   = "Require administrators to provide consent for the apps before use."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_10.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_11" {
  title         = "1.11 Ensure that 'Users can register applications' is set to 'No'"
  description   = "Require administrators to register third-party applications."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_11.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_12" {
  title         = "1.12 Ensure that 'Guest user permissions are limited' is set to 'Yes'"
  description   = "Limit guest user permissions."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_12.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_13" {
  title         = "1.13 Ensure that 'Members can invite' is set to 'No'"
  description   = "Restrict invitations to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_13.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.13"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_14" {
  title         = "1.14 Ensure that 'Guests can invite' is set to 'No'"
  description   = "Restrict guest being able to invite other guests to collaborate with your organization."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_14.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_15" {
  title         = "1.15 Ensure that 'Restrict access to Azure AD administration portal' is set to 'Yes'"
  description   = "Restrict access to the Azure AD administration portal to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_15.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_16" {
  title         = "1.16 Ensure that 'Restrict user ability to access groups features in the Access Pane' is set to 'No'"
  description   = "Restrict group creation to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_16.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_17" {
  title         = "1.17 Ensure that 'Users can create security groups in Azure Portals' is set to 'No'"
  description   = "Restrict security group creation to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_17.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_18" {
  title         = "1.18 Ensure that 'Owners can manage group membership requests in the Access Panel' is set to 'No'"
  description   = "Restrict security group management to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_18.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.18"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_19" {
  title         = "1.19 Ensure that 'Users can create Microsoft 365 groups in Azure Portals' is set to 'No'"
  description   = "Restrict Microsoft 365 group creation to administrators only."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_19.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.19"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_20" {
  title         = "1.20 Ensure that 'Require Multi-Factor Auth to join devices' is set to 'Yes'"
  description   = "Joining devices to the active directory should require Multi-factor authentication."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_20.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.20"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_21" {
  title         = "1.21 Ensure that no custom subscription owner roles are created"
  description   = "Subscription ownership should not include permission to create custom owner roles. The principle of least privilege should be followed and only necessary privileges should be assigned instead of allowing full administrative access."
  sql           = query.iam_no_custom_subscription_owner_roles_created.sql
  documentation = file("./cis_v130/docs/cis_v130_1_21.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.21"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_22" {
  title         = "1.22 Ensure Security Defaults is enabled on Azure Active Directory"
  description   = "Security defaults in Azure Active Directory (Azure AD) make it easier to be secure and help protect your organization. Security defaults contain preconfigured security settings for common attacks."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_22.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.22"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/ActiveDirectory"
  })
}

control "cis_v130_1_23" {
  title         = "1.23 Ensure Custom Role is assigned for Administering Resource Locks"
  description   = "Resource locking is a powerful protection mechanism that can prevent inadvertent modification/deletion of resources within Azure subscriptions/Resource Groups and is a recommended NIST configuration."
  sql           = query.ad_manual_control.sql
  documentation = file("./cis_v130/docs/cis_v130_1_23.md")

  tags = merge(local.cis_v130_1_common_tags, {
    cis_item_id = "1.23"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/ActiveDirectory"
  })
}
