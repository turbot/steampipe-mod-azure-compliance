benchmark "hipaa_hitrust_v92_administrator_and_operator_logs" {
  title    = "Administrator and Operator Logs"
  children = [
    benchmark.hipaa_hitrust_v92_1270_09ad1system_12_09_ad,
    benchmark.hipaa_hitrust_v92_1271_09ad1system_1_09_ad
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1270_09ad1system_12_09_ad" {
  title    = "The organization ensures proper logging is enabled in order to audit administrator activities; and reviews system administrator and operator logs on a regular basis"
  children = [
    control.monitor_log_alert_for_administrative_operations
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1271_09ad1system_1_09_ad" {
  title    = "An intrusion detection system managed outside of the control of system and network administrators is used to monitor system and network administration activities for compliance"
  children = [
    control.monitor_log_alert_for_administrative_operations
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}