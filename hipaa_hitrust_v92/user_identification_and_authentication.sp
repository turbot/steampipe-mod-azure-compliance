benchmark "hipaa_hitrust_v92_user_identification_and_authentication" {
  title = "User Identification and Authentication"
  children = [
    benchmark.hipaa_hitrust_v92_11110_01q1organizational_6_01_q,
    benchmark.hipaa_hitrust_v92_11208_01q1organizational_8_01_q,
    benchmark.hipaa_hitrust_v92_11210_01q2organizational_10_01_q,
    benchmark.hipaa_hitrust_v92_11211_01q2organizational_11_01_q
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11208_01q1organizational_8_01_q" {
  title = "The organization requires that electronic signatures, unique to one individual, cannot be reused by, or reassigned to, anyone else"
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_11211_01q2organizational_11_01_q" {
  title = "Signed electronic records shall contain information associated with the signing in human-readable format"
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_11210_01q2organizational_10_01_q" {
  title = "Electronic signatures and handwritten signatures executed to electronic records shall be linked to their respective electronic records"
  children = [
    control.compute_vm_administrators_group_with_specified_members_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_11110_01q1organizational_6_01_q" {
  title = "Non-organizational users (all information system users other than organizational users, such as patients, customers, contractors, or foreign nationals), or processes acting on behalf of non-organizational users, determined to need access to information residing on the organization's information systems, are uniquely identified and authenticated"
  children = [
    control.iam_user_with_write_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}