locals {
  conformance_pack_iam_common_tags = {
    service = "iam"
  }
}

control "iam_subscription_owner_more_than_1" {
  title       = "There should be more than one owner assigned to your subscription"
  description = "It is recommended to designate more than one subscription owner in order to have administrator access redundancy."
  sql         = query.iam_subscription_owner_more_than_1.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "iam_subscription_owner_max_3" {
  title       = "A maximum of 3 owners should be designated for your subscription"
  description = "It is recommended to designate up to 3 subscription owners in order to reduce the potential for breach by a compromised owner."
  sql         = query.iam_subscription_owner_max_3.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "iam_no_custom_subscription_owner_roles_created" {
  title       = "Custom subscription owner roles should not exist"
  description = "This policy ensures that no custom subscription owner roles exist."
  sql         = query.iam_no_custom_subscription_owner_roles_created.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "iam_deprecated_account_with_owner_roles" {
  title       = "Deprecated accounts with owner permissions should be removed from your subscription"
  description = "Deprecated accounts with owner permissions should be removed from your subscription. Deprecated accounts are accounts that have been blocked from signing in."
  sql         = query.iam_deprecated_account_with_owner_roles.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "iam_no_custom_role" {
  title       = "Audit usage of custom RBAC rules"
  description = "Audit built-in roles such as 'Owner, Contributer, Reader' instead of custom RBAC roles, which are error prone. Using custom roles is treated as an exception and requires a rigorous review and threat modeling."
  sql         = query.iam_no_custom_role.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "iam_external_user_with_owner_role" {
  title       = "External accounts with owner permissions should be removed from your subscription"
  description = "External accounts with owner permissions should be removed from your subscription in order to prevent unmonitored access."
  sql         = query.iam_external_user_with_owner_role.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}
