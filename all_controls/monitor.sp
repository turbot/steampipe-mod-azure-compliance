locals {
  all_controls_monitor_common_tags = merge(local.all_controls_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "all_controls_monitor" {
  title       = "Monitor"
  description = "This section contains recommendations for configuring Monitor resources."
  children = [
    control.application_insights_linked_to_log_analytics_workspace,
    control.log_profile_enabled_for_all_subscription,
    control.monitor_diagnostic_settings_captures_proper_categories,
    control.monitor_log_alert_create_policy_assignment,
    control.monitor_log_alert_create_update_nsg,
    control.monitor_log_alert_create_update_nsg_rule,
    control.monitor_log_alert_create_update_public_ip_address,
    control.monitor_log_alert_create_update_security_solution,
    control.monitor_log_alert_create_update_sql_servers_firewall_rule,
    control.monitor_log_alert_delete_nsg,
    control.monitor_log_alert_delete_nsg_rule,
    control.monitor_log_alert_delete_policy_assignment,
    control.monitor_log_alert_delete_public_ip_address,
    control.monitor_log_alert_delete_security_solution,
    control.monitor_log_alert_delete_sql_servers_firewall_rule,
    control.monitor_log_alert_for_administrative_operations,
    control.monitor_log_alert_sql_firewall_rule,
    control.monitor_log_profile_enabled_for_all_categories,
    control.monitor_log_profile_enabled_for_all_regions,
    control.monitor_log_profile_retention_365_days,
    control.monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok,
    control.monitor_logs_storage_container_insights_activity_logs_not_public_accessible,
    control.monitor_logs_storage_container_insights_operational_logs_encrypted_with_byok,
    control.monitor_logs_storage_container_insights_operational_logs_not_public_accessible
  ]

  tags = merge(local.all_controls_monitor_common_tags, {
    type = "Benchmark"
  })
}
