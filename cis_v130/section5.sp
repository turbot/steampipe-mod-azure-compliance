locals {
  cis_v130_5_common_tags = merge(local.cis_v130_common_tags, {
    cis_section_id = "5"
  })
}


locals {
  cis_v130_5_1_common_tags = merge(local.cis_v130_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v130_5_2_common_tags = merge(local.cis_v130_5_common_tags, {
    cis_section_id = "5.2"
  })
}

benchmark "cis_v130_5" {
  title         = "5 Logging and Monitoring"
  documentation = file("./cis_v130/docs/cis_v130_5.md")
  tags          = local.cis_v130_5_common_tags
  children = [
    benchmark.cis_v130_5_1,
    benchmark.cis_v130_5_2
  ]
}

benchmark "cis_v130_5_1" {
  title         = "5.1 Configuring Diagnostic Settings"
  documentation = file("./cis_v130/docs/cis_v130_5_1.md")
  tags          = local.cis_v130_5_1_common_tags
  children = [
    control.cis_v130_5_1_2,
    control.cis_v130_5_1_3,
    control.cis_v130_5_1_4,
    control.cis_v130_5_1_5
  ]
}

benchmark "cis_v130_5_2" {
  title         = "5.2 Monitoring using Activity Log Alerts"
  documentation = file("./cis_v130/docs/cis_v130_5_2.md")
  tags          = local.cis_v130_5_2_common_tags
}

control "cis_v130_5_1_2" {
  title         = "5.1.2 Ensure Diagnostic Setting captures appropriate categories"
  description   = "Enable Diagnostic settings for exporting activity logs. Diagnostic setting are available for each individual resources within a subscription. Settings should be configured for all appropriate resources for your environment."
  sql           = query.monitor_diagnostic_settings_captures_proper_categories.sql
  documentation = file("./cis_v130/docs/cis_v130_5_1_2.md")

  tags = merge(local.cis_v130_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_5_1_3" {
  title         = "5.1.3 Ensure the storage container storing the activity logs is not publicly accessible"
  description   = "The storage account container containing the activity log export should not be publicly accessible."
  sql           = query.monitor_logs_storage_container_not_public_accessible.sql
  documentation = file("./cis_v130/docs/cis_v130_5_1_3.md")

  tags = merge(local.cis_v130_5_1_common_tags, {
    cis_item_id = "5.1.3"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v130_5_1_4" {
  title         = "5.1.4 Ensure the storage account containing the container with activity logs is encrypted with BYOK (Use Your Own Key)"
  description   = "The storage account with the activity log export container is configured to use BYOK (Use Your Own Key)."
  sql           = query.monitor_logs_storage_container_encryptes_with_byok.sql
  documentation = file("./cis_v130/docs/cis_v130_5_1_4.md")

  tags = merge(local.cis_v130_5_1_common_tags, {
    cis_item_id = "5.1.4"
    cis_level   = "2"
    cis_type    = "automated"
  })
}

control "cis_v130_5_1_5" {
  title         = "5.1.5 Ensure that logging for Azure KeyVault is 'Enabled'"
  description   = "Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available."
  sql           = query.keyvault_logging_enabled.sql
  documentation = file("./cis_v130/docs/cis_v130_5_1_5.md")

  tags = merge(local.cis_v130_5_1_common_tags, {
    cis_item_id = "5.1.5"
    cis_level   = "1"
    cis_type    = "automated"
  })
}
