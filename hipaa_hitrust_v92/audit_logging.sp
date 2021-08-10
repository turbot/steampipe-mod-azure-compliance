benchmark "hipaa_hitrust_v92_audit_logging" {
  title         = "Audit Logging"
  children = [
    benchmark.hipaa_hitrust_v92_1211_09aa3system_4_09_aa,
    benchmark.hipaa_hitrust_v92_1209_09aa3system_2_09_aa,
    benchmark.hipaa_hitrust_v92_1202_09aa1system_1_09_aa,
    benchmark.hipaa_hitrust_v92_1203_09aa1system_2_09_aa,
    benchmark.hipaa_hitrust_v92_1204_09aa1system_3_09_aa
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1211_09aa3system_4_09_aa" {
  title         = "1211.09aa3System.4 - 09.aa"
  description   = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."
  children = [
    control.keyvault_logging_enabled,
    control.keyvault_managed_hms_logging_enabled,
    control.sql_server_auditing_on
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1209_09aa3system_2_09_aa" {
  title         = "1209.09aa3System.2 - 09.aa"
  description   = "The information system generates audit records containing the following detailed information: (i) filename accessed; (ii) program or command used to initiate the event; and (iii) source and destination addresses."
  children = [
    control.appservice_web_app_diagnostic_logs_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1202_09aa1system_1_09_aa" {
  title         = "1202.09aa1System.1 - 09.aa"
  description   = "A secure audit record is created for all activities on the system (create, read, update, delete) involving covered information."
  children = [
    control.datalake_store_account_logging_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1203_09aa1system_2_09_aa" {
  title         = "1203.09aa1System.2 - 09.aa"
  description   = "Audit records include the unique user ID, unique data subject ID, function performed, and date/time the event was performed."
  children = [
    control.logic_app_workflow_logging_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1204_09aa1system_3_09_aa" {
  title         = "1204.09aa1System.3 - 09.aa"
  description   = "The activities of privileged users (administrators, operators, etc.) include the success/failure of the event, time the event occurred, the account involved, the processes involved, and additional information about the event."
  children = [
    control.iot_hub_logging_enabled
  ]

  tags          = local.hipaa_hitrust_v92_common_tags
}