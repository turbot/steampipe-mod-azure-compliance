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
    hipaa_hitrust_v92 = "true"
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
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_function_app_remote_debugging_disabled" {
  title       = "Remote debugging should be turned off for Function Apps"
  description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  sql         = query.appservice_function_app_remote_debugging_disabled.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_function_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your Function App"
  description = "Upgrade to the latest TLS version."
  sql         = query.appservice_function_app_latest_tls_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_web_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your Web App"
  description = "Upgrade to the latest TLS version."
  sql         = query.appservice_web_app_latest_tls_version.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_function_app_only_https_accessible" {
  title       = "Function App should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  sql         = query.appservice_function_app_only_https_accessible.sql

  tags = merge(local.conformance_pack_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}


