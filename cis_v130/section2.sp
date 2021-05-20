locals {
  cis_v130_2_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "2"
  })
}

benchmark "cis_v130_2" {
  title         = "2 Security Center"
  documentation = file("./cis_v130/docs/cis_v130_2.md")
  tags          = local.cis_v130_2_common_tags
  children = [
    control.cis_v130_2_1,
    control.cis_v130_2_2,
    control.cis_v130_2_11,
    control.cis_v130_2_12
  ]
}



control "cis_v130_2_1" {
  title       = "2.1 Ensure that Azure Defender is set to On for Servers"
  description = "Turning on Azure Defender enables threat detection for Server, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql         = query.securitycenter_azure_defender_on_for_server.sql
  # documentation = file("./cis_v130/docs/cis_v130_2_1.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id  = "2.1"
    cis_type     = "manual"
    cis_level    = "2"
    cis_controls = "8"
  })
}

control "cis_v130_2_2" {
  title       = "2.1 Ensure that Azure Defender is set to On for App Service"
  description = "Turning on Azure Defender enables threat detection for App Service, providing threat intelligence, anomaly detection, and behavior analytics in the Azure Security Center."
  sql         = query.securitycenter_azure_defender_on_for_appservice.sql
  # documentation = file("./cis_v130/docs/cis_v130_2_2.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id  = "2.2"
    cis_type     = "manual"
    cis_level    = "2"
    cis_controls = "8"
  })
}

control "cis_v130_2_11" {
  title       = "2.11 Ensure that 'Automatic provisioning of monitoring agent' is set to 'On'"
  description = "Enable automatic provisioning of the monitoring agent to collect security data."
  sql         = query.securitycenter_automatic_provisioning_monitoring_agent_on.sql
  # documentation = file("./cis_v130/docs/cis_v130_2_11.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id  = "2.11"
    cis_type     = "automated"
    cis_level    = "1"
    cis_controls = "3.1"
  })
}

control "cis_v130_2_12" {
  title       = "2.12 Ensure any of the ASC Default policy setting is not set to \"Disabled\""
  description = "None of the settings offered by ASC Default policy should be set to effect \"Disabled\"."
  sql         = query.securitycenter_asc_default_setting_not_disabled.sql
  # documentation = file("./cis_v130/docs/cis_v130_2_11.md")

  tags = merge(local.cis_v130_2_common_tags, {
    cis_item_id  = "2.11"
    cis_type     = "automated"
    cis_level    = "1"
    cis_controls = "3.1"
  })
}
