benchmark "hipaa_hitrust_v92_privilege_management" {
  title         = "Privilege Management"
  children = [
    benchmark.hipaa_hitrust_v92_11180_01c3system_6_01_c,
    benchmark.hipaa_hitrust_v92_1153_01c3system_35_01_c
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_11180_01c3system_6_01_c" {
  title         = "11180.01c3System.6 - 01.c"
  description   = "Access to management functions or administrative consoles for systems hosting virtualized systems are restricted to personnel based upon the principle of least privilege and supported through technical controls."
  children = [
    control.hipaa_hitrust_v92_11180_01c3system_6_01_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_11180_01c3system_6_01_c_1" {
  title         = "Management ports should be closed on your virtual machines"
  description   = "Open remote management ports are exposing your VM to a high level of risk from Internet-based attacks. These attacks attempt to brute force credentials to gain admin access to the machine."
  sql           = query.securitycenter_asc_default_setting_not_disabled.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1153_01c3system_35_01_c" {
  title         = "1153.01c3System.35 - 01.c "
  description   = "All file system access not explicitly required is disabled, and only authorized users are permitted access to only that which is expressly required for the performance of the users' job duties."
  children = [
    control.hipaa_hitrust_v92_1153_01c3system_35_01_c_1,
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

control "hipaa_hitrust_v92_1153_01c3system_35_01_c_1" {
  title         = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  description   = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
  sql           = query.kubernetes_instance_rbac_enabled.sql
  #documentation = file("./cis_v100/docs/cis_v100_1_1.md")

  tags          = local.hipaa_hitrust_v92_common_tags
}