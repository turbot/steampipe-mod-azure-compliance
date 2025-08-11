locals {
  cis_v400_7_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "7"
  })
}

locals {
  cis_v400_7_1_common_tags = merge(local.cis_v400_7_common_tags, {
    cis_section_id = "7.1"
  })
  cis_v400_7_1_1_common_tags = merge(local.cis_v400_7_common_tags, {
    cis_section_id = "7.1.1"
  })
  cis_v400_7_1_2_common_tags = merge(local.cis_v400_7_common_tags, {
    cis_section_id = "7.1.2"
  })
  cis_v400_7_1_3_common_tags = merge(local.cis_v400_7_common_tags, {
    cis_section_id = "7.1.3"
  })
}

benchmark "cis_v400_7" {
  title         = "7 Management and Governance Services"
  documentation = file("./cis_v400/docs/cis_v400_7.md")
  children = [
    benchmark.cis_v400_7_1,
    control.cis_v400_7_2
  ]

  tags = merge(local.cis_v400_7_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v400_7_1" {
  title         = "7.1 Logging and Monitoring"
  documentation = file("./cis_v400/docs/cis_v400_7_1.md")
  children = [
    benchmark.cis_v400_7_1_1,
    benchmark.cis_v400_7_1_2,
    benchmark.cis_v400_7_1_3,
    control.cis_v400_7_1_4,
    control.cis_v400_7_1_5
  ]

  tags = merge(local.cis_v400_7_1_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v400_7_1_1" {
  title         = "7.1.1 Configuring Diagnostic Settings"
  documentation = file("./cis_v400/docs/cis_v400_7_1_1.md")
  children = [
    control.cis_v400_7_1_1_1,
    control.cis_v400_7_1_1_2,
    control.cis_v400_7_1_1_3,
    control.cis_v400_7_1_1_4,
    control.cis_v400_7_1_1_5,
    control.cis_v400_7_1_1_6,
    control.cis_v400_7_1_1_7,
    control.cis_v400_7_1_1_8,
    control.cis_v400_7_1_1_9,
    control.cis_v400_7_1_1_10
  ]

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_1" {
  title         = "7.1.1.1 Ensure that a 'Diagnostic Setting' exists for Subscription Activity Logs"
  description   = "Enable Diagnostic settings for exporting activity logs."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_1.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_2" {
  title         = "7.1.1.2 Ensure Diagnostic Setting captures appropriate categories"
  description   = "The diagnostic setting should be configured to log the appropriate activities from the control/management plane."
  query         = query.monitor_diagnostic_settings_captures_proper_categories
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_2.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_3" {
  title         = "7.1.1.3 Ensure the storage account containing the container with activity logs is encrypted with Customer Managed Key (CMK)"
  description   = "Storage accounts with the activity log exports can be configured to use Customer Managed Keys (CMK)."
  query         = query.monitor_logs_storage_container_insights_activity_logs_encrypted_with_byok
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_3.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.3"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_4" {
  title         = "7.1.1.4 Ensure that logging for Azure Key Vault is 'Enabled'"
  description   = "Enable AuditEvent logging for key vault instances to ensure interactions with key vaults are logged and available."
  query         = query.keyvault_logging_enabled
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_4.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_5" {
  title         = "7.1.1.5 Ensure that Network Security Group Flow logs are captured and sent to Log Analytics"
  description   = "Ensure that network flow logs are captured and fed into a central log analytics workspace."
  query         = query.nsg_network_watcher_flow_log_send_to_log_analytics
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_5.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_6" {
  title         = "7.1.1.6 Ensure that logging for Azure AppService 'HTTP logs' is enabled"
  description   = "Enable AppServiceHTTPLogs diagnostic log category for Azure App Service instances to ensure all http requests are captured and centrally logged."
  query         = query.appservice_web_app_diagnostic_log_category_http_log_enabled
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_6.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.6"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_7" {
  title         = "7.1.1.7 Ensure that virtual network flow logs are captured and sent to Log Analytics"
  description   = "Ensure that virtual network flow logs are captured and fed into a central log analytics workspace."
  query         = query.network_virtual_network_watcher_flow_log_send_to_log_analytics
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_7.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_8" {
  title         = "7.1.1.8 Ensure that a Microsoft Entra diagnostic setting exists to send Microsoft Graph activity logs to an appropriate destination"
  description   = "Ensure that a Microsoft Entra diagnostic setting is configured to send Microsoft Graph activity logs to a suitable destination, such as a Log Analytics workspace, storage account, or event hub."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_8.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_9" {
  title         = "7.1.1.9 Ensure that a Microsoft Entra diagnostic setting exists to send Microsoft Entra activity logs to an appropriate destination"
  description   = "Ensure that a Microsoft Entra diagnostic setting is configured to send Microsoft Entra activity logs to a suitable destination, such as a Log Analytics workspace, storage account, or event hub."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_9.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_1_10" {
  title         = "7.1.1.10 Ensure that Intune logs are captured and sent to Log Analytics"
  description   = "Ensure that Intune logs are captured and fed into a central log analytics workspace."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_1_10.md")

  tags = merge(local.cis_v400_7_1_1_common_tags, {
    cis_item_id = "7.1.1.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

benchmark "cis_v400_7_1_2" {
  title         = "7.1.2 Monitoring using Activity Log Alerts"
  documentation = file("./cis_v400/docs/cis_v400_7_1_2.md")
  children = [
    control.cis_v400_7_1_2_1,
    control.cis_v400_7_1_2_2,
    control.cis_v400_7_1_2_3,
    control.cis_v400_7_1_2_4,
    control.cis_v400_7_1_2_5,
    control.cis_v400_7_1_2_6,
    control.cis_v400_7_1_2_7,
    control.cis_v400_7_1_2_8,
    control.cis_v400_7_1_2_9,
    control.cis_v400_7_1_2_10,
    control.cis_v400_7_1_2_11
  ]

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_1" {
  title         = "7.1.2.1 Ensure that Activity Log Alert exists for Create Policy Assignment"
  description   = "Create an activity log alert for the Create Policy Assignment event."
  query         = query.monitor_log_alert_create_policy_assignment
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_1.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_2" {
  title         = "7.1.2.2 Ensure that Activity Log Alert exists for Delete Policy Assignment"
  description   = "Create an activity log alert for the Delete Policy Assignment event."
  query         = query.monitor_log_alert_delete_policy_assignment
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_2.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_3" {
  title         = "7.1.2.3 Ensure that Activity Log Alert exists for Create or Update Network Security Group"
  description   = "Create an Activity Log Alert for the Create or Update Network Security Group event."
  query         = query.monitor_log_alert_create_update_nsg
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_3.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_4" {
  title         = "7.1.2.4 Ensure that Activity Log Alert exists for Delete Network Security Group"
  description   = "Create an activity log alert for the Delete Network Security Group event."
  query         = query.monitor_log_alert_delete_nsg
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_4.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_5" {
  title         = "7.1.2.5 Ensure that Activity Log Alert exists for Create or Update Security Solution"
  description   = "Create an activity log alert for the Create or Update Security Solution event."
  query         = query.monitor_log_alert_create_update_security_solution
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_5.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.5"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_6" {
  title         = "7.1.2.6 Ensure that Activity Log Alert exists for Delete Security Solution"
  description   = "Create an activity log alert for the Delete Security Solution event."
  query         = query.monitor_log_alert_delete_security_solution
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_6.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.6"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_7" {
  title         = "7.1.2.7 Ensure that Activity Log Alert exists for Create or Update SQL Server Firewall Rule"
  description   = "Create an activity log alert for the Create or Update SQL Server Firewall Rule event."
  query         = query.monitor_log_alert_create_update_sql_servers_firewall_rule
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_7.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_8" {
  title         = "7.1.2.8 Ensure that Activity Log Alert exists for Delete SQL Server Firewall Rule"
  description   = "Create an activity log alert for the \"Delete SQL Server Firewall Rule."
  query         = query.monitor_log_alert_delete_sql_servers_firewall_rule
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_8.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_9" {
  title         = "7.1.2.9 Ensure that Activity Log Alert exists for Create or Update Public IP Address rule"
  description   = "Create an activity log alert for the Create or Update Public IP Addresses rule."
  query         = query.monitor_log_alert_create_update_public_ip_address
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_9.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_10" {
  title         = "7.1.2.10 Ensure that Activity Log Alert exists for Delete Public IP Address rule"
  description   = "Create an activity log alert for the Delete Public IP Address rule."
  query         = query.monitor_log_alert_delete_public_ip_address
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_10.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.10"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_2_11" {
  title         = "7.1.2.11 Ensure that an Activity Log Alert exists for Service Health"
  description   = "Create an activity log alert for Service Health."
  query         = query.monitor_log_alert_service_health
  documentation = file("./cis_v400/docs/cis_v400_7_1_2_11.md")

  tags = merge(local.cis_v400_7_1_2_common_tags, {
    cis_item_id = "7.1.2.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

benchmark "cis_v400_7_1_3" {
  title         = "7.1.3 Configuring Application Insights"
  documentation = file("./cis_v400/docs/cis_v400_7_1_3.md")
  children = [
    control.cis_v400_7_1_3_1
  ]

  tags = merge(local.cis_v400_7_1_3_common_tags, {
    type    = "Benchmark"
    service = "Azure/Monitor"
  })
}

control "cis_v400_7_1_3_1" {
  title         = "7.1.3.1 Ensure Application Insights are Configured"
  description   = "Application Insights within Azure act as an Application Performance Monitoring solution providing valuable data into how well an application performs and additional information when performing incident response."
  query         = query.monitor_application_insights_configured
  documentation = file("./cis_v400/docs/cis_v400_7_1_3_1.md")

  tags = merge(local.cis_v400_7_1_3_common_tags, {
    cis_item_id = "7.1.3.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_4" {
  title         = "7.1.4 Ensure that Azure Monitor Resource Logging is Enabled for All Services that Support it"
  description   = "Resource Logs capture activity to the data access plane while the Activity log is a subscription-level log for the control plane."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_4.md")

  tags = merge(local.cis_v400_7_1_common_tags, {
    cis_item_id = "7.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_1_5" {
  title         = "7.1.5 Ensure that SKU Basic/Consumption is not used on artifacts that need to be monitored (Particularly for Production Workloads)"
  description   = "The use of Basic or Free SKUs in Azure whilst cost effective have significant limitations in terms of what can be monitored and what support can be realized from Microsoft."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_1_5.md")

  tags = merge(local.cis_v400_7_1_common_tags, {
    cis_item_id = "7.1.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "Azure/Monitor"
  })
}

control "cis_v400_7_2" {
  title         = "7.2 Ensure that Resource Locks are set for Mission-Critical Azure Resources"
  description   = "Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion of, or modifications to, a resource."
  query         = query.manual_control
  documentation = file("./cis_v400/docs/cis_v400_7_2.md")

  tags = merge(local.cis_v400_7_common_tags, {
    cis_item_id = "7.2"
    cis_level   = "2"
    cis_type    = "manual"
  })
}
