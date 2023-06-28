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

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
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

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_only_https_accessible" {
  title       = "Function App should only be accessible over HTTPS"
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
  title       = "App Service apps should only be accessible over HTTPS"
  description = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
  query       = query.appservice_api_app_use_https

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
    pci_dss_v321         = "true"
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
  title       = "CORS should not allow every resource to access your Web Applications"
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
  title       = "Managed identity should be used in your Web App"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_web_app_uses_managed_identity

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_api_app_uses_managed_identity" {
  title       = "Managed identity should be used in your API App"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_api_app_uses_managed_identity

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_uses_managed_identity" {
  title       = "Managed identity should be used in your Function App"
  description = "Use a managed identity for enhanced authentication security."
  query       = query.appservice_function_app_uses_managed_identity

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_azure_defender_enabled" {
  title       = "Azure Defender for App Service should be enabled"
  description = "Azure Defender for App Service leverages the scale of the cloud, and the visibility that Azure has as a cloud provider, to monitor for common web app attacks."
  query       = query.appservice_azure_defender_enabled

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
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
    hipaa_hitrust_v92    = "true"
    nist_sp_800_53_rev_5 = "true"
  })
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

control "appservice_web_app_ftps_enabled" {
  title       = "FTPS should be required in your Web App"
  description = "Enable FTPS enforcement for enhanced security."
  query       = query.appservice_web_app_ftps_enabled

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

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_java_version" {
  title       = "Ensure that 'Java version' is the latest, if used as a part of the Web app"
  description = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_java_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_php_version" {
  title       = "Ensure that 'PHP version' is the latest, if used as a part of the WEB app"
  description = "Periodically, newer versions are released for PHP software either due to security flaws or to include additional functionality. Using the latest PHP version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_php_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_function_app_latest_python_version" {
  title       = "Ensure that 'Python version' is the latest, if used as a part of the Function app"
  description = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for Function apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_function_app_latest_python_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
}

control "appservice_web_app_latest_python_version" {
  title       = "Ensure that 'Python version' is the latest, if used as a part of the Web app"
  description = "Periodically, newer versions are released for Python software either due to security flaws or to include additional functionality. Using the latest Python version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the latest version. Currently, this policy only applies to Linux web apps."
  query       = query.appservice_web_app_latest_python_version

  tags = merge(local.regulatory_compliance_appservice_common_tags, {
    nist_sp_800_53_rev_5 = "true"
  })
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

query "appservice_azure_defender_enabled" {
  sql = <<-EOQ
    select
      pricing.id as resource,
      case
        when name = 'AppServices' and pricing_tier = 'Standard' then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'AppServices' and pricing_tier = 'Standard' then 'AppServices azure defender enabled.'
        else name || 'AppServices azure defender disabled.'
      end as reason
      ${replace(local.common_dimensions_subscription_id_qualifier_sql, "__QUALIFIER__", "pricing.")}
      ${replace(local.common_dimensions_qualifier_subscription_sql, "__QUALIFIER__", "sub.")}
    from
      azure_security_center_subscription_pricing as pricing,
      azure_subscription as sub
    where
      sub.subscription_id = pricing.subscription_id
      and name = 'AppServices';
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