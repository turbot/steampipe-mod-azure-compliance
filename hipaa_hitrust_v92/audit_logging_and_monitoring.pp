benchmark "hipaa_hitrust_v92_audit_logging_and_monitoring" {
  title       = "12 Audit Logging & Monitoring"
  description = "Audit logging refers to the process of recording and tracking all system activities, such as user logins, data access, and modifications made to sensitive information. By implementing comprehensive audit logging, the website will maintain a detailed trail of events, enabling organizations to track and investigate any potential security breaches or unauthorized access. Furthermore, monitoring mechanisms will be put in place to actively observe and analyze system activities in real time. This includes the monitoring of network traffic, system logs, and user behaviour to detect any anomalous or suspicious activities promptly."
  children = [
    benchmark.hipaa_hitrust_v92_1202_09aa1system,
    benchmark.hipaa_hitrust_v92_1203_09aa1system,
    benchmark.hipaa_hitrust_v92_1204_09aa1system,
    benchmark.hipaa_hitrust_v92_1205_09aa2system,
    benchmark.hipaa_hitrust_v92_1207_09aa2system,
    benchmark.hipaa_hitrust_v92_1208_09aa3system,
    benchmark.hipaa_hitrust_v92_1209_09aa3system,
    benchmark.hipaa_hitrust_v92_1210_09aa3system,
    benchmark.hipaa_hitrust_v92_12100_09ab2system,
    benchmark.hipaa_hitrust_v92_12101_09ab1organizational,
    benchmark.hipaa_hitrust_v92_12102_09ab1organizational,
    benchmark.hipaa_hitrust_v92_1211_09aa3system,
    benchmark.hipaa_hitrust_v92_1212_09ab1system,
    benchmark.hipaa_hitrust_v92_1213_09ab2system,
    benchmark.hipaa_hitrust_v92_1214_09ab2system,
    benchmark.hipaa_hitrust_v92_1215_09ab2system,
    benchmark.hipaa_hitrust_v92_1216_09ab3system,
    benchmark.hipaa_hitrust_v92_1217_09ab3system,
    benchmark.hipaa_hitrust_v92_1219_09ab3system,
    benchmark.hipaa_hitrust_v92_1220_09ab3system,
    benchmark.hipaa_hitrust_v92_1229_09c1organizational,
    benchmark.hipaa_hitrust_v92_1230_09c2organizational,
    benchmark.hipaa_hitrust_v92_1232_09c3organizational,
    benchmark.hipaa_hitrust_v92_1270_09ad1system,
    benchmark.hipaa_hitrust_v92_1271_09ad1system,
    benchmark.hipaa_hitrust_v92_1277_09c2organizational
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1202_09aa1system" {
  title       = "1202.09aa1System.1-09.aa 09.10 Monitoring"
  description = "A secure audit record is created for all activities on the system (create, read, update, delete) involving covered information."
  children = [
    control.compute_vm_scale_set_system_updates_installed,
    control.datalake_store_account_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1203_09aa1system" {
  title       = "1203.09aa1System.2-09.aa 09.10 Monitoring"
  description = "Audit records include the unique user ID, unique data subject ID, function performed, and date/time the event was performed."
  children = [
    control.logic_app_workflow_logging_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Logic"
  })
}

benchmark "hipaa_hitrust_v92_1204_09aa1system" {
  title       = "1204.09aa1System.3-09.aa 09.10 Monitoring"
  description = "The activities of privileged users (administrators, operators, etc.) include the success/failure of the event, time the event occurred, the account involved, the processes involved, and additional information about the event."
  children = [
    control.iot_hub_logging_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IoTHub"
  })
}

benchmark "hipaa_hitrust_v92_1205_09aa2system" {
  title       = "1205.09aa2System.1-09.aa 09.10 Monitoring"
  description = "Logs of messages sent and received are maintained including the date, time, origin and destination of the message, but not its contents."
  children = [
    control.batch_account_logging_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Batch"
  })
}

