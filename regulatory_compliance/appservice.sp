locals {
  regulatory_compliance_appservice_common_tags = {
    service = "Azure/AppService"
  }
}

control "appservice_web_app_use_https" {
  title       = "Web Application should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  query       = query.appservice_web_app_use_https

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "appservice_web_app_remote_debugging_disabled" {
  title       = "Remote debugging should be turned off for Web Applications"
  description = "Remote debugging requires inbound ports to be opened on a web application. Remote debugging should be turned off."
  query       = query.appservice_web_app_remote_debugging_disabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_function_app_remote_debugging_disabled" {
  title       = "Function apps should have remote debugging turned off"
  description = "Remote debugging requires inbound ports to be opened on function apps. Remote debugging should be turned off."
  query       = query.appservice_function_app_remote_debugging_disabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_tls_version" {
  title       = "Function apps should use the latest TLS version"
  description = "Periodically, newer versions are released for TLS either due to security flaws, include additional functionality, and enhance speed. Upgrade to the latest TLS version for Function apps to take advantage of security fixes, if any, and/or new functionalities of the latest version."
  query       = query.appservice_function_app_latest_tls_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_tls_version" {
  title       = "Latest TLS version should be used in your Web App"
  description = "Upgrade to the latest TLS version."
  query       = query.appservice_web_app_latest_tls_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_function_app_only_https_accessible" {
  title       = "Function apps should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  query       = query.appservice_function_app_only_https_accessible

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
  })
}

control "appservice_web_app_use_virtual_service_endpoint" {
  title       = "App Service apps should use a virtual network service endpoint"
  description = "Use virtual network service endpoints to restrict access to your app from selected subnets from an Azure virtual network. To learn more about App Service service endpoints, visit https://aks.ms/appservice-vnet-service-endpoint."
  query       = query.appservice_web_app_use_virtual_service_endpoint

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_api_app_use_https" {
  title       = "App Service API apps should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  query       = query.appservice_api_app_use_https

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
    pci_dss_v321      = "true"
  })
}

