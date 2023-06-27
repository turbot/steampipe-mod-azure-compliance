benchmark "hipaa_hitrust_v92_privilege_management" {
  title       = "Privilege Management"
  description = "Privilege management is a crucial aspect of HIPAA and HITRUST compliance, focusing on access control to protect sensitive health information. It involves implementing role-based access controls, strong authentication measures, regular reviews of access privileges, and robust logging and monitoring systems. By enforcing these measures, organizations can ensure that only authorized individuals have appropriate access to electronic protected health information, reducing the risk of unauthorized disclosure and maintaining compliance with HIPAA and HITRUST standards."
  children = [
    benchmark.hipaa_hitrust_v92_1149_01c2system,
    benchmark.hipaa_hitrust_v92_1154_01c3system
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1149_01c2system" {
  title       = "The organization facilitates information sharing by enabling authorized users"
  description = "To determine a business partner's access when discretion is allowed as defined by the organization and by employing manual processes or automated mechanisms to assist users in making information sharing/collaboration decisions."
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1154_01c3system" {
  title       = "Contractors are provided with minimal system and physical access"
  description = "The allocation and use of privileges to information systems and services shall be restricted and controlled. Special attention shall be given to the allocation of privileged access rights, which allow users to override system controls. Only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply."
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}
