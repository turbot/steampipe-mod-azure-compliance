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