control "appservice_api_app_remote_debugging_disabled" {
  title       = "App Service apps should have remote debugging turned off"
  description = "Remote debugging requires inbound ports to be opened on an App Service app. Remote debugging should be turned off."
  query       = query.appservice_api_app_remote_debugging_disabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_latest_tls_version" {
  title       = "App Service apps should use the latest TLS version"
  description = "Periodically, newer versions are released for TLS either due to security flaws, include additional functionality, and enhance speed. Upgrade to the latest TLS version for App Service apps to take advantage of security fixes, if any, and/or new functionalities of the latest version."
  query       = query.appservice_api_app_latest_tls_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_diagnostic_logs_enabled" {
  title       = "App Service apps should have resource logs enabled"
  description = "Audit enabling of resource logs on the app. This enables you to recreate activity trails for investigation purposes if a security incident occurs or your network is compromised."
  query       = query.appservice_web_app_diagnostic_logs_enabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_cors_no_star" {
  title       = "App Service apps should not have CORS configured to allow every resource to access your apps"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your web application. Allow only required domains to interact with your web app."
  query       = query.appservice_web_app_cors_no_star

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_cors_no_star" {
  title       = "Function apps should not have CORS configured to allow every resource to access your apps"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your Function app. Allow only required domains to interact with your Function app."
  query       = query.appservice_function_app_cors_no_star

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_uses_managed_identity" {
  title       = "Managed identity should be used in your API App"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_api_app_uses_managed_identity

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_api_app_cors_no_star" {
  title       = "App Service apps should not have CORS configured to allow every resource to access your apps"
  description = "Cross-Origin Resource Sharing (CORS) should not allow all domains to access your app. Allow only required domains to interact with your app."
  query       = query.appservice_api_app_cors_no_star

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_uses_managed_identity" {
  title       = "App Service apps should use managed identity"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_web_app_uses_managed_identity

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_uses_managed_identity" {
  title       = "Function apps should use managed identity"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_function_app_uses_managed_identity

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_client_certificates_on" {
  title       = "App Service apps should have 'Client Certificates (Incoming client certificates)' enabled"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  query       = query.appservice_api_app_client_certificates_on

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_client_certificates_on" {
  title       = "App Service apps should have 'Client Certificates (Incoming client certificates)' enabled"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  query       = query.appservice_web_app_client_certificates_on

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "appservice_web_app_ftps_enabled" {
  title       = "FTPS should be required in your Web App"
  description = "Enable FTPS enforcement for enhanced security."
  query       = query.appservice_web_app_ftps_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_function_app_client_certificates_on" {
  title       = "Function apps should have 'Client Certificates (Incoming client certificates)' enabled"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients with valid certificates will be able to reach the app."
  query       = query.appservice_function_app_client_certificates_on

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_ftps_enabled" {
  title       = "FTPS only should be required in your API App"
  description = "Enable FTPS enforcement for enhanced security."
  query       = query.appservice_api_app_ftps_enabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_ftps_enabled" {
  title       = "FTPS only should be required in your Function App"
  description = "Enable FTPS enforcement for enhanced security."
  query       = query.appservice_function_app_ftps_enabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_http_version" {
  title       = "Ensure that 'HTTP Version' is the latest, if used to run the Function app"
  description = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for web apps to take advantage of security fixes, if any, and/or new functionalities of the newer version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_function_app_latest_http_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_http_version" {
  title       = "Ensure that 'HTTP Version' is the latest, if used to run the Web app"
  description = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for web apps to take advantage of security fixes, if any, and/or new functionalities of the newer version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_http_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "app_service_environment_internal_encryption_enabled" {
  title       = "App Service Environment should enable internal encryption"
  description = "Setting InternalEncryption to true encrypts the pagefile, worker disks, and internal network traffic between the front ends and workers in an App Service Environment."
  query       = query.app_service_environment_internal_encryption_enabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_java_version" {
  title       = "Ensure that 'Java version' is the latest, if used as a part of the Function app"
  description = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for Function apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_function_app_latest_java_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_latest_java_version" {
  title       = "Ensure that 'Java version' is the latest, if used as a part of the Web app"
  description = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_java_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_latest_php_version" {
  title       = "Ensure that 'PHP version' is the latest, if used as a part of the WEB app"
  description = "Periodically, newer versions are released for PHP software either due to security flaws or to include additional functionality. Using the latest PHP version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_php_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_function_app_latest_python_version" {
  title       = "Ensure that 'Python version' is the latest, if used as a part of the Function app"
  description = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for Function apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_function_app_latest_python_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_latest_python_version" {
  title       = "Ensure that 'Python version' is the latest, if used as a part of the Web app"
  description = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_python_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_latest_dotnet_framework_version" {
  title       = "Web app should use the latest 'Net Framework' version"
  description = "Periodically, newer versions are released for Net Framework software either due to security flaws or to include additional functionality. Using the latest Net Framework for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version."
  query       = query.appservice_web_app_latest_dotnet_framework_version

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_failed_request_tracing_enabled" {
  title       = "Web app failed request tracing should be enabled"
  description = "Ensure that Web app enables failed request tracing. This control is non-compliant if Web app failed request tracing is disabled."
  query       = query.appservice_web_app_failed_request_tracing_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_http_logs_enabled" {
  title       = "Web app HTTP logs should be enabled"
  description = "Ensure that Web app HTTP logs is enabled. This control is non-compliant if Web app HTTP logs is disabled."
  query       = query.appservice_web_app_http_logs_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_worker_more_than_one" {
  title       = "Web app should have more than one worker"
  description = "It is recommended to have more than one worker for failover. This control is non-compliant if Web apps have one or less than one worker."
  query       = query.appservice_web_app_worker_more_than_one

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_slot_use_https" {
  title       = "Web app slot should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  query       = query.appservice_web_app_slot_use_https

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_always_on" {
  title       = "Web apps should be configured to always be on"
  description = "This control ensures that a web app is configured with settings to keep it consistently active. Always On feature of Azure App Service, keeps the host process running. This allows your site to be more responsive to requests after significant idle periods."
  query       = query.appservice_web_app_always_on

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_plan_minimum_sku" {
  title       = "Appservice plan should not use free, shared or basic SKU"
  description = "The Free, Shared, and Basic plans are suitable for constrained testing and development purposes. This control is considered non-compliant when free, shared, or basic SKUs are utilized."
  query       = query.appservice_plan_minimum_sku

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_health_check_enabled" {
  title       = "Web apps should have health check enabled"
  description = "Health check increases your application's availability by rerouting requests away from unhealthy instances and replacing instances if they remain unhealthy."
  query       = query.appservice_web_app_health_check_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_incoming_client_cert_on" {
  title       = "Ensure the web app has 'Client Certificates (Incoming client certificates)' set to 'On'"
  description = "Client certificates allow for the app to request a certificate for incoming requests. Only clients that have a valid certificate will be able to reach the app."
  query       = query.appservice_web_app_incoming_client_cert_on

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_authentication_enabled" {
  title       = "Ensure App Service authentication is set up for apps in Azure App Service"
  description = "Azure App Service authentication is a feature that can prevent anonymous HTTP requests from reaching a Web Application or authenticate those with tokens before they reach the app. If an anonymous request is received from a browser, App Service will redirect to a logon page. To handle the logon process, a choice from a set of identity providers can be made, or a custom authentication mechanism can be implemented."
  query       = query.appservice_authentication_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_ftp_deployment_disabled" {
  title       = "Ensure FTP deployments are Disabled"
  description = "By default, Azure Functions, Web, and API Services can be deployed over FTP. If FTP is required for an essential deployment workflow, FTPS should be required for FTP login for all App Service Apps and Functions."
  query       = query.appservice_ftp_deployment_disabled

  tags = local.regulatory_compliance_appservice_common_tags
}

control "appservice_web_app_register_with_active_directory_enabled" {
  title       = "Ensure that Register with Azure Active Directory is enabled on App Service"
  description = "Managed service identity in App Service provides more security by eliminating secrets from the app, such as credentials in the connection strings. When registering with Azure Active Directory in App Service, the app will connect to other Azure services securely without the need for usernames and passwords."
  query       = query.appservice_web_app_register_with_active_directory_enabled

  tags = local.regulatory_compliance_appservice_common_tags
}

query "appservice_web_app_use_https" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when not https_only then 'alarm'
        else 'ok'
      end as status,
      case
        when not https_only then name || ' does not redirect all HTTP traffic to HTTPS.'
        else name || ' redirects all HTTP traffic to HTTPS.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_web_app_incoming_client_cert_on" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when not client_cert_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not client_cert_enabled then name || ' incoming client certificates set to off.'
        else name || ' incoming client certificates set to on.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_web_app_remote_debugging_disabled" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when kind = 'api' then 'skip'
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when kind = 'api' then name || ' is of ' || kind || ' type.'
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then name || ' remote debugging disabled.'
        else name || ' remote debugging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_function_app_remote_debugging_disabled" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then name || ' remote debugging disabled.'
        else name || ' remote debugging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_function_app_latest_tls_version" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then 'alarm'
        else 'ok'
      end as status,
      case
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then name || ' not using the latest version of TLS encryption.'
        else name || ' using the latest version of TLS encryption.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_web_app_latest_tls_version" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then 'alarm'
        else 'ok'
      end as status,
      case
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then name || ' not using the latest version of TLS encryption.'
        else name || ' using the latest version of TLS encryption.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_function_app_only_https_accessible" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when https_only then 'ok'
        else 'alarm'
      end as status,
      case
        when https_only then name || ' https-only accessible enabled.'
        else name || ' https-only accessible disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_web_app_use_virtual_service_endpoint" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when vnet_connection -> 'properties' -> 'vnetResourceId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when vnet_connection -> 'properties' -> 'vnetResourceId' is not null then a.name || ' configured with virtual network service endpoint.'
        else a.name || ' not configured with virtual network service endpoint.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_api_app_use_https" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when not https_only then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when not https_only then a.name || ' does not redirect all HTTP traffic to HTTPS.'
        else a.name || ' redirects all HTTP traffic to HTTPS.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_api_app_remote_debugging_disabled" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when kind <> 'api' then 'skip'
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when kind <> 'api' then name || ' is of ' || kind || ' type.'
        when configuration -> 'properties' ->> 'remoteDebuggingEnabled' = 'false' then name || ' remote debugging disabled.'
        else name || ' remote debugging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_api_app_latest_tls_version" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'minTlsVersion' < '1.2' then a.name || ' not using the latest version of TLS encryption.'
        else a.name || ' using the latest version of TLS encryption.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_diagnostic_logs_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when (a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool
          and (a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool
          and (a.configuration-> 'properties' -> 'requestTracingEnabled')::bool
        then 'ok'
        else 'alarm'
      end as status,
      case
        when (a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool
          and (a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool
          and (a.configuration-> 'properties' -> 'requestTracingEnabled')::bool
          then a.name || ' diagnostic logs enabled.'
        else a.title || ' diagnostic logs disabled.'
          -- concat_ws(', ',
          -- case when not ((a.configuration-> 'properties' -> 'detailedErrorLoggingEnabled')::bool) then 'detailed_Error_Logging_Enabled' end,
          -- case when not ((a.configuration -> 'properties' -> 'httpLoggingEnabled')::bool) then 'http_logging_enabled' end,
          -- case when not ((a.configuration-> 'properties' -> 'requestTracingEnabled')::bool) then 'request_tracing_enabled' end
          -- ) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_cors_no_star" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
        else 'ok'
      end as status,
      case
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]'
          then a.name || ' CORS allow all domains to access the application.'
        else a.name || ' CORS does not all domains to access the application.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_cors_no_star" {
  sql = <<-EOQ
    select
      b.id as resource,
      case
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
        else 'ok'
      end as status,
      case
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]'
          then b.name || ' CORS allow all domains to access the application.'
        else b.name || ' CORS does not all domains to access the application.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as b,
      azure_subscription as sub
    where
      sub.subscription_id = b.subscription_id;
  EOQ
}

query "appservice_api_app_cors_no_star" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' -> 'cors' -> 'allowedOrigins' @> '["*"]' then a.name || ' CORS allow all domains to access the application.'
        else a.name || ' CORS does not all domains to access the application.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_uses_managed_identity" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null
          then a.name || ' uses managed identity.'
        else a.name || ' not uses managed identity'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_api_app_uses_managed_identity" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null
          then a.name || ' uses managed identity.'
        else a.name || ' not uses managed identity'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_uses_managed_identity" {
  sql = <<-EOQ
    with all_function_app as (
      select
        id
      from
        azure_app_service_function_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'functionapp%'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when
          configuration -> 'properties' ->> 'xManagedServiceIdentityId' is not null
          or configuration -> 'properties' ->> 'managedServiceIdentityId' is not null
          then a.name || ' uses managed identity.'
        else a.name || ' not uses managed identity'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as a
      left join all_function_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_api_app_client_certificates_on" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when client_cert_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when client_cert_enabled then a.name || ' client certificate enabled.'
        else a.name || ' client certificate disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_client_certificates_on" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when client_cert_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when client_cert_enabled then a.name || ' client certificate enabled.'
        else a.name || ' client certificate disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_client_certificates_on" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when client_cert_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when client_cert_enabled then app.name || ' client certificate enabled.'
        else app.name || ' client certificate disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_api_app_ftps_enabled" {
  sql = <<-EOQ
    with all_api_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like '%api'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then a.name || ' FTPS disabled.'
        else a.name || ' FTPS enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_api_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_ftps_enabled" {
  sql = <<-EOQ
    with all_function_app as (
      select
        id
      from
        azure_app_service_function_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'functionapp%'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then a.name || ' FTPS disabled.'
        else a.name || ' FTPS enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as a
      left join all_function_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_ftps_enabled" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
      )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
        else 'ok'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then a.name || ' FTPS disabled.'
        else a.name || ' FTPS enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_latest_http_version" {
  sql = <<-EOQ
    with all_function_app as (
      select
        id
      from
        azure_app_service_function_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'functionapp%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'http20Enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is not a linux function app.'
        when configuration -> 'properties' ->> 'http20Enabled' = 'true' then a.name || ' using the latest HTTP version.'
        else a.name || ' not using latest HTTP version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as a
      left join all_function_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_latest_http_version" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when not (configuration -> 'properties' ->> 'http20Enabled') :: boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when not (configuration -> 'properties' ->> 'http20Enabled') :: boolean then name || ' HTTP version not latest.'
        else name || ' HTTP version is latest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "app_service_environment_internal_encryption_enabled" {
  sql = <<-EOQ
    with app_service_environment as (
      select
        distinct id as id
      from
        azure_app_service_environment,
        jsonb_array_elements(cluster_settings ) as s
      where
        s ->> 'name' = 'InternalEncryption'
        and s ->> 'value' = 'true'
    )
    select
      a.id as resource,
      case
        when b.id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is not null then a.title || ' internal encryption enabled.'
        else a.name || ' internal encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_environment as a
      left join app_service_environment as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_latest_java_version" {
  sql = <<-EOQ
    with all_function_app as (
      select
        id
      from
        azure_app_service_function_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'functionapp%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'Java%' then 'ok'
        when configuration -> 'properties' ->> 'linuxFxVersion' like '%11' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is not of linux kind.'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'Java%' then a.name || ' not using JAVA version.'
        when configuration -> 'properties' ->> 'linuxFxVersion' like '%11' then a.name || ' using the latest JAVA version.'
        else a.name || ' not using latest JAVA version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as a
      left join all_function_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_latest_java_version" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'JAVA%' then 'ok'
        when configuration -> 'properties' ->> 'linuxFxVersion' like '%11' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'JAVA%' then a.name ||  ' not using JAVA version.'
        when configuration -> 'properties' ->> 'linuxFxVersion' like '%11' then a.name || ' using the latest JAVA version.'
        else a.name || ' not using latest JAVA version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_latest_php_version" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PHP%' then 'ok'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'PHP|8.0' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PHP%' then a.name ||  ' not using php version.'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'PHP|8.0' then a.name || ' using the latest php version.'
        else a.name || ' not using latest php version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_function_app_latest_python_version" {
  sql = <<-EOQ
    with all_function_app as (
      select
        id
      from
        azure_app_service_function_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'functionapp%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'Python%' then 'ok'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'Python|3.9' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is ' || a.kind || ' kind.'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'Python%' then a.name || ' not using python version.'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'Python|3.9' then a.name || ' using the latest python version.'
        else a.name || ' not using latest python version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_function_app as a
      left join all_function_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_latest_python_version" {
  sql = <<-EOQ
    with all_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem like 'app%'
        )
        and
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null then 'skip'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PYTHON%' then 'ok'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'PYTHON|3.9' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null then a.title || ' is not of linux kind.'
        when configuration -> 'properties' ->> 'linuxFxVersion' not like 'PYTHON%' then a.name ||  ' not using python version.'
        when configuration -> 'properties' ->> 'linuxFxVersion' = 'PYTHON|3.9' then a.name || ' using the latest python version.'
        else a.name || ' not using latest python version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

# Non-Config rule query

query "appservice_authentication_enabled" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when not (auth_settings -> 'properties' ->> 'enabled') :: boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when not (auth_settings -> 'properties' ->> 'enabled') :: boolean then name || ' authentication not set.'
        else name || ' authentication set.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_ftp_deployment_disabled" {
  sql = <<-EOQ
    select
        fa.id as resource,
        case
          when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
          else 'ok'
        end as status,
        case
          when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then name || ' FTP deployments enabled.'
          else name || ' FTP deployments disabled.'
        end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "fa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_app_service_function_app fa,
        azure_subscription sub
      where
        sub.subscription_id = fa.subscription_id
    union
      select
        wa.id as resource,
        case
          when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then 'alarm'
          else 'ok'
        end as status,
        case
          when configuration -> 'properties' ->> 'ftpsState' = 'AllAllowed' then name || ' FTP deployments enabled.'
          else name || ' FTP deployments disabled.'
        end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "wa.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
      from
        azure_app_service_web_app as wa,
        azure_subscription as sub
      where
        sub.subscription_id = wa.subscription_id;
  EOQ
}

query "appservice_web_app_register_with_active_directory_enabled" {
  sql = <<-EOQ
    select
      app.id as resource,
      case
        when identity = '{}' then 'alarm'
        else 'ok'
      end as status,
      case
        when identity = '{}' then name || ' register with azure active directory disabled.'
        else name || ' register with azure active directory enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "app.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as app,
      azure_subscription as sub
    where
      sub.subscription_id = app.subscription_id;
  EOQ
}

query "appservice_web_app_latest_dotnet_framework_version" {
  sql = <<-EOQ
    with all_linux_web_app as (
      select
        id
      from
        azure_app_service_web_app
      where
        exists (
          select
          from
            unnest(regexp_split_to_array(kind, ',')) elem
          where
            elem = 'linux'
        )
    )
    select
      a.id as resource,
      case
        when b.id is null and configuration -> 'properties' ->> 'netFrameworkVersion' in ('v6.0', 'v7.0') then 'ok'
        when b.id is not null and configuration -> 'properties' ->> 'linuxFxVersion' not like 'DOTNETCORE|%' then 'ok'
        when b.id is not null and configuration -> 'properties' ->> 'linuxFxVersion' in ('DOTNETCORE|6.0', 'DOTNETCORE|7.0') then 'ok'
        else 'alarm'
      end as status,
      case
        when b.id is null and configuration -> 'properties' ->> 'netFrameworkVersion' in ('v6.0', 'v7.0') then a.name || ' using latest dotnet framework version.'
        when b.id is not null and configuration -> 'properties' ->> 'linuxFxVersion' not like 'DOTNETCORE|%' then a.name || ' not using dotnet framework.'
        when b.id is not null and configuration -> 'properties' ->> 'linuxFxVersion' in ('DOTNETCORE|6.0', 'DOTNETCORE|7.0') then a.name || ' using latest dotnet vframework ersion.'
        else a.name || ' not using latest dotnet framework version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a
      left join all_linux_web_app as b on a.id = b.id,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_failed_request_tracing_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when diagnostic_logs_configuration -> 'properties' -> 'failedRequestsTracing' ->> 'enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when diagnostic_logs_configuration -> 'properties' -> 'failedRequestsTracing' ->> 'enabled' = 'true' then a.name || ' failed requests tracing enabled.'
        else a.name || ' failed requests tracing disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_http_logs_enabled" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when configuration -> 'properties' ->> 'httpLoggingEnabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when configuration -> 'properties' ->> 'httpLoggingEnabled' = 'true' then a.name || ' HTTP logs enabled.'
        else a.name || ' HTTP logs disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_worker_more_than_one" {
  sql = <<-EOQ
    select
      p ->> 'ID' as resource,
      case
        when (p -> 'SiteProperties' -> 'siteConfig' ->> 'numberOfWorkers')::int > 1 then 'ok'
        else 'alarm'
      end as status,
        a.name || ' has ' || (p -> 'SiteProperties' -> 'siteConfig' ->> 'numberOfWorkers') || ' no of worker(s).' as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_plan as a,
      jsonb_array_elements(apps) as p,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_slot_use_https" {
  sql = <<-EOQ
    select
      s.id as resource,
      case
        when https_only then 'ok'
        else 'alarm'
      end as status,
      case
        when https_only then name || ' https-only accessible enabled.'
        else name || ' https-only accessible disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app_slot as s,
      azure_subscription as sub
    where
      sub.subscription_id = s.subscription_id;
  EOQ
}

query "appservice_web_app_always_on" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        when configuration -> 'properties' ->> 'alwaysOn' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when configuration -> 'properties' ->> 'alwaysOn' = 'true' then a.name || ' alwaysOn is enabled.'
        else a.name || ' alwaysOn is disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_plan_minimum_sku" {
  sql = <<-EOQ
    select
      a.id as resource,
      case
        -- The below basic plans are used for development and testing purposes.
        when sku_name in ('F1', 'D1', 'B1', 'B2', 'B3') then 'alarm'
        else 'ok'
      end as status,
      a.name || ' is of ' || sku_family || ' SKU family.'  as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_plan as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}

query "appservice_web_app_health_check_enabled" {
  sql = <<-EOQ
   select
      a.id as resource,
      case
        when configuration -> 'properties' ->> 'healthCheckPath' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when configuration -> 'properties' ->> 'healthCheckPath' is not null then a.name || ' health check enabled.'
        else a.name || ' health check disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_app_service_web_app as a,
      azure_subscription as sub
    where
      sub.subscription_id = a.subscription_id;
  EOQ
}
