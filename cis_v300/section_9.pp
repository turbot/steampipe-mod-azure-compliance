locals {
  cis_v300_9_common_tags = merge(local.cis_v300_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_v300_9" {
  title         = "9 AppService"
  documentation = file("./cis_v300/docs/cis_v300_9.md")
  children = [
    control.cis_v300_9_1,
    control.cis_v300_9_2,
    control.cis_v300_9_3,
    control.cis_v300_9_4,
    control.cis_v300_9_5,
    control.cis_v300_9_6,
    control.cis_v300_9_7,
    control.cis_v300_9_8,
    control.cis_v300_9_9,
    control.cis_v300_9_10,
    control.cis_v300_9_11,
    control.cis_v300_9_12
  ]

  tags = merge(local.cis_v300_9_common_tags, {
    type    = "Benchmark"
    service = "Azure/AppService"
  })
}

control "cis_v300_9_1" {
  title         = "9.1 Ensure 'HTTPS Only' is set to `On`"
  description   = "Azure App Service allows apps to run under both HTTP and HTTPS by default. Apps can be accessed by anyone using non-secure HTTP links by default. Non-secure HTTP requests can be restricted and all HTTP requests redirected to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic."
  query         = query.appservice_web_app_use_https
  documentation = file("./cis_v300/docs/cis_v300_9_1.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_2" {
  title         = "9.2 Ensure App Service Authentication is set up for apps in Azure App Service"
  description   = "Azure App Service Authentication is a feature that can prevent anonymous HTTP requests from reaching a Web Application or authenticate those with tokens before they reach the app. If an anonymous request is received from a browser, App Service will redirect to a logon page. To handle the logon process, a choice from a set of identity providers can be made, or a custom authentication mechanism can be implemented."
  query         = query.appservice_authentication_enabled
  documentation = file("./cis_v300/docs/cis_v300_9_2.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.2"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_3" {
  title         = "9.3 Ensure 'FTP State' is set to 'FTPS Only' or 'Disabled'"
  description   = "By default, App Services can be deployed over FTP. If FTP is required for an essential deployment workflow, FTPS should be required for FTP login for all App Services. If FTPS is not expressly required for the App, the recommended setting is Disabled."
  query         = query.appservice_ftp_deployment_disabled
  documentation = file("./cis_v300/docs/cis_v300_9_3.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_4" {
  title         = "9.4 Ensure Web App is using the latest version of TLS encryption"
  description   = "The TLS (Transport Layer Security) protocol secures transmission of data over the internet using standard encryption technology. Encryption should be set with the latest version of TLS. App service allows TLS 1.2 by default, which is the recommended TLS level by industry standards such as PCI DSS."
  query         = query.appservice_web_app_latest_tls_version
  documentation = file("./cis_v300/docs/cis_v300_9_4.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_5" {
  title         = "9.5 Ensure that Register with Entra ID is enabled on App Service"
  description   = "Managed service identity in App Service provides more security by eliminating secrets from the app, such as credentials in the connection strings. When registering an App Service with Entra ID, the app will connect to other Azure services securely without the need for usernames and passwords."
  query         = query.appservice_web_app_register_with_active_directory_enabled
  documentation = file("./cis_v300/docs/cis_v300_9_5.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_6" {
  title         = "9.6 Ensure that 'Basic Authentication' is 'Disabled'"
  description   = "Basic Authentication provides the ability to create identities and authentication for an App Service without a centralized Identity Provider. For a more effective, capable, and secure solution for Identity, Authentication, Authorization, and Accountability, a centralized Identity Provider such as Entra ID is strongly advised."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_9_6.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_7" {
  title         = "9.7 Ensure that 'PHP version' is currently supported (if in use)"
  description   = "Periodically, older versions of PHP may be deprecated and no longer supported. Using a supported version of PHP for app services is recommended to avoid potential unpatched vulnerabilities."
  query         = query.appservice_web_app_latest_php_version
  documentation = file("./cis_v300/docs/cis_v300_9_7.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_8" {
  title         = "9.8 Ensure that 'Python version' is currently supported (if in use)"
  description   = "Periodically, older versions of Python may be deprecated and no longer supported. Using a supported version of Python for app services is recommended to avoid potential unpatched vulnerabilities."
  query         = query.appservice_web_app_latest_python_version
  documentation = file("./cis_v300/docs/cis_v300_9_8.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_9" {
  title         = "9.9 Ensure that 'Java version' is currently supported (if in use)"
  description   = "Periodically, newer versions are released for Java software either due to security flaws or to include additional functionality. Using the latest Java version for web apps is recommended in order to take advantage of security fixes, if any, and/or new functionalities of the newer version."
  query         = query.appservice_web_app_latest_java_version
  documentation = file("./cis_v300/docs/cis_v300_9_9.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_10" {
  title         = "9.10 Ensure that 'HTTP20enabled' is set to 'true' (if in use)"
  description   = "Periodically, newer versions are released for HTTP either due to security flaws or to include additional functionality. Using the latest HTTP version for apps to take advantage of security fixes, if any, and/or new functionalities of the newer version."
  query         = query.appservice_web_app_latest_http_version
  documentation = file("./cis_v300/docs/cis_v300_9_10.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_11" {
  title         = "9.11 Ensure Azure Key Vaults are Used to Store Secrets"
  description   = "Azure Key Vault will store multiple types of sensitive information such as encryption keys, certificate thumbprints, and Managed Identity Credentials. Access to these 'Secrets' can be controlled through granular permissions."
  query         = query.manual_control
  documentation = file("./cis_v300/docs/cis_v300_9_11.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}

control "cis_v300_9_12" {
  title         = "9.12 Ensure that 'Remote debugging' is set to 'Off'"
  description   = "Remote Debugging allows Azure App Service to be debugged in real-time directly on the Azure environment. When remote debugging is enabled, it opens a communication channel that could potentially be exploited by unauthorized users if not properly secured."
  query         = query.appservice_web_app_remote_debugging_disabled
  documentation = file("./cis_v300/docs/cis_v300_9_12.md")

  tags = merge(local.cis_v300_9_common_tags, {
    cis_item_id = "9.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/AppService"
  })
}