benchmark "hipaa_hitrust_v92_privilege_management" {
  title         = "Privilege Management"
  children = [
    benchmark.hipaa_hitrust_v92_1143_01c1system_23_01_c,
    benchmark.hipaa_hitrust_v92_1144_01c1system_4_01_c,
    benchmark.hipaa_hitrust_v92_1145_01c2system_1_01_c,
    benchmark.hipaa_hitrust_v92_1149_01c2system_9_01_c,
    benchmark.hipaa_hitrust_v92_1150_01c2system_10_01_c,
    benchmark.hipaa_hitrust_v92_1153_01c3system_35_01_c,
    benchmark.hipaa_hitrust_v92_1151_01c3system_1_01_c,
    benchmark.hipaa_hitrust_v92_1152_01c3system_2_01_c,
    benchmark.hipaa_hitrust_v92_1154_01c3system_4_01_c
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1143_01c1system_23_01_c" {
  title         = "1143.01c1System.123 - 01.c"
  description   = "Privileges are formally authorized and controlled, allocated to users on a need-to-use and event-by-event basis for their functional role (e.g., user or administrator), and documented for each system product/element."
  children = [
    control.network_security_group_remote_access_restricted,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1144_01c1system_4_01_c" {
  title         = "1144.01c1System.4 - 01.c"
  description   = "The organization explicitly authorizes access to specific security relevant functions (deployed in hardware, software, and firmware) and security-relevant information."
  children = [
    control.iam_subscription_owner_max_3,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1145_01c2system_1_01_c" {
  title         = "1145.01c2System.1 - 01.c"
  description   = "Role-based access control is implemented and capable of mapping each user to one or more roles, and each role to one or more system functions."
  children = [
    control.iam_subscription_owner_more_than_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1150_01c2system_10_01_c" {
  title         = "1150.01c2System.10 - 01.c"
  description   = "Access to management functions or administrative consoles for systems hosting virtualized systems are restricted to personnel based upon the principle of least privilege and supported through technical controls."
  children = [
    control.network_security_group_remote_access_restricted,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1153_01c3system_35_01_c" {
  title         = "1153.01c3System.35 - 01.c"
  description   = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties."
  children = [
    control.kubernetes_instance_rbac_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1149_01c2system_9_01_c" {
  title         = "1149.01c2System.9 - 01.c"
  description   = "The organization facilitates information sharing by enabling authorized users to determine a business partner's access when discretion is allowed as defined by the organization and by employing manual processes or automated mechanisms to assist users in making information sharing/collaboration decisions."
  children = [
    control.kubernetes_instance_rbac_enabled,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1151_01c3system_1_01_c" {
  title         = "1151.01c3System.1 - 01.c"
  description   = "The organization limits authorization to privileged accounts on information systems to a pre-defined subset of users."
  children = [
    control.iam_subscription_owner_max_3,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1152_01c3system_2_01_c" {
  title         = "1152.01c3System.2 - 01.c"
  description   = "The organization audits the execution of privileged functions on information systems and ensures information systems prevent non-privileged users from executing privileged functions."
  children = [
    control.iam_subscription_owner_more_than_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1154_01c3system_4_01_c" {
  title         = "11154.01c3System.4 - 01.c"
  description   = "Contractors are provided with minimal system and physical access only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply."
  children = [
    control.iam_subscription_owner_max_3,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}
