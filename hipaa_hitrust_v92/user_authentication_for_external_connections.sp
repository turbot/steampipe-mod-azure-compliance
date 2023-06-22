benchmark "hipaa_hitrust_v92_user_authentication_for_external_connections" {
  title       = "User Authentication for External Connections"
  description = "TO DO"
  children = [
    benchmark.hipaa_hitrust_v92_1117_01j1organizational_23_01_j,
    benchmark.hipaa_hitrust_v92_1173_01j1organizational_6_01_j,
    benchmark.hipaa_hitrust_v92_1174_01j1organizational_7_01_j,
    benchmark.hipaa_hitrust_v92_1176_01j2organizational_5_01_j,
    benchmark.hipaa_hitrust_v92_1177_01j2organizational_6_01_j
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1117_01j1organizational_23_01_j" {
  title       = "Remote access by vendors and business partners (e.g., for remote maintenance) is disabled/deactivated when not in use"
  description = "TO DO"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1173_01j1organizational_6_01_j" {
  title       = "If encryption is not used for dial-up connections, the CIO or his/her designated representative provides specific written authorization"
  description = "TO DO"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1174_01j1organizational_7_01_j" {
  title = "The organization protects wireless access to systems containing sensitive information by authenticating both users and devices"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1176_01j2organizational_5_01_j" {
  title       = "The organization requires a callback capability with re-authentication to verify dial-up connections from authorized locations"
  description = "TO DO"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1177_01j2organizational_6_01_j" {
  title       = "User IDs assigned to vendors are reviewed in accordance with the organization's access review policy, at a minimum annually"
  description = "TO DO"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}