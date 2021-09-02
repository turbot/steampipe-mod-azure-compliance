benchmark "hipaa_hitrust_v92_audit_logging" {
  title    = "Audit Logging"
  children = [
    benchmark.hipaa_hitrust_v92_1202_09aa1system_1_09_aa,
    benchmark.hipaa_hitrust_v92_1203_09aa1system_2_09_aa,
    benchmark.hipaa_hitrust_v92_1204_09aa1system_3_09_aa,
    benchmark.hipaa_hitrust_v92_1205_09aa2system_1_09_aa,
    benchmark.hipaa_hitrust_v92_1206_09aa2system_23_09_aa,
    benchmark.hipaa_hitrust_v92_1207_09aa2system_4_09_aa,
    benchmark.hipaa_hitrust_v92_1208_09aa3system_1_09_aa,
    benchmark.hipaa_hitrust_v92_1209_09aa3system_2_09_aa,
    benchmark.hipaa_hitrust_v92_1210_09aa3system_3_09_aa,
    benchmark.hipaa_hitrust_v92_1211_09aa3system_4_09_aa
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1211_09aa3system_4_09_aa" {
  title    = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required"
  children = [
    control.keyvault_logging_enabled,
    control.keyvault_managed_hms_logging_enabled,
    control.sql_server_auditing_on
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1209_09aa3system_2_09_aa" {
  title       = "The information system generates audit records containing detailed information"
  description = "The information system generates audit records containing the following detailed information: filename accessed, program or command used to initiate the event and source and destination addresses."
  children = [
    control.appservice_web_app_diagnostic_logs_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1202_09aa1system_1_09_aa" {
  title    = "A secure audit record is created for all activities on the system (create, read, update, delete) involving covered information"
  children = [
    control.datalake_store_account_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1203_09aa1system_2_09_aa" {
  title    = "Audit records include the unique user ID, unique data subject ID, function performed, and date/time the event was performed"
  children = [
    control.logic_app_workflow_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1204_09aa1system_3_09_aa" {
  title    = "The activities of privileged users (administrators, operators, etc.) include the success/failure of the event, time the event occurred, the account involved, the processes involved, and additional information about the event"
  children = [
    control.iot_hub_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1205_09aa2system_1_09_aa" {
  title    = "Logs of messages sent and received are maintained including the date, time, origin and destination of the message, but not its contents"
  children = [
    control.batch_account_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1207_09aa2system_4_09_aa" {
  title    = "Audit records are retained for 90 days and older audit records are archived for one year"
  children = [
    control.eventhub_namespace_logging_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1208_09aa3system_1_09_aa" {
  title    = "Audit logs are maintained for management activities, system and application startup/shutdown/errors, file changes, and security policy changes"
  children = [
    control.search_service_logging_enabled,
    control.servicebus_namespace_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1210_09aa3system_3_09_aa" {
  title    = "All disclosures of covered information within or outside of the organization are logged including type of disclosure, date/time of the event, recipient, and sender"
  children = [
    control.datalake_analytics_account_logging_enabled,
    control.audit_diagnostic_setting
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1206_09aa2system_23_09_aa" {
  title       = "Auditing a system while it is active"
  description = "Auditing is always available while the system is active and tracks key events, success/failed data access, system security configuration changes, privileged or utility use, any alarms raised, activation and de-activation of protection systems (e.g., A/V and IDS), activation and deactivation of identification and authentication mechanisms, and creation and deletion of system-level objects."
  children    = [
    control.compute_vm_scale_set_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}
