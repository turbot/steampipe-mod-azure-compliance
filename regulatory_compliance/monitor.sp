locals {
  regulatory_compliance_monitor_common_tags = {
    service = "monitor"
  }
}

control "audit_diagnostic_setting" {
  title       = "Audit diagnostic setting"
  description = "Audit diagnostic setting for selected resource types."
  sql         = query.manual_control_hipaa.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
    soc_2             = "true"
  })
}

control "monitor_diagnostic_settings_captures_proper_categories" {
  title       = "Ensure Diagnostic Setting captures appropriate categories"
  description = "The diagnostic setting should be configured to log the appropriate activities from the control/management plane."
  sql         = query.monitor_diagnostic_settings_captures_proper_categories.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
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

control "monitor_log_profile_enabled_for_all_categories" {
  title       = "Azure Monitor log profile should collect logs for categories 'write,' 'delete,' and 'action'"
  description = "This policy ensures that a log profile collects logs for categories 'write,' 'delete,' and 'action'."
  sql         = query.monitor_log_profile_enabled_for_all_categories.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
  })
}

control "monitor_logs_storage_container_encryptes_with_byok" {
  title       = "Ensure the storage account containing the container with activity logs is encrypted with BYOK (Use Your Own Key)."
  description = "Configuring the storage account with the activity log export container to use BYOK (Use Your Own Key) provides additional confidentiality controls on log data as a given user must have read permission on the corresponding storage account and must be granted decrypt permission by the CMK." 
  sql         = query.monitor_logs_storage_container_encryptes_with_byok.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_logs_storage_container_not_public_accessible" {
  title       = "Ensure the storage container storing the activity logs is not publicly accessible."
  description = "Allowing public access to activity log content may aid an adversary in identifying weaknesses in the affected account's use or configuration."
  sql         = query.monitor_logs_storage_container_not_public_accessible.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_create_policy_assignment" {
  title       = "Ensure that Activity Log Alert exists for Create Policy Assignment"
  description = "Create an activity log alert for the Create Policy Assignment event."
  sql         = query.monitor_log_alert_create_policy_assignment.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_for_administrative_operations" {
  title       = "An activity log alert should exist for specific Administrative operations"
  description = "This policy audits specific Administrative operations with no activity log alerts configured."
  sql         = query.monitor_log_alert_for_administrative_operations.sql

  tags = merge(local.regulatory_compliance_monitor_common_tags, {
    hipaa_hitrust_v92 = "true"
    soc_2             = "true"
  })
}

control "monitor_log_alert_create_update_nsg" {
  title       = "Ensure that Activity Log Alert exists for Create or Update Network Security Group."
  description = "Create an Activity Log Alert for the 'Create' or 'Update Network Security Group' event."
  sql         = query.monitor_log_alert_create_update_nsg.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_create_update_nsg_rule" {
  title       = "Ensure that Activity Log Alert exists for Create or Update Network Security Group Rule."
  description = "Create an activity log alert for the Create or Update Network Security Group Rule event."
  sql         = query.monitor_log_alert_create_update_nsg_rule.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_create_update_security_solution" {
  title       = "Ensure that Activity Log Alert exists for Create or Update Security Solution."
  description = "Create an activity log alert for the Create or Update Security Solution event."
  sql         = query.monitor_log_alert_create_update_security_solution.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_delete_nsg" {
  title       = "Ensure that Activity Log Alert exists for Delete Network Security Group."
  description = "Create an Activity Log Alert for the Delete Network Security Group event."
  sql         = query.monitor_log_alert_delete_nsg.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_delete_nsg_rule" {
  title       = "Ensure that Activity Log Alert exists for Create or Update Network Security Group Rule"
  description = "Create an activity log alert for the Delete Network Security Group Rule event."
  sql         = query.monitor_log_alert_delete_nsg_rule.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_delete_policy_assignment" {
  title       = "Ensure that Activity Log Alert exists for Delete Policy Assignment."
  description = "Create an activity log alert for the Create Policy Assignment event."
  sql         = query.monitor_log_alert_delete_policy_assignment.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_delete_security_solution" {
  title       = "Ensure that Activity Log Alert exists for Delete Security Solution"
  description = "Create an activity log alert for the Delete Security Solution event."
  sql         = query.monitor_log_alert_delete_security_solution.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}

control "monitor_log_alert_sql_firewall_rule" {
  title       = "Ensure that Activity Log Alert exists for Create or Update or Delete SQL Server Firewall Rule."
  description = "Create an activity log alert for the Create or Update or Delete SQL Server Firewall Rule event."
  sql         = query.monitor_log_alert_sql_firewall_rule.sql

  tags = merge(local.regulatory_compliance_sql_common_tags, {
    soc_2 = "true"
  })
}