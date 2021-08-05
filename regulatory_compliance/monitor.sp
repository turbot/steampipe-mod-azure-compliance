locals {
  conformance_pack_monitor_common_tags = {
    service = "monitor"
  }
}

control "monitor_log_profile_enabled_for_all_categories" {
  title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
  description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'."
  sql         = query.monitor_log_profile_enabled_for_all_categories.sql

  tags = merge(local.conformance_pack_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_log_alert_for_administrative_operations" {
  title       = "An activity log alert should exist for specific Administrative operations"
  description = "This policy audits specific Administrative operations with no activity log alerts configured."
  sql         = query.monitor_log_alert_for_administrative_operations.sql

  tags = merge(local.conformance_pack_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

