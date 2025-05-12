benchmark "nist_csf_v2_rs" {
  title       = "Respond (RS)"
  description = "Actions regarding a detected cybersecurity incident are taken."
  children = [
    benchmark.nist_csf_v2_rs_ma,
    benchmark.nist_csf_v2_rs_an,
    benchmark.nist_csf_v2_rs_co,
    benchmark.nist_csf_v2_rs_mi
  ]
}

# Incident Management (RS.MA)
benchmark "nist_csf_v2_rs_ma" {
  title       = "Incident Management (RS.MA)"
  description = "Responses to detected cybersecurity incidents are managed."
  children = [
    benchmark.nist_csf_v2_rs_ma_01,
    benchmark.nist_csf_v2_rs_ma_02,
    benchmark.nist_csf_v2_rs_ma_03,
    benchmark.nist_csf_v2_rs_ma_04,
    benchmark.nist_csf_v2_rs_ma_05
  ]
}

benchmark "nist_csf_v2_rs_ma_01" {
  title       = "RS.MA-01"
  description = "The incident response plan is executed in coordination with relevant third parties once an incident is declared."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.securitycenter_email_configured,
    control.securitycenter_security_alerts_to_owner_enabled
  ]
}

benchmark "nist_csf_v2_rs_ma_02" {
  title       = "RS.MA-02"
  description = "Incident reports are triaged and validated."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_rs_ma_03" {
  title       = "RS.MA-03"
  description = "Incidents are categorized and prioritized."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_rs_ma_04" {
  title       = "RS.MA-04"
  description = "Incidents are escalated or elevated as needed."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_rs_ma_05" {
  title       = "RS.MA-05"
  description = "The criteria for initiating incident recovery are applied."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

# Incident Analysis (RS.AN)
benchmark "nist_csf_v2_rs_an" {
  title       = "Incident Analysis (RS.AN)"
  description = "Investigations are conducted to ensure effective response and support forensics and recovery activities."
  children = [
    benchmark.nist_csf_v2_rs_an_03,
    benchmark.nist_csf_v2_rs_an_06,
    benchmark.nist_csf_v2_rs_an_07,
    benchmark.nist_csf_v2_rs_an_08
  ]
}

benchmark "nist_csf_v2_rs_an_03" {
  title       = "RS.AN-03"
  description = "Analysis is performed to establish what has taken place during an incident and the root cause of the incident."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_rs_an_06" {
  title       = "RS.AN-06"
  description = "Actions performed during an investigation are recorded, and the records' integrity and provenance are preserved."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on,
    control.monitor_log_profile_retention_365_days,
    control.monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok,
    control.sql_server_auditing_storage_account_destination_retention_90_days
  ]
}

benchmark "nist_csf_v2_rs_an_07" {
  title       = "RS.AN-07"
  description = "Incident data and metadata are collected, and their integrity and provenance are preserved."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_rs_an_08" {
  title       = "RS.AN-08"
  description = "An incident's magnitude is estimated and validated."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

# Incident Response Reporting and Communication (RS.CO)
benchmark "nist_csf_v2_rs_co" {
  title       = "Incident Response Reporting and Communication (RS.CO)"
  description = "Response activities are coordinated with internal and external stakeholders as required by laws, regulations, or policies."
  children = [
    benchmark.nist_csf_v2_rs_co_02,
    benchmark.nist_csf_v2_rs_co_03
  ]
}

benchmark "nist_csf_v2_rs_co_02" {
  title       = "RS.CO-02"
  description = "Internal and external stakeholders are notified of incidents."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_rs_co_03" {
  title       = "RS.CO-03"
  description = "Information is shared with designated internal and external stakeholders."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

# Incident Mitigation (RS.MI)
benchmark "nist_csf_v2_rs_mi" {
  title       = "Incident Mitigation (RS.MI)"
  description = "Activities are performed to prevent expansion of an event and mitigate its effects."
  children = [
    benchmark.nist_csf_v2_rs_mi_01,
    benchmark.nist_csf_v2_rs_mi_02
  ]
}

benchmark "nist_csf_v2_rs_mi_01" {
  title       = "RS.MI-01"
  description = "Incidents are contained."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
}

benchmark "nist_csf_v2_rs_mi_02" {
  title       = "RS.MI-02"
  description = "Incidents are eradicated."
  children = [
    control.securitycenter_automatic_provisioning_monitoring_agent_on
  ]
} 