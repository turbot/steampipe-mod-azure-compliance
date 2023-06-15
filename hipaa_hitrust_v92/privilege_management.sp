benchmark "hipaa_hitrust_v92_privilege_management" {
  title    = "Privilege Management"
  children = [
    benchmark.hipaa_hitrust_v92_1149_01c2system_9_01_c,
    benchmark.hipaa_hitrust_v92_1154_01c3system_4_01_c
  ]

  tags = local.hipaa_hitrust_v92_common_tags
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

benchmark "hipaa_hitrust_v92_1154_01c3system_4_01_c" {
  title    = "Contractors are provided with minimal system and physical access only after the organization assesses the contractor's ability to comply with its security requirements and the contractor agrees to comply"
  children = [
    control.iam_subscription_owner_max_3
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}