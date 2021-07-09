benchmark "hipaa_hitrust_v92_segregation_of_duties" {
  title         = "Segregation of Duties"
  children = [
    benchmark.hipaa_hitrust_v92_1229_09c1organizational_1_09_c,
    benchmark.hipaa_hitrust_v92_1232_09c3organizational_12_09_c,
    benchmark.hipaa_hitrust_v92_1276_09c2organizational_2_09_c,
    benchmark.hipaa_hitrust_v92_1278_09c2organizational_56_09_c
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1229_09c1organizational_1_09_c" {
  title         = "1229.09c1Organizational.1 - 09.c"
  description   = "Separation of duties is used to limit the risk of unauthorized or unintentional modification of information and systems."
  children = [
    control.hipaa_hitrust_v92_1229_09c1organizational_1_09_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1229_09c1organizational_1_09_c_1" {
  title         = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  description   = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
  sql           = query.kubernetes_instance_rbac_enabled.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1232_09c3organizational_12_09_c" {
  title         = "1232.09c3Organizational.12 - 09.c"
  description   = "Access for individuals responsible for administering  access controls is limited to the minimum necessary based upon each user's role and responsibilities and these individuals cannot access audit functions related to these controls."
  children = [
    control.hipaa_hitrust_v92_1232_09c3organizational_12_09_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1232_09c3organizational_12_09_c_1" {
  title         = "Windows machines should meet requirements for 'User Rights Assignment'"
  description   = "Windows machines should have the specified Group Policy settings in the category 'User Rights Assignment' for allowing log on locally, RDP, access from the network, and many other user activities. This policy requires that the Guest Configuration prerequisites have been deployed to the policy assignment scope."
  sql           = query.network_security_group_rdp_access_restricted.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}


benchmark "hipaa_hitrust_v92_1276_09c2organizational_2_09_c" {
  title         = "1276.09c2Organizational.2 - 09.c"
  description   = "Security audit activities are independent."
  children = [
    control.hipaa_hitrust_v92_1276_09c2organizational_2_09_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1276_09c2organizational_2_09_c_1" {
  title         = "Custom subscription owner roles should not exist"
  description   = "This policy ensures that no custom subscription owner roles exist."
  sql           = query.iam_no_custom_subscription_owner_roles_created.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1278_09c2organizational_56_09_c" {
  title         = "1278.09c2Organizational.56 - 09.c"
  description   = "The organization identifies duties that require separation and defines information system access authorizations to support separation of duties; and incompatible duties are segregated across multiple users to minimize the opportunity for misuse or fraud."
  children = [
    control.hipaa_hitrust_v92_1278_09c2organizational_56_09_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1278_09c2organizational_56_09_c_1" {
  title         = "Custom subscription owner roles should not exist"
  description   = "This policy ensures that no custom subscription owner roles exist."
  sql           = query.iam_no_custom_subscription_owner_roles_created.sql

  tags          = local.hipaa_hitrust_v92_common_tags
}
