locals {
  controls_by_service_kubernetes_common_tags = merge(local.controls_by_service_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "controls_by_service_kubernetes" {
  title       = "Kubernetes Service"
  description = "This section contains recommendations for configuring Kubernetes Service resources."
  children = [
    control.kubernetes_cluster_add_on_azure_policy_enabled,
    control.kubernetes_cluster_addon_azure_policy_enabled,
    control.kubernetes_cluster_authorized_ip_range_defined,
    control.kubernetes_cluster_key_vault_secret_rotation_enabled,
    control.kubernetes_cluster_logging_enabled,
    control.kubernetes_cluster_max_pod_50,
    control.kubernetes_cluster_network_policy_enabled,
    control.kubernetes_cluster_node_restrict_public_access,
    control.kubernetes_cluster_os_and_data_disks_encrypted_with_cmk,
    control.kubernetes_cluster_restrict_public_access,
    control.kubernetes_cluster_sku_standard,
    control.kubernetes_cluster_temp_disks_and_agent_node_pool_cache_encrypted_at_host,
    control.kubernetes_cluster_upgrade_channel,
    control.kubernetes_cluster_upgraded_with_non_vulnerable_version,
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.controls_by_service_kubernetes_common_tags, {
    type = "Benchmark"
  })
}
