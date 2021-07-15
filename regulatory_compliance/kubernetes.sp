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
    hipaa_hitrust_v92 = "true"
  })
}