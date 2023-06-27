benchmark "hipaa_hitrust_v92_access_control" {
  title       = "11 Access Control"
  description = "Default and unnecessary system accounts are removed, disabled, or otherwise secured (e.g., the passwords are changed, and privileges are reduced to the lowest access levels). Account managers are notified when users' access rights change (e.g., termination, change in position) and modify the user's account accordingly."
  children = [
    benchmark.hipaa_hitrust_v92_11109_01q1organizational,
    benchmark.hipaa_hitrust_v92_11111_01q2system,
    benchmark.hipaa_hitrust_v92_11112_01q2organizational,
    benchmark.hipaa_hitrust_v92_1116_01j1organizational,
    benchmark.hipaa_hitrust_v92_1118_01j2organizational,
    benchmark.hipaa_hitrust_v92_11180_01c3system,
    benchmark.hipaa_hitrust_v92_1119_01j2organizational,
    benchmark.hipaa_hitrust_v92_1120_09ab3system,
    benchmark.hipaa_hitrust_v92_1121_01j3organizational,
    benchmark.hipaa_hitrust_v92_1123_01q1system,
    benchmark.hipaa_hitrust_v92_1125_01q2system,
    benchmark.hipaa_hitrust_v92_1127_01q2system,
    benchmark.hipaa_hitrust_v92_1143_01c1system,
    benchmark.hipaa_hitrust_v92_1144_01c1system,
    benchmark.hipaa_hitrust_v92_1145_01c2system,
    benchmark.hipaa_hitrust_v92_1146_01c2system,
    benchmark.hipaa_hitrust_v92_1147_01c2system,
    benchmark.hipaa_hitrust_v92_1148_01c2system,
    benchmark.hipaa_hitrust_v92_1150_01c2system,
    benchmark.hipaa_hitrust_v92_1151_01c3system,
    benchmark.hipaa_hitrust_v92_1152_01c3system,
    benchmark.hipaa_hitrust_v92_1153_01c3system,
    benchmark.hipaa_hitrust_v92_1175_01j1organizational,
    benchmark.hipaa_hitrust_v92_1178_01j2organizational,
    benchmark.hipaa_hitrust_v92_1179_01j3organizational,
    benchmark.hipaa_hitrust_v92_1192_01l1organizational,
    benchmark.hipaa_hitrust_v92_1193_01l2organizational,
    benchmark.hipaa_hitrust_v92_1194_01l2organizational,
    benchmark.hipaa_hitrust_v92_1195_01l3organizational,
    benchmark.hipaa_hitrust_v92_1197_01l3organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11109_01q1organizational" {
  title       = "11109.01q1Organizational.57-01.q 01.05 Operating System Access Control"
  description = "The organization ensures that redundant user IDs are not issued to other users and that all users are uniquely identified and authenticated for both local and remote access to information systems."
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_11111_01q2system" {
  title       = "11111.01q2System.4-01.q 01.05 Operating System Access Control"
  description = "When PKI-based authentication is used, the information system validates certificates by constructing and verifying a certification path to an accepted trust anchor, including checking certificate status information; enforces access to the corresponding private key; maps the identity to the corresponding account of the individual or group; and implements a local cache of revocation data to support path discovery and validation in case of an inability to access revocation information via the network."
  children = [
    control.iam_user_with_read_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_11112_01q2organizational" {
  title       = "11112.01q2Organizational.67-01.q 01.05 Operating System Access Control"
  description = "The information system employs replay-resistant authentication mechanisms such as nonce, one-time passwords, or time stamps to secure network access for privileged accounts; and, for hardware token-based authentication, employs mechanisms that satisfy minimum token requirements discussed in NIST SP 800-63-2, Electronic Authentication Guideline."
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1116_01j1organizational" {
  title       = "1116.01j1Organizational.145-01.j 01.04 Network Access Control"
  description = "Prevent unauthorized access to networked services, such as user authentication for external connections"
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1118_01j2organizational" {
  title       = "1118.01j2Organizational.124-01.j 01.04 Network Access Control"
  description = "The organization has implemented encryption (e.g.  VPN solutions or private lines) and logs remote access to the organization's network by employees, contractors or third party."
  children = [
    control.iam_user_with_read_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_11180_01c3system" {
  title       = "11180.01c3System.6-01.c 01.02 Authorized Access to Information Systems"
  description = "Access to management functions or administrative consoles for systems hosting virtualized systems are restricted to personnel based upon the principle of least privilege and supported through technical controls"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1119_01j2organizational" {
  title       = "1119.01j2Organizational.3-01.j 01.04 Network Access Control"
  description = "Network equipment is checked for unanticipated dial-up capabilities"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1120_09ab3system" {
  title       = "1120.09ab3System.9-09.ab 09.10 Monitoring"
  description = "Unauthorized remote connections to the information systems are monitored and reviewed at least quarterly, and appropriate action is taken if an unauthorized connection is discovered"
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1121_01j3organizational" {
  title       = "1121.01j3Organizational.2-01.j 01.04 Network Access Control"
  description = "The organization ensures that redundant user IDs are not issued to other users and that all users are uniquely identified and authenticated for both local and remote access to information systems."
  children = [
    control.iam_user_with_owner_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1123_01q1system" {
  title       = "1123.01q1System.2-01.q 01.05 Operating System Access Control"
  description = "Users who performed privileged functions (e.g., system administration) use separate accounts when performing those privileged functions"
  children = [
    control.compute_vm_administrators_group_with_extra_accounts_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1125_01q2system" {
  title       = "1125.01q2System.1-01.q 01.05 Operating System Access Control"
  description = "Multi-factor authentication methods are used in accordance with organizational policy, (e.g., for remote network access)"
  children = [
    control.compute_vm_administrators_group_with_specified_members_windows,
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1127_01q2system" {
  title       = "1127.01q2System.3-01.q 01.05 Operating System Access Control"
  description = "Where tokens are provided for multi-factor authentication, in-person verification is required prior to granting access"
  children = [
    control.compute_vm_administrators_group_with_no_specified_members_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1143_01c1system" {
  title       = "1143.01c1System.123-01.c 01.02 Authorized Access to Information Systems"
  description = "Privileges are formally authorized and controlled, allocated to users on a need-to-use and event-by-event basis for their functional role (e.g., user or administrator), and documented for each system product/element"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1144_01c1system" {
  title       = "1144.01c1System.4-01.c 01.02 Authorized Access to Information Systems"
  description = "The organization explicitly authorizes access to specific security relevant functions (deployed in hardware, software, and firmware) and security-relevant information"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1145_01c2system" {
  title       = "1145.01c2System.1-01.c 01.02 Authorized Access to Information Systems"
  description = "Role-based access control is implemented and capable of mapping each user to one or more roles, and each role to one or more system functions"
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1146_01c2system" {
  title       = "1146.01c2System.23-01.c 01.02 Authorized Access to Information Systems"
  description = "The organization promotes the development and use of programs that avoid the need to run with elevated privileges and system routines to avoid the need to grant privileges to users"
  children = [
    control.iam_external_user_with_owner_role
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1147_01c2system" {
  title       = "1147.01c2System.456-01.c 01.02 Authorized Access to Information Systems"
  description = "Elevated privileges are assigned to a different user ID from those used for normal business use, all users access privileged services in a single role, and such privileged access is minimized"
  children = [
    control.iam_deprecated_account_with_owner_roles
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1148_01c2system" {
  title       = "1148.01c2System.78-01.c 01.02 Authorized Access to Information Systems"
  description = "The organization restricts access to privileged functions and all security-relevant information"
  children = [
    control.iam_no_custom_role,
    control.compute_vm_meet_security_option_requirement_windows
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1150_01c2system" {
  title       = "1150.01c2System.10-01.c 01.02 Authorized Access to Information Systems"
  description = "The access control system for the system components storing, processing or transmitting covered information is set with a default 'deny-all' setting"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1151_01c3system" {
  title       = "1151.01c3System.1-01.c 01.02 Authorized Access to Information Systems"
  description = "The organization limits authorization to privileged accounts on information systems to a pre-defined subset of users"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1152_01c3system" {
  title       = "1152.01c3System.2-01.c 01.02 Authorized Access to Information Systems"
  description = "The organization audits the execution of privileged functions on information systems and ensures information systems prevent non-privileged users from executing privileged functions"
  children = [
    control.iam_subscription_owner_more_than_1
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/ActiveDirectory"
  })
}

benchmark "hipaa_hitrust_v92_1153_01c3system" {
  title       = "1153.01c3System.35-01.c 01.02 Authorized Access to Information Systems"
  description = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties"
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1175_01j1organizational" {
  title       = "1175.01j1Organizational.8-01.j 01.04 Network Access Control"
  description = "Remote access to business information across public networks only takes place after successful identification and authentication"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1178_01j2organizational" {
  title       = "1178.01j2Organizational.7-01.j 01.04 Network Access Control"
  children = [
    control.iam_user_with_read_permission_on_subscription_mfa_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1179_01j3organizational" {
  title       = "1179.01j3Organizational.1-01.j 01.04 Network Access Control"
  description = "The information system monitors and controls remote access methods"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1192_01l1organizational" {
  title       = "1192.01l1Organizational.1-01.l 01.04 Network Access Control"
  description = "Access to network equipment is physically protected"
  children = [
    control.compute_vm_jit_access_protected
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1193_01l2organizational" {
  title       = "1193.01l2Organizational.13-01.l 01.04 Network Access Control"
  description = "Controls for the access to diagnostic and configuration ports include the use of a key lock and the implementation of supporting procedures to control physical access to the port"
  children = [
    control.network_security_group_remote_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1194_01l2organizational" {
  title       = "1194.01l2Organizational.2-01.l 01.04 Network Access Control"
  description = "Ports, services, and similar applications installed on a computer or network systems, which are not specifically required for business functionality, are disabled or removed"
  children = [
    control.appservice_api_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1195_01l3organizational" {
  title       = "1195.01l3Organizational.1-01.l 01.04 Network Access Control"
  description = "The organization reviews the information system within every three hundred and sixty- five (365) days to identify and disables unnecessary and non-secure functions, ports, protocols, and/or services"
  children = [
    control.appservice_function_app_remote_debugging_disabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "hipaa_hitrust_v92_1197_01l3organizational" {
  title       = "1197.01l3Organizational.3-01.l 01.04 Network Access Control"
  description = "The organization disables Bluetooth and peer-to-peer networking protocols within the information system determined to be unnecessary or non-secure"
  children = [
    control.compute_vm_adaptive_application_controls_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}