benchmark "hipaa_hitrust_v92_1207_09aa2system" {
  title       = "1207.09aa2System.4-09.aa 09.10 Monitoring"
  description = "Audit records are retained for 90 days and older audit records are archived for one year."
  children = [
    control.eventhub_namespace_logging_enabled,
    control.stream_analytics_job_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1208_09aa3system" {
  title       = "1208.09aa3System.1-09.aa 09.10 Monitoring"
  description = "Audit logs are maintained for management activities, system and application startup/shutdown/errors, file changes, and security policy changes."
  children = [
    control.search_service_logging_enabled,
    control.servicebus_namespace_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1209_09aa3system" {
  title       = "1209.09aa3System.2-09.aa 09.10 Monitoring"
  description = "The information system generates audit records containing the following detailed information: filename accessed, program or command used to initiate the event and source and destination addresses."
  children = [
    control.appservice_web_app_diagnostic_logs_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/AppService"
  })

}

benchmark "hipaa_hitrust_v92_1210_09aa3system" {
  title       = "1210.09aa3System.3-09.aa 09.10 Monitoring"
  description = "All disclosures of covered information within or outside of the organization are logged including type of disclosure, date/time of the event, recipient, and sender."
  children = [
    control.audit_diagnostic_setting,
    control.datalake_analytics_account_logging_enabled
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_12100_09ab2system" {
  title       = "12100.09ab2System.15-09.ab 09.10 Monitoring"
  description = "The organization monitors the information system to identify irregularities or anomalies that are indicators of a system malfunction or compromise and help confirm the system is functioning in an optimal, resilient and secure state."
  children = [
    control.compute_vm_log_analytics_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_12101_09ab1organizational" {
  title       = "12101.09ab1Organizational.3-09.ab 09.10 Monitoring"
  description = "The organization specifies how often audit logs are reviewed, how the reviews are documented, and the specific roles and responsibilities of the personnel conducting the reviews, including the professional certifications or other qualifications required."
  children = [
    control.compute_vm_scale_set_log_analytics_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_12102_09ab1organizational" {
  title       = "12102.09ab1Organizational.4-09.ab 09.10 Monitoring"
  description = "The organization shall periodically test its monitoring and detection processes, remediate deficiencies, and improve its processes."
  children = [
    control.compute_vm_log_analytics_agent_installed_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1211_09aa3system" {
  title       = "1211.09aa3System.4-09.aa 09.10 Monitoring"
  description = "The organization verifies every ninety (90) days for each extract of covered information recorded that the data is erased or its use is still required."
  children = [
    control.keyvault_logging_enabled,
    control.keyvault_managed_hms_logging_enabled,
    control.sql_server_auditing_on
  ]

  tags = local.hipaa_hitrust_v92_common_tags
}

benchmark "hipaa_hitrust_v92_1212_09ab1system" {
  title       = "1212.09ab1System.1-09.ab 09.10 Monitoring"
  description = "All applicable legal requirements related to monitoring authorized access and unauthorized access attempts are met."
  children = [
    control.monitor_log_profile_enabled_for_all_categories
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1213_09ab2system" {
  title       = "1213.09ab2System.128-09.ab 09.10 Monitoring"
  description = "Automated systems deployed throughout the organization's environment are used to monitor key events and anomalous activity, and analyze system logs, the results of which are reviewed regularly."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/SecurityCenter"
  })
}

benchmark "hipaa_hitrust_v92_1214_09ab2system" {
  title       = "1214.09ab2System.3456-09.ab 09.10 Monitoring"
  description = "Monitoring includes privileged operations, authorized access or unauthorized access attempts, including attempts to access deactivated accounts, and system alerts or failures."
  children = [
    control.monitor_log_profile_enabled_for_all_regions
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1215_09ab2system" {
  title       = "1215.09ab2System.7-09.ab 09.10 Monitoring"
  description = "Auditing and monitoring systems employed by the organization support audit reduction and report generation."
  children = [
    control.compute_vm_log_analytics_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1216_09ab3system" {
  title       = "1216.09ab3System.12-09.ab 09.10 Monitoring"
  description = "Automated systems are used to review monitoring activities of security systems (e.g., IPS/IDS) and system records on a daily basis, and identify and document anomalies."
  children = [
    control.compute_vm_scale_set_log_analytics_agent_installed
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1217_09ab3system" {
  title       = "1217.09ab3System.3-09.ab 09.10 Monitoring"
  description = "Alerts are generated for technical personnel to analyze and investigate suspicious activity or suspected violations."
  children = [
    control.compute_vm_log_analytics_agent_installed_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}

benchmark "hipaa_hitrust_v92_1219_09ab3system" {
  title       = "1219.09ab3System.10-09.ab 09.10 Monitoring"
  description = "The information system is able to automatically process audit records for events of interest based on selectable criteria."
  children = [
    control.monitor_log_profile_enabled_for_all_categories
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1220_09ab3system" {
  title       = "1220.09ab3System.56-09.ab 09.10 Monitoring"
  description = "Monitoring includes inbound and outbound communications and file integrity monitoring."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/SecurityCenter"
  })
}

benchmark "hipaa_hitrust_v92_1229_09c1organizational" {
  title       = "1229.09c1Organizational.1-09.c 09.01 Documented Operating Procedures"
  description = "Separation of duties is used to limit the risk of unauthorized or unintentional modification of information and systems."
  children = [
    control.kubernetes_instance_rbac_enabled
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/KubernetesService"
  })
}

benchmark "hipaa_hitrust_v92_1230_09c2organizational" {
  title       = "1230.09c2Organizational.1-09.c 09.01 Documented Operating Procedures"
  description = "No single person is able to access, modify, or use information systems without authorization or detection."
  children = [
    control.iam_no_custom_role
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/IAM"
  })
}

benchmark "hipaa_hitrust_v92_1232_09c3organizational" {
  title       = "1232.09c3Organizational.12-09.c 09.01 Documented Operating Procedures"
  description = "Access for individuals responsible for administering access controls is limited to the minimum necessary based upon each user's role and responsibilities and these individuals cannot access audit functions related to these controls."
  children = [
    control.network_security_group_rdp_access_restricted
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Network"
  })
}

benchmark "hipaa_hitrust_v92_1270_09ad1system" {
  title       = "1270.09ad1System.12-09.ad 09.10 Monitoring"
  description = "The organization ensures proper logging is enabled in order to audit administrator activities; and reviews system administrator and operator logs on a regular basis."
  children = [
    control.monitor_log_alert_for_administrative_operations
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1271_09ad1system" {
  title       = "1271.09ad1System.1-09.ad 09.10 Monitoring"
  description = "An intrusion detection system managed outside of the control of system and network administrators is used to monitor system and network administration activities for compliance."
  children = [
    control.monitor_log_alert_for_administrative_operations
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Monitor"
  })
}

benchmark "hipaa_hitrust_v92_1277_09c2organizational" {
  title       = "1277.09c2Organizational.4-09.c 09.01 Documented Operating Procedures"
  description = "The initiation of an event is separated from its authorization to reduce the possibility of collusion."
  children = [
    control.compute_vm_meet_security_options_user_account_control_requirement_windows
  ]

  tags = merge(local.hipaa_hitrust_v92_common_tags, {
    service = "Azure/Compute"
  })
}
