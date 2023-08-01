locals {
  other_common_tags = merge(local.azure_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.apimanagement_service_client_certificate_enabled,
    control.app_configuration_encryption_enabled,
    control.app_configuration_sku_standard,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_latest_java_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_web_app_failed_request_tracing_enabled,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_http_logs_enabled,
    control.appservice_web_app_latest_dotnet_framework_version,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.appservice_web_app_latest_python_version,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_remote_debugging_disabled,
    control.appservice_web_app_slot_use_https,
    control.appservice_web_app_worker_more_than_one,
    control.azure_redis_cache_in_virtual_network,
    control.compute_vm_log_analytics_agent_health_issues_resolved,
    control.compute_vm_scale_set_logging_enabled,
    control.container_registry_admin_user_disabled,
    control.container_registry_geo_replication_enabled,
    control.container_registry_public_network_access_disabled,
    control.container_registry_quarantine_policy_enabled,
    control.container_registry_retention_policy_enabled,
    control.container_registry_trust_policy_enabled,
    control.cosmosdb_account_key_based_metadata_write_access_disabled,
    control.data_factory_public_network_access_disabled,
    control.data_factory_uses_git_repository,
    control.eventgrid_domain_identity_provider_enabled,
    control.eventgrid_domain_restrict_public_access,
    control.keyvault_vault_public_network_access_disabled,
    control.kubernetes_cluster_addon_azure_policy_enabled,
    control.kubernetes_cluster_node_restrict_public_access,
    control.kubernetes_cluster_restrict_public_access,
    control.kubernetes_cluster_sku_standard,
    control.kubernetes_cluster_upgrade_channel,
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_k8s
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}
