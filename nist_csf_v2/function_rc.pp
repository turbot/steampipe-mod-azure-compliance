benchmark "nist_csf_v2_rc" {
  title       = "Recover (RC)"
  description = "Assets and operations affected by a cybersecurity incident are restored."
  children = [
    benchmark.nist_csf_v2_rc_rp,
    benchmark.nist_csf_v2_rc_co
  ]
}

# Incident Recovery Plan Execution (RC.RP)
benchmark "nist_csf_v2_rc_rp" {
  title       = "Incident Recovery Plan Execution (RC.RP)"
  description = "Restoration activities are performed to ensure operational availability of systems and services affected by cybersecurity incidents."
  children = [
    benchmark.nist_csf_v2_rc_rp_01,
    benchmark.nist_csf_v2_rc_rp_02,
    benchmark.nist_csf_v2_rc_rp_03,
    benchmark.nist_csf_v2_rc_rp_04,
    benchmark.nist_csf_v2_rc_rp_05,
    benchmark.nist_csf_v2_rc_rp_06
  ]
}

benchmark "nist_csf_v2_rc_rp_01" {
  title       = "RC.RP-01"
  description = "The recovery portion of the incident response plan is executed once initiated from the incident response process."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_02" {
  title       = "RC.RP-02"
  description = "Recovery actions are selected, scoped, prioritized, and performed."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_03" {
  title       = "RC.RP-03"
  description = "The integrity of backups and other restoration assets is verified before using them for restoration."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled,
    control.storage_account_geo_redundant_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_04" {
  title       = "RC.RP-04"
  description = "Critical mission functions and cybersecurity risk management are considered to establish post-incident operational norms."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_05" {
  title       = "RC.RP-05"
  description = "The integrity of restored assets is verified, systems and services are restored, and normal operating status is confirmed."
  children = [
    control.sql_database_long_term_geo_redundant_backup_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_06" {
  title       = "RC.RP-06"
  description = "The end of incident recovery is declared based on criteria, and incident-related documentation is completed."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

# Incident Recovery Communication (RC.CO)
benchmark "nist_csf_v2_rc_co" {
  title       = "Incident Recovery Communication (RC.CO)"
  description = "Restoration activities are coordinated with internal and external parties."
  children = [
    benchmark.nist_csf_v2_rc_co_03,
    benchmark.nist_csf_v2_rc_co_04
  ]
}

benchmark "nist_csf_v2_rc_co_03" {
  title       = "RC.CO-03"
  description = "Recovery activities and progress in restoring operational capabilities are communicated to designated internal and external stakeholders."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
}

benchmark "nist_csf_v2_rc_co_04" {
  title       = "RC.CO-04"
  description = "Public updates on incident recovery are shared using approved methods and messaging."
  children = [
    control.securitycenter_notify_alerts_configured
  ]
} 