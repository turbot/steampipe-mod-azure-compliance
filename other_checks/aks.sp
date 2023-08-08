locals {
  other_aks_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/AKS"
  })
}

benchmark "other_aks" {
  title = "AKS"
  children = [
    control.kubernetes_cluster_addon_azure_policy_enabled,
    control.kubernetes_cluster_key_vault_secret_rotation_enabled,
    control.kubernetes_cluster_logging_enabled,
    control.kubernetes_cluster_max_pod_50,
    control.kubernetes_cluster_network_policy_enabled,
    control.kubernetes_cluster_node_restrict_public_access,
    control.kubernetes_cluster_restrict_public_access,
    control.kubernetes_cluster_sku_standard,
    control.kubernetes_cluster_upgrade_channel
  ]

  tags = merge(local.other_aks_common_tags, {
    type = "Benchmark"
  })
}
