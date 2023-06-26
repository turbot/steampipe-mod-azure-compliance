benchmark "hipaa_hitrust_v92_user_authentication_for_external_connections" {
  title       = "User Authentication for External Connections"
  description = "When accessing electronic protected health information (ePHI) from external sources, it's crucial to prioritize user authentication as part of our commitment to HIPAA and HITRUST compliance. To ensure secure access, we have implemented strong authentication measures, including unique user IDs, strong passwords, and multi-factor authentication. These measures verify the identity of individuals accessing ePHI remotely, ensuring that only authorized users with the right credentials can establish secure connections. By prioritizing user authentication, we protect the confidentiality of sensitive health information and minimize the risk of unauthorized access."
  children = [
    benchmark.hipaa_hitrust_v92_1117_01j1organizational,
    benchmark.hipaa_hitrust_v92_1173_01j1organizational,
    benchmark.hipaa_hitrust_v92_1174_01j1organizational,
    benchmark.hipaa_hitrust_v92_1176_01j2organizational,
    benchmark.hipaa_hitrust_v92_1177_01j2organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1117_01j1organizational" {
  title = "Remote access by vendors and business partners (e.g., for remote maintenance) is disabled/deactivated when not in use"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1173_01j1organizational" {
  title = "If encryption is not used for dial-up connections, the CIO or his/her designated representative provides specific written authorization"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1174_01j1organizational" {
  title = "The organization protects wireless access to systems containing sensitive information by authenticating both users and devices"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1176_01j2organizational" {
  title = "The organization requires a callback capability with re-authentication to verify dial-up connections from authorized locations"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1177_01j2organizational" {
  title = "User IDs assigned to vendors are reviewed in accordance with the organization's access review policy, at a minimum annually"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}