locals {
  other_appservice_common_tags = merge(local.azure_compliance_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "other_appservice" {
  title = "App Service"
  children = [
    control.appservice_api_app_uses_managed_identity,
    control.appservice_function_app_latest_java_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_plan_minimum_sku,
    control.appservice_web_app_always_on,
    control.appservice_web_app_failed_request_tracing_enabled,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_health_check_enabled,
    control.appservice_web_app_http_logs_enabled,
    control.appservice_web_app_latest_dotnet_framework_version,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.appservice_web_app_latest_python_version,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_remote_debugging_disabled,
    control.appservice_web_app_slot_use_https,
    control.appservice_web_app_worker_more_than_one
  ]

  tags = merge(local.other_appservice_common_tags, {
    type = "Benchmark"
  })
}
