locals {
  regulatory_compliance_monitor_common_tags = {
    service = "monitor"
  }
}

control "monitor_log_profile_enabled_for_all_categories" {
  title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
  description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'."
  sql         = query.monitor_log_profile_enabled_for_all_categories.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_log_alert_for_administrative_operations" {
  title       = "An activity log alert should exist for specific Administrative operations"
  description = "This policy audits specific Administrative operations with no activity log alerts configured."
  sql         = query.monitor_log_alert_for_administrative_operations.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_log_profile_enabled_for_all_regions" {
  title       = "Azure Monitor should collect activity logs from all regions"
  description = "This policy audits the Azure Monitor log profile which does not export activities from all Azure supported regions including global."
  sql         = query.monitor_log_profile_enabled_for_all_regions.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "audit_diagnostic_setting" {
  title       = "Audit diagnostic setting"
  description = "Audit diagnostic setting for selected resource types."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}