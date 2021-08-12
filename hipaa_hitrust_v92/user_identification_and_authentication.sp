benchmark "hipaa_hitrust_v92_user_identification_and_authentication" {
  title         = "User Identification and Authentication"
  children = [
    benchmark.hipaa_hitrust_v92_11112_01q2organizational_67_01_q,
    benchmark.hipaa_hitrust_v92_11208_01q1organizational_8_01_q
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
