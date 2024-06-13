benchmark "rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs" {
  title = "Maintenance, Monitoring, And Analysis Of Audit Logs"
  children = [
    benchmark.rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16" {
  title = "Maintenance, Monitoring, And Analysis Of Audit Logs-16"
  children = [
    benchmark.rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_1,
    benchmark.rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_2,
    benchmark.rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_3
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_1" {
  title = "Maintenance, Monitoring, And Analysis Of Audit Logs-16.1"

  children = [
    control.monitor_log_profile_enabled_for_all_regions,
    control.network_sg_flowlog_enabled,
    control.network_watcher_flow_log_enabled,
    control.network_watcher_flow_log_traffic_analytics_enabled,
    control.postgres_db_server_log_duration_on
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_2" {
  title = "Maintenance, Monitoring, And Analysis Of Audit Logs-16.2"

  children = [
    control.arc_compute_machine_linux_log_analytics_agent_installed,
    control.arc_compute_machine_windows_log_analytics_agent_installed,
    control.log_profile_enabled_for_all_subscription,
    control.monitor_log_profile_enabled_for_all_categories
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}

benchmark "rbi_itf_nbfc_v2016_maintenance_monitoring_analysis_audit_logs_16_3" {
  title = "Maintenance, Monitoring, And Analysis Of Audit Logs-16.3"

  children = [
    control.compute_vm_network_traffic_data_collection_linux_agent_installed,
    control.compute_vm_network_traffic_data_collection_windows_agent_installed,
    control.compute_vm_scale_set_log_analytics_agent_installed,
    control.keyvault_logging_enabled,
    control.monitor_log_profile_enabled_for_all_regions
  ]

  tags = local.rbi_itf_nbfc_v2016_common_tags
}