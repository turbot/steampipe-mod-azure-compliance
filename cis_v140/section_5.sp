locals {
  cis_v140_5_common_tags = merge(local.cis_v140_common_tags, {
    cis_section_id = "5"
  })
}


locals {
  cis_v140_5_1_common_tags = merge(local.cis_v140_5_common_tags, {
    cis_section_id = "5.1"
  })
  cis_v140_5_2_common_tags = merge(local.cis_v140_5_common_tags, {
    cis_section_id = "5.2"
  })
}

benchmark "cis_v140_5" {
  title         = "5 Logging and Monitoring"
  documentation = file("./cis_v140/docs/cis_v140_5.md")
  children = [
    benchmark.cis_v140_5_1,
    benchmark.cis_v140_5_2,
    control.cis_v140_5_3
  ]

  tags = merge(local.cis_v140_5_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v140_5_1" {
  title         = "5.1 Configuring Diagnostic Settings"
  documentation = file("./cis_v140/docs/cis_v140_5_1.md")
  children = [
    control.cis_v140_5_1_1,
    control.cis_v140_5_1_2,
    control.cis_v140_5_1_3,
    control.cis_v140_5_1_4,
    control.cis_v140_5_1_5
  ]

  tags = merge(local.cis_v140_5_1_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v140_5_2" {
  title         = "5.2 Monitoring using Activity Log Alerts"
  documentation = file("./cis_v140/docs/cis_v140_5_2.md")
  children = [
    control.cis_v140_5_2_1,
    control.cis_v140_5_2_2,
    control.cis_v140_5_2_3,
    control.cis_v140_5_2_4,
    control.cis_v140_5_2_5,
    control.cis_v140_5_2_6,
    control.cis_v140_5_2_7,
    control.cis_v140_5_2_8,
    control.cis_v140_5_2_9
  ]

  tags = merge(local.cis_v140_5_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v140_5_1_1" {
  title         = "5.1.1 Ensure that a 'Diagnostics Setting' exists"
  description   = "Enable Diagnostic settings for exporting activity logs. Diagnostic setting are available for each individual resources within a subscription. Settings should be configured for all appropriate resources for your environment."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_5_1_1.md")

  tags = merge(local.cis_v140_5_1_common_tags, {
    cis_item_id = "5.1.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_1_2" {
  title         = "5.1.2 Ensure Diagnostic Setting captures appropriate categories"
  description   = "Enable Diagnostic settings for exporting activity logs. Diagnostic setting are available for each individual resources within a subscription. Settings should be configured for all appropriate resources for your environment."
  sql           = query.monitor_diagnostic_settings_captures_proper_categories.sql
  documentation = file("./cis_v140/docs/cis_v140_5_1_2.md")

  tags = merge(local.cis_v140_5_1_common_tags, {
    cis_item_id = "5.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_1_3" {
  title         = "5.1.3 Ensure the storage container storing the activity logs is not publicly accessible"
  description   = "The storage account container containing the activity log export should not be publicly accessible."
  sql           = query.monitor_logs_storage_container_not_public_accessible.sql
  documentation = file("./cis_v140/docs/cis_v140_5_1_3.md")

  tags = merge(local.cis_v140_5_1_common_tags, {
    cis_item_id = "5.1.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_1_4" {
  title         = "5.1.4 Ensure the storage account containing the container with activity logs is encrypted with BYOK (Use Your Own Key)"
  description   = "The storage account with the activity log export container is configured to use BYOK (Use Your Own Key)."
  sql           = query.monitor_logs_storage_container_encryptes_with_byok.sql
  documentation = file("./cis_v140/docs/cis_v140_5_1_4.md")

  tags = merge(local.cis_v140_5_1_common_tags, {
    cis_item_id = "5.1.4"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_1_5" {
  title         = "5.1.5 Ensure that logging for Azure KeyVault is 'Enabled'"
  description   = "Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available."
  sql           = query.keyvault_logging_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_5_1_5.md")

  tags = merge(local.cis_v140_5_1_common_tags, {
    cis_item_id = "5.1.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/KeyVault"
  })
}

control "cis_v140_5_2_1" {
  title         = "5.2.1 Ensure that Activity Log Alert exists for Create Policy Assignment"
  description   = "Create an activity log alert for the Create Policy Assignment event."
  sql           = query.monitor_log_alert_create_policy_assignment.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_1.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_2" {
  title         = "5.2.2 Ensure that Activity Log Alert exists for Delete Policy Assignment"
  description   = "Create an activity log alert for the Delete Policy Assignment event."
  sql           = query.monitor_log_alert_delete_policy_assignment.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_2.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_3" {
  title         = "5.2.3 Ensure that Activity Log Alert exists for Create or Update Network Security Group"
  description   = "Create an Activity Log Alert for the \"Create\" or \"Update Network Security Group\" event."
  sql           = query.monitor_log_alert_create_update_nsg.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_3.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_4" {
  title         = "5.2.4 Ensure that Activity Log Alert exists for Delete Network Security Group"
  description   = "Create an activity log alert for the Delete Network Security Group event."
  sql           = query.monitor_log_alert_delete_nsg.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_4.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_5" {
  title         = "5.2.5 Ensure that Activity Log Alert exists for Create or Update Network Security Group Rule"
  description   = "Create an activity log alert for the Create or Update Network Security Group Rule event."
  sql           = query.monitor_log_alert_create_update_nsg_rule.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_5.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_6" {
  title         = "5.2.6 Ensure that Activity Log Alert exists for Create or Update Network Security Group Rule"
  description   = "Create an activity log alert for the Create or Update Network Security Group Rule event."
  sql           = query.monitor_log_alert_delete_nsg_rule.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_6.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_7" {
  title         = "5.2.7 Ensure that Activity Log Alert exists for Create or Update Security Solution"
  description   = "Create an activity log alert for the Create or Update Security Solution event."
  sql           = query.monitor_log_alert_create_update_security_solution.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_7.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_8" {
  title         = "5.2.8 Ensure that Activity Log Alert exists for Delete Security Solution"
  description   = "Create an activity log alert for the Delete Security Solution event."
  sql           = query.monitor_log_alert_delete_security_solution.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_8.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_2_9" {
  title         = "5.2.9 Ensure that Activity Log Alert exists for Create or Update or Delete SQL Server Firewall Rule"
  description   = "Create an activity log alert for the Create or Update or Delete SQL Server Firewall Rule event."
  sql           = query.monitor_log_alert_sql_firewall_rule.sql
  documentation = file("./cis_v140/docs/cis_v140_5_2_9.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.2.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v140_5_3" {
  title         = "5.3 Ensure that Diagnostic Logs are enabled for all services which support it"
  description   = "Diagnostic Logs capture activity to the data access plane while the Activity log is a subscription-level log for the control plane. Resource-level diagnostic logs provide insight into operations that were performed within that resource itself. It is crucial that logging systems are correctly configured to log all relevant activities and retain those logs for a sufficient length of time."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_5_3.md")

  tags = merge(local.cis_v140_5_2_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}
