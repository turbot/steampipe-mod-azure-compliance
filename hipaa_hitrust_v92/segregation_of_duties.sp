benchmark "hipaa_hitrust_v92_segregation_of_duties" {
  title    = "Segregation of Duties"
  children = [
    benchmark.hipaa_hitrust_v92_1229_09c1organizational_1_09_c,
    benchmark.hipaa_hitrust_v92_1230_09c2organizational_1_09_c,
    benchmark.hipaa_hitrust_v92_1232_09c3organizational_12_09_c,
    benchmark.hipaa_hitrust_v92_1276_09c2organizational_2_09_c,
    benchmark.hipaa_hitrust_v92_1278_09c2organizational_56_09_c
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1229_09c1organizational_1_09_c" {
  title    = "Separation of duties is used to limit the risk of unauthorized or unintentional modification of information and systems"
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1232_09c3organizational_12_09_c" {
  title       = "Access for individuals responsible for administering access controls is limited to the minimum necessary"
  description = "Access for individuals responsible for administering access controls is limited to the minimum necessary based upon each user's role and responsibilities and these individuals cannot access audit functions related to these controls."
  children = [
    control.network_security_group_rdp_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1276_09c2organizational_2_09_c" {
  title    = "Security audit activities are independent"
  children = [
    control.iam_no_custom_subscription_owner_roles_created
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1278_09c2organizational_56_09_c" {
  title       = "The organization identifies duties that require separation and defines information system access authorizations to support separation of duties"
  description = "The organization identifies duties that require separation and defines information system access authorizations to support separation of duties; and incompatible duties are segregated across multiple users to minimize the opportunity for misuse or fraud."
  children = [
    control.iam_no_custom_subscription_owner_roles_created
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1230_09c2organizational_1_09_c" {
  title    = "No single person is able to access, modify, or use information systems without authorization or detection"
  children = [
    control.iam_no_custom_role
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service       = "Azure/ActiveDirectory"
  })
}