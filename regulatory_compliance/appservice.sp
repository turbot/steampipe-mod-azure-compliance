locals {
  conformance_pack_appservice_common_tags = {
    service = "appservice"
  }
}

control "appservice_web_app_use_https" {
  title       = "Web Application should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql         = query.appservice_web_app_use_https.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_incoming_client_cert_on" {
  title       = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  sql         = query.appservice_web_app_incoming_client_cert_on.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_web_app_remote_debugging_disabled" {
  title       = "Remote debugging should be turned off for Web Applications"
  description = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
  sql         = query.appservice_web_app_remote_debugging_disabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_remote_debugging_disabled" {
  title       = "Remote debugging should be turned off for Function Apps"
  description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  sql         = query.appservice_function_app_remote_debugging_disabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your Function App"
  description = "Upgrade to the latest TLS version."
  sql         = query.appservice_function_app_latest_tls_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your Web App"
  description = "Upgrade to the latest TLS version."
  sql         = query.appservice_web_app_latest_tls_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_only_https_accessible" {
  title       = "Function App should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql         = query.appservice_function_app_only_https_accessible.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_use_virtual_service_endpoint" {
  title       = "App Service should use a virtual network service endpoint"
  description = "This policy audits any App Service not configured to use a virtual network service endpoint."
  sql         = query.appservice_web_app_use_virtual_service_endpoint.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_api_app_use_https" {
  title       = "API App should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql         = query.appservice_api_app_use_https.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_remote_debugging_disabled" {
  title       = "Remote debugging should be turned off for API Apps"
  description = "Remote debugging requires inbound ports to be opened on API apps. Remote debugging should be turned off."
  sql         = query.appservice_api_app_remote_debugging_disabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your API App"
  description = "Upgrade to the latest TLS version."
  sql         = query.appservice_api_app_latest_tls_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_diagnostic_logs_enabled" {
  title       = "Diagnostic logs in App Services should be enabled"
  description = "Audit enabling of diagnostic logs on the app. This enables you to recreate activity trails for investigation purposes if a security incident occurs or your network is compromised."
  sql         = query.appservice_web_app_diagnostic_logs_enabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_cors_no_star" {
  title       = "CORS should not allow every resource to access your Web Applications"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your web application. Allow only required domains to interact with your web app."
  sql         = query.appservice_web_app_cors_no_star.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_cors_no_star" {
  title       = "CORS should not allow every resource to access your Function Apps"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your Function app. Allow only required domains to interact with your Function app."
  sql         = query.appservice_function_app_cors_no_star.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_cors_no_star" {
  title       = "CORS should not allow every resource to access your API App"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your API app. Allow only required domains to interact with your API app."
  sql         = query.appservice_api_app_cors_no_star.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_uses_managed_identity" {
  title       = "Managed identity should be used in your Web App"
  description = "Use a managed identity for enhanced authentication security."
  sql         = query.appservice_web_app_uses_managed_identity.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_uses_managed_identity" {
  title       = "Managed identity should be used in your API App"
  description = "Use a managed identity for enhanced authentication security."
  sql         = query.appservice_api_app_uses_managed_identity.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_uses_managed_identity" {
  title       = "Managed identity should be used in your Function App"
  description = "Use a managed identity for enhanced authentication security."
  sql         = query.appservice_function_app_uses_managed_identity.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_azure_defender_enabled" {
  title       = "Azure Defender for App Service should be enabled"
  description = "Azure Defender for App Service leverages the scale of the cloud, and the visibility that Azure has as a cloud provider, to monitor for common web app attacks."
  sql         = query.appservice_azure_defender_enabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_client_certificates_on" {
  title       = "Ensure API app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  sql         = query.appservice_api_app_client_certificates_on.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_client_certificates_on" {
  title       = "Ensure WEB app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  sql         = query.appservice_web_app_client_certificates_on.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_client_certificates_on" {
  title       = "Function apps should have 'Client Certificates (Incoming client certificates)' enabled"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients with valid certificates will be able to reach the app."
  sql         = query.appservice_function_app_client_certificates_on.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_ftps_enabled" {
  title       = "FTPS only should be required in your API App"
  description = "Enable FTPS enforcement for enhanced security."
  sql         = query.appservice_api_app_ftps_enabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_ftps_enabled" {
  title       = "FTPS only should be required in your Function App"
  description = "Enable FTPS enforcement for enhanced security."
  sql         = query.appservice_function_app_ftps_enabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_ftps_enabled" {
  title       = "FTPS should be required in your Web App"
  description = "Enable FTPS enforcement for enhanced security."
  sql         = query.appservice_web_app_ftps_enabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_http_version" {
  title       = "Ensure that 'HTTP Version' is the latest, if used to run the Function app"
  description = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for web apps to take advantage of security fixes, if any, and/or new functionalities of the newer version. Currently, this policy only applies to Linux web apps."
  sql         = query.appservice_function_app_latest_http_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_http_version" {
  title       = "Ensure that 'HTTP Version' is the latest, if used to run the Web app"
  description = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for web apps to take advantage of security fixes, if any, and/or new functionalities of the newer version. Currently, this policy only applies to Linux web apps."
  sql         = query.appservice_web_app_latest_http_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}
