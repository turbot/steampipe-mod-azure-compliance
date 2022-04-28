benchmark "hipaa_hitrust_v92_privilege_management" {
  title    = "Privilege Management"
  children = [
    benchmark.hipaa_hitrust_v92_11180_01c3system_6_01_c,
    benchmark.hipaa_hitrust_v92_1143_01c1system_23_01_c,
    benchmark.hipaa_hitrust_v92_1144_01c1system_4_01_c,
    benchmark.hipaa_hitrust_v92_1145_01c2system_1_01_c,
    benchmark.hipaa_hitrust_v92_1146_01c2system_23_01_c,
    benchmark.hipaa_hitrust_v92_1147_01c2system_456_01_c,
    benchmark.hipaa_hitrust_v92_1148_01c2system_78_01_c,
    benchmark.hipaa_hitrust_v92_1149_01c2system_9_01_c,
    benchmark.hipaa_hitrust_v92_1150_01c2system_10_01_c,
    benchmark.hipaa_hitrust_v92_1151_01c3system_1_01_c,
    benchmark.hipaa_hitrust_v92_1152_01c3system_2_01_c,
    benchmark.hipaa_hitrust_v92_1153_01c3system_35_01_c,
    benchmark.hipaa_hitrust_v92_1154_01c3system_4_01_c
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11180_01c3system_6_01_c" {
  title    = "Access to management functions or administrative consoles for systems hosting virtualized systems are restricted to personnel based upon the principle of least privilege and supported through technical controls"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1143_01c1system_23_01_c" {
  title   = "Privileges are formally authorized and controlled, allocated to users on a need-to-use and event-by-event basis for their functional role (e.g., user or administrator), and documented for each system product/element"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1144_01c1system_4_01_c" {
  title    = "The organization explicitly authorizes access to specific security relevant functions (deployed in hardware, software, and firmware) and security-relevant information"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1145_01c2system_1_01_c" {
  title    = "Role-based access control is implemented and capable of mapping each user to one or more roles, and each role to one or more system functions"
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1150_01c2system_10_01_c" {
  title    = "The access control system for the system components storing, processing or transmitting covered information is set with a default 'deny-all' setting"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1147_01c2system_456_01_c" {
  title    = "Elevated privileges are assigned to a different user ID from those used for normal business use, all users access privileged services in a single role, and such privileged access is minimized"
  children = [
    control.iam_deprecated_account_with_owner_roles
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1153_01c3system_35_01_c" {
  title    = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties"
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1149_01c2system_9_01_c" {
  title    = "The organization facilitates information sharing by enabling authorized users to determine a business partner's access when discretion is allowed as defined by the organization and by employing manual processes or automated mechanisms to assist users in making information sharing/collaboration decisions"
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1151_01c3system_1_01_c" {
  title    = "The organization limits authorization to privileged accounts on information systems to a pre-defined subset of users"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1152_01c3system_2_01_c" {
  title    = "The organization audits the execution of privileged functions on information systems and ensures information systems prevent non-privileged users from executing privileged functions"
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1154_01c3system_4_01_c" {
  title    = "Contractors are provided with minimal system and physical access only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1148_01c2system_78_01_c" {
  title    = "The organization restricts access to privileged functions and all security-relevant information"
  children = [
    control.iam_no_custom_role,
    control.compute_vm_meet_security_option_requirement_windows
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1146_01c2system_23_01_c" {
  title    = "The organization promotes the development and use of programs that avoid the need to run with elevated privileges and system routines to avoid the need to grant privileges to users"
  children = [
    control.iam_external_user_with_owner_role
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}
