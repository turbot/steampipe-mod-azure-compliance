locals {
  cis_v130_9_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_v130_9" {
  title         = "9 AppService"
  documentation = file("./cis_v130/docs/cis_v130_9.md")
  tags          = local.cis_v130_9_common_tags
  children = [
    control.cis_v130_9_1
  ]
}

control "cis_v130_9_1" {
  title       = "9.1 Ensure App Service Authentication is set on Azure App Service"
  description = "Azure App Service Authentication is a feature that can prevent anonymous HTTP requests from reaching the API app, or authenticate those that have tokens before they reach the API app. If an anonymous request is received from a browser, App Service will redirect to a logon page. To handle the logon process, a choice from a set of identity providers can be made, or a custom authentication mechanism can be implemented."
  sql         = query.appservice_authentication_enabled.sql
  # documentation = file("./cis_v130/docs/cis_v130_9_1.md")

  tags = merge(local.cis_v130_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "2"
    cis_type    = "automated"
  })
}

control "cis_v130_9_2" {
  title       = "9.2 Ensure web app redirects all HTTP traffic to HTTPS in Azure App Service"
  description = "Azure Web Apps allows sites to run under both HTTP and HTTPS by default. Web apps can be accessed by anyone using non-secure HTTP links by default. Non-secure HTTP requests can be restricted and all HTTP requests redirected to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic."
  sql         = query.appservice_web_app_use_https.sql
  # documentation = file("./cis_v130/docs/cis_v130_9_2.md")

  tags = merge(local.cis_v130_9_common_tags, {
    cis_item_id = "9.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_9_3" {
  title       = "9.3 Ensure web app is using the latest version of TLS encryption"
  description = "The TLS(Transport Layer Security) protocol secures transmission of data over the internet using standard encryption technology. Encryption should be set with the latest version of TLS. App service allows TLS 1.2 by default, which is the recommended TLS level by industry standards, such as PCI DSS."
  sql         = query.appservice_web_app_latest_tls_version.sql
  # documentation = file("./cis_v130/docs/cis_v130_9_3.md")

  tags = merge(local.cis_v130_9_common_tags, {
    cis_item_id = "9.3"
    cis_level   = "1"
    cis_type    = "automated"
  })
}
