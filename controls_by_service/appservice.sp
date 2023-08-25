locals {
  fundamental_security_appservice_common_tags = merge(local.fundamental_security_common_tags, {
    service = "Azure/AppService"
  })
}

benchmark "fundamental_security_appservice" {
  title       = "App Service"
  description = "This section contains recommendations for configuring App Service resources."
  children = [
    control.app_service_environment_internal_encryption_enabled,
    control.appservice_api_app_client_certificates_on,
    control.appservice_api_app_cors_no_star,
    control.appservice_api_app_ftps_enabled,
    control.appservice_api_app_latest_tls_version,
    control.appservice_api_app_remote_debugging_disabled,
    control.appservice_api_app_use_https,
    control.appservice_api_app_uses_managed_identity,
    control.appservice_authentication_enabled,
    control.appservice_ftp_deployment_disabled,
    control.appservice_function_app_client_certificates_on,
    control.appservice_function_app_cors_no_star,
    control.appservice_function_app_ftps_enabled,
    control.appservice_function_app_latest_http_version,
    control.appservice_function_app_latest_java_version,
    control.appservice_function_app_latest_python_version,
    control.appservice_function_app_latest_tls_version,
    control.appservice_function_app_only_https_accessible,
    control.appservice_function_app_remote_debugging_disabled,
    control.appservice_function_app_uses_managed_identity,
    control.appservice_plan_minimum_sku,
    control.appservice_web_app_always_on,
    control.appservice_web_app_client_certificates_on,
    control.appservice_web_app_cors_no_star,
    control.appservice_web_app_diagnostic_logs_enabled,
    control.appservice_web_app_failed_request_tracing_enabled,
    control.appservice_web_app_ftps_enabled,
    control.appservice_web_app_health_check_enabled,
    control.appservice_web_app_http_logs_enabled,
    control.appservice_web_app_incoming_client_cert_on,
    control.appservice_web_app_latest_dotnet_framework_version,
    control.appservice_web_app_latest_http_version,
    control.appservice_web_app_latest_java_version,
    control.appservice_web_app_latest_php_version,
    control.appservice_web_app_latest_python_version,
    control.appservice_web_app_latest_tls_version,
    control.appservice_web_app_register_with_active_directory_enabled,
    control.appservice_web_app_remote_debugging_disabled,
    control.appservice_web_app_slot_use_https,
    control.appservice_web_app_use_https,
    control.appservice_web_app_use_virtual_service_endpoint,
    control.appservice_web_app_uses_managed_identity,
    control.appservice_web_app_worker_more_than_one
  ]

  tags = merge(local.fundamental_security_appservice_common_tags, {
    type = "Benchmark"
  })
}
