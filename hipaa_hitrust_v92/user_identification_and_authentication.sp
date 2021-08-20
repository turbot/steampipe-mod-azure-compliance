benchmark "hipaa_hitrust_v92_user_identification_and_authentication" {
  title         = "User Identification and Authentication"
  children = [
    benchmark.hipaa_hitrust_v92_11112_01q2organizational_67_01_q,
    benchmark.hipaa_hitrust_v92_11208_01q1organizational_8_01_q,
    benchmark.hipaa_hitrust_v92_11211_01q2organizational_11_01_q,
    benchmark.hipaa_hitrust_v92_1123_01q1system_2_01_q,
    benchmark.hipaa_hitrust_v92_1125_01q2system_1_01_q,
    benchmark.hipaa_hitrust_v92_1127_01q2system_3_01_q
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11208_01q1organizational_8_01_q" {
  title         = "11208.01q1Organizational.8 - 01.q"
  description   = "The organization requires that electronic signatures, unique to one individual, cannot be reused by, or reassigned to, anyone else."
  children = [
    control.iam_subscription_owner_more_than_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11112_01q2organizational_67_01_q" {
  title         = "11112.01q2Organizational.67 - 01.q"
  description   = "The information system employs replay-resistant authentication mechanisms such as nonce, one-time passwords, or time stamps to secure network access for privileged accounts; and, for hardware token-based authentication, employs mechanisms that satisfy minimum token requirements discussed in NIST SP 800-63-2, Electronic Authentication Guideline."
  children = [
    control.iam_subscription_owner_max_3,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1127_01q2system_3_01_q" {
  title         = "1127.01q2System.3 - 01.q"
  description   = "Where tokens are provided for multi-factor authentication, in-person verification is required prior to granting access."
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11211_01q2organizational_11_01_q" {
  title         = "11211.01q2Organizational.11 - 01.q"
  description   = "Signed electronic records shall contain information associated with the signing in human-readable format."
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1125_01q2system_1_01_q" {
  title         = "1125.01q2System.1 - 01.q"
  description   = "Multi-factor authentication methods are used in accordance with organizational policy, (e.g., for remote network access)."
  children = [
    control.compute_vm_administrators_group_with_specified_members_windows,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11210_01q2organizational_10_01_q" {
  title         = "11210.01q2Organizational.10 - 01.q"
  description   = "Electronic signatures and handwritten signatures executed to electronic records shall be linked to their respective electronic records."
  children = [
    control.compute_vm_administrators_group_with_specified_members_windows,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1123_01q1system_2_01_q" {
  title         = "1123.01q1System.2 - 01.q"
  description   = "Users who performed privileged functions (e.g., system administration) use separate accounts when performing those privileged functions."
  children = [
    control.compute_vm_administrators_group_with_extra_accounts_windows,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}