locals {
  soc_2_cc_7_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc7"
  })
}

benchmark "soc_2_cc_7" {
  title       = "CC7.0 - System Operations"
  description = "The criteria relevant to how an entity (i) manages the operation of system(s) and (ii) detects and mitigates processing deviations including logical and physical security deviations."

  children = [
    benchmark.soc_2_cc_7_1,
    benchmark.soc_2_cc_7_2,
    control.ad_manual_control,
    control.keyvault_logging_enabled,
    control.manual_control,
    control.monitor_diagnostic_settings_captures_proper_categories,
    control.monitor_log_alert_create_policy_assignment,
    control.monitor_log_alert_for_administrative_operations,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_atp_enabled,
    control.sql_server_auditing_on,
    control.sql_server_va_setting_periodic_scan_enabled,
    control.sql_server_va_setting_reports_notify_admins,
    control.sql_server_va_setting_scan_reports_configured,
    control.storage_account_blob_service_logging_enabled,
    control.storage_account_queue_services_logging_enabled

  ]

  tags = local.soc_2_cc_7_common_tags
}

benchmark "soc_2_cc_7_1" {
  title         = "CC7.1 To meet its objectives, the entity uses detection and monitoring procedures to identify (1) changes to configurations that result in the introduction of new vulnerabilities, and (2) susceptibilities to newly discovered vulnerabilities"
  documentation = file("./soc2/docs/cc_7_1.md")

  children = [
    control.ad_manual_control,
    control.manual_control,
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.sql_server_and_databases_va_enabled,
    control.sql_server_atp_enabled,
    control.sql_server_va_setting_periodic_scan_enabled,
    control.sql_server_va_setting_reports_notify_admins,
    control.sql_server_va_setting_scan_reports_configured,
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.1"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_7_2" {
  title         = "CC7.2 The entity monitors system components and the operation of those components for anomalies that are indicative of malicious acts, natural disasters, and errors affecting the entity's ability to meet its objectives; anomalies are analyzed to determine whether they represent security events"
  documentation = file("./soc2/docs/cc_7_2.md")

  children = [
   control.keyvault_logging_enabled,
   control.manual_control,
   control.monitor_diagnostic_settings_captures_proper_categories,
   control.monitor_log_alert_create_policy_assignment,
   control.monitor_log_alert_for_administrative_operations,
   control.sql_server_auditing_on,
   control.storage_account_blob_service_logging_enabled,
   control.storage_account_queue_services_logging_enabled,
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.2"
    soc_2_type    = "automated"
  })
}
