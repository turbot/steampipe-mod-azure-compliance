locals {
  conformance_pack_kubernetes_common_tags = {
    service = "kubernetes"
  }
}

control "kubernetes_instance_rbac_enabled" {
  title       = "Role-Based Access Control (RBAC) should be used on Kubernetes Services"
  description = "To provide granular filtering on the actions that users can perform, use Role-Based Access Control (RBAC) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies."
  sql         = query.kubernetes_instance_rbac_enabled.sql

  tags = merge(local.conformance_pack_kubernetes_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_azure_defender_enabled" {
  title       = "Azure Defender for Kubernetes should be enabled"
  description = "Azure Defender for Kubernetes provides real-time threat protection for containerized environments and generates alerts for suspicious activities."
  sql         = query.kubernetes_azure_defender_enabled.sql

  tags = merge(local.conformance_pack_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "kubernetes_cluster_add_on_azure_policy_enabled" {
  title       = "Azure Policy Add-on for Kubernetes service (AKS) should be installed and enabled on your clusters"
  description = "Azure Policy Add-on for Kubernetes service (AKS) extends Gatekeeper v3, an admission controller webhook for Open Policy Agent (OPA), to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner."
  sql         = query.kubernetes_cluster_add_on_azure_policy_enabled.sql

  tags = merge(local.conformance_pack_kubernetes_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
