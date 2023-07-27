locals {
  other_common_tags = merge(local.azure_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_latest_java_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.container_registry_admin_user_disabled,
    control.container_registry_quarantine_policy_enabled,
    control.container_registry_retention_policy_enabled,
    control.container_registry_public_network_access_disabled,
    control.container_registry_trust_policy_enabled,
    control.container_registry_geo_replication_enabled,
    control.appservice_web_app_latest_python_version,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_remote_debugging_disabled,
    control.azure_redis_cache_in_virtual_network,
    control.compute_vm_log_analytics_agent_health_issues_resolved,
    control.compute_vm_scale_set_logging_enabled,
    control.keyvault_vault_public_network_access_disabled,
    control.securitycenter_azure_defender_on_for_containerregistry,
    control.securitycenter_azure_defender_on_for_k8s
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}
